//
//  BYCSViewController.m
//  Apps
//
//  Created by by on 2017/6/18.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYCSViewController.h"
#import "BYHttpEngine.h"

@interface BYCSViewController ()

@property (nonatomic, strong) UIButton *btnGet;
@property (nonatomic, strong) UIButton *btnPost;
@property (nonatomic, strong) UIButton *btnData;
@property (nonatomic, strong) UIButton *btnJSON;
@property (nonatomic, strong) UITextView *resultView;
@property (nonatomic, assign) NSInteger requestTypeFlag;

@end

@implementation BYCSViewController

#pragma mark- Live circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
- (void)choiceNetWorkRequestType:(UIButton *)sender
{
	if (self.requestTypeFlag == sender.tag) {
		return;
	}
	
	self.requestTypeFlag = sender.tag;
	
	UIButton *btnG = [self.view viewWithTag:RequestTypeGet];
	UIButton *btnP = [self.view viewWithTag:RequestTypePost];
	
	btnG.selected = self.requestTypeFlag == RequestTypeGet ? YES : NO;
	btnP.selected = self.requestTypeFlag == RequestTypePost ? YES : NO;
}

- (void)netWorkRequest:(UIButton *)sender
{
	NSInteger type = sender.tag;
	
	UIButton *btnD = [self.view viewWithTag:RequestResultTypeData];
	UIButton *btnJ = [self.view viewWithTag:RequestResultTypeJSON];
	
	btnD.selected = type == RequestResultTypeData ? YES : NO;
	btnJ.selected = type == RequestResultTypeJSON ? YES : NO;
	
    NSString *interFaceString = @"http://localhost:8080/ServletProject/RegisterServlet";
    NSDictionary *paramsDic = @{@"account":@"TestABC111",@"password":@"test1234567"};
    
    [BYHttpEngine requestServerDataWithInterface:interFaceString params:paramsDic requestType:self.requestTypeFlag completionHandler:^(NSData *responseData) {
		
		NSString *resultObj;
		if (type == RequestResultTypeData) {
			resultObj = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
			NSLog(@"request result with data format : \n%@", resultObj);
		} else {
			NSDictionary *resultObjDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
			NSString *tmpStr = resultObjDic[@"resMsg"];
			resultObj = [NSString stringWithFormat:@"requestResult : \n%@", resultObjDic];
			NSLog(@"request result with json format : \n%@", resultObj);
			NSLog(@"####### value : %@", tmpStr);
		}
		self.resultView.text = resultObj;
    } errorHandler:^(NSError *error) {
        NSLog(@"error result : %s ### %@", __func__, error.description);
        self.resultView.text = [NSString stringWithFormat:@"error : %@", error.description];
    }];
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
    self.view.backgroundColor = BG_Color;
	
	[self.view addSubview:self.btnGet];
	[self.view addSubview:self.btnPost];
    [self.view addSubview:self.btnData];
	[self.view addSubview:self.btnJSON];
    [self.view addSubview:self.resultView];
    
    [self.resultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(CGRectGetMaxY(self.btnData.frame) + 20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
	
	self.requestTypeFlag = RequestTypeGet;
	self.btnGet.selected = YES;
}

#pragma mark- Setter and getter
- (UIButton *)btnGet
{
	if (!_btnGet) {
		_btnGet = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, 90, 30)];
		_btnGet.tag = RequestTypeGet;
		_btnGet.backgroundColor = WHITE_COLOR;
		_btnGet.layer.cornerRadius = 5.0f;
		[_btnGet setTitle:@"ReqGet" forState:UIControlStateNormal];
		[_btnGet setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
		[_btnGet setBackgroundImage:[BYUtils imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateSelected];
		[_btnGet addTarget:self action:@selector(choiceNetWorkRequestType:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _btnGet;
}

- (UIButton *)btnPost
{
	if (!_btnPost) {
		_btnPost = [[UIButton alloc] initWithFrame:CGRectMake(140, 10, 90, 30)];
		_btnPost.tag = RequestTypePost;
		_btnPost.backgroundColor = WHITE_COLOR;
		_btnPost.layer.cornerRadius = 5.0f;
		[_btnPost setTitle:@"ReqPost" forState:UIControlStateNormal];
		[_btnPost setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
		[_btnPost setBackgroundImage:[BYUtils imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateSelected];
		[_btnPost addTarget:self action:@selector(choiceNetWorkRequestType:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _btnPost;
}

- (UIButton *)btnData
{
    if (!_btnData) {
        _btnData = [[UIButton alloc] initWithFrame:CGRectMake(20, 50, 90, 30)];
		_btnData.tag = RequestResultTypeData;
        _btnData.backgroundColor = WHITE_COLOR;
        _btnData.layer.cornerRadius = 5.0f;
        [_btnData setTitle:@"ResData" forState:UIControlStateNormal];
        [_btnData setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
		[_btnData setBackgroundImage:[BYUtils imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateSelected];
		[_btnData addTarget:self action:@selector(netWorkRequest:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnData;
}

- (UIButton *)btnJSON
{
	if (!_btnJSON) {
		_btnJSON = [[UIButton alloc] initWithFrame:CGRectMake(140, 50, 90, 30)];
		_btnJSON.tag = RequestResultTypeJSON;
		_btnJSON.backgroundColor = WHITE_COLOR;
		_btnJSON.layer.cornerRadius = 5.0f;
		[_btnJSON setTitle:@"ResJSON" forState:UIControlStateNormal];
		[_btnJSON setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
		[_btnJSON setBackgroundImage:[BYUtils imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateSelected];
		[_btnJSON addTarget:self action:@selector(netWorkRequest:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _btnJSON;
}

- (UITextView *)resultView
{
    if (!_resultView) {
        _resultView = [UITextView autoLayoutTextView];
        _resultView.layer.cornerRadius = 5.0f;
        _resultView.layer.masksToBounds = YES;
        _resultView.backgroundColor = WHITE_COLOR;
        _resultView.textColor = BLACK_COLOR;
        _resultView.textAlignment = NSTextAlignmentCenter;
    }
    return _resultView;
}

#pragma mark- Square area

@end
