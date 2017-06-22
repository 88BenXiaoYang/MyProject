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

@property (nonatomic, strong) UIButton *requestBtn;
@property (nonatomic, strong) UITextView *resultView;

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
- (void)netWorkRequest
{
    NSString *interFaceString = @"http://localhost:8080/webproject/RegisterServlet";
    NSDictionary *paramsDic = @{@"account":@"TestABC",@"password":@"test123456"};
    
    [BYHttpEngine requestServerDataWithInterface:interFaceString params:paramsDic completionHandler:^(NSData *responseData) {
//        NSString *resultObj = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//        NSLog(@"request result with data format : \n%@", resultObj);
        NSDictionary *resultObj = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"request result with json format : \n%@", resultObj);
        
        self.resultView.text = [NSString stringWithFormat:@"requestResult : \n%@", resultObj];
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
    [self.view addSubview:self.requestBtn];
    [self.view addSubview:self.resultView];
    
    [self.resultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(CGRectGetMaxY(self.requestBtn.frame) + 20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
}

#pragma mark- Setter and getter
- (UIButton *)requestBtn
{
    if (!_requestBtn) {
        _requestBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 200, 40)];
        _requestBtn.backgroundColor = WHITE_COLOR;
        _requestBtn.layer.cornerRadius = 5.0f;
        [_requestBtn setTitle:@"NetWorkRequest" forState:UIControlStateNormal];
        [_requestBtn setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [_requestBtn addTarget:self action:@selector(netWorkRequest) forControlEvents:UIControlEventTouchUpInside];
    }
    return _requestBtn;
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
