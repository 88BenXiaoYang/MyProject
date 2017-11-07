//
//  BYAViewController.m
//  Apps
//
//  Created by BianYong on 16/9/23.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYAViewController.h"
#import "BYDemoListCell.h"
#import "BYLayoutViewController.h"
#import "BYAppSkipViewController.h"
#import "BYCheckBoxViewController.h"
#import "BYDrawImageViewController.h"
#import "BYSwitchAViewController.h"
#import "BYScrollPagerContentViewController.h"
#import "BYChartViewController.h"
#import "BYLoadLocalDBDataViewController.h"
#import "BYPayViewController.h"
#import "BYCSViewController.h"
#import "BYAVViewController.h"
#import "BYChartsViewController.h"
#import "TmpModel.h"
#import "BYRCDemoViewController.h"

@interface BYAViewController ()

@property (nonatomic, strong) NSMutableArray *demoList;

@end

@implementation BYAViewController
#pragma mark- Live circle
- (id)init {
	if (self = [super init]) {
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"List"; //set tabBarItem.title and con.title
	
	[self initSettingData];
	//[self testHanZiToPinYin];
    //[self objToDictionary];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _demoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[BYDemoListCell reuseIdentifier]];
	
	NSString *demoName = [_demoList objectAtIndex:indexPath.row];
	
	cell.textLabel.text = demoName;
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 0) {
		[self goLayoutElementVC];
	} else if (indexPath.row == 1) {
		[self goSkipToAppStore];
	} else if (indexPath.row == 2) {
		[self goCheckBox];
	} else if (indexPath.row == 3) {
		[self goDrawImgVC];
	} else if (indexPath.row == 4) {
		[self goSwitchAVC];
	} else if (indexPath.row == 5) {
		[self goScrollPagerView];
	} else if (indexPath.row == 6) {
		[self goChartView];
	} else if (indexPath.row == 7) {
		[self goLoadLocalDBData];
	} else if (indexPath.row == 8) {
		[self goPayAndShare];
    } else if (indexPath.row == 9) {
        [self goCSRequest];
    } else if (indexPath.row == 10) {
        [self goAVVC];
    } else if (indexPath.row == 11) {
        [self goChartsVC];
    } else if (indexPath.row == 12) {
        [self goRCDemoVC];
    }
}

#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initSettingData
{
	self.demoList = [NSMutableArray arrayWithObjects:@"按钮元素布局", @"应用跳转到AppStore", @"CheckBox", @"BezierPathImg", @"SwitchUI", @"ScrollPagerView", @"ChartView", @"LoadLocalDBData", @"Pay&Share", @"c/s_request", @"A/V", @"ChartsVC", @"RCDemo", nil];
	
	[self.table registerClass:[BYDemoListCell class] forCellReuseIdentifier:[BYDemoListCell reuseIdentifier]];
}

- (void)goLayoutElementVC
{
	BYLayoutViewController *layoutVC = [[BYLayoutViewController alloc] init];
	layoutVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:layoutVC animated:YES];
}

- (void)goSkipToAppStore
{
	BYAppSkipViewController *appSkipVC = [[BYAppSkipViewController alloc] init];
	appSkipVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:appSkipVC animated:YES];
}

- (void)goCheckBox
{
	BYCheckBoxViewController *checkBoxVC = [[BYCheckBoxViewController alloc] init];
	checkBoxVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:checkBoxVC animated:YES];
}

- (void)goDrawImgVC
{
	BYDrawImageViewController *drawImgVC = [[BYDrawImageViewController alloc] init];
	drawImgVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:drawImgVC animated:YES];
}

- (void)goSwitchAVC
{
	BYSwitchAViewController *switchAVC = [[BYSwitchAViewController alloc] init];
	switchAVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:switchAVC animated:YES];
}

- (void)goScrollPagerView
{
	BYScrollPagerContentViewController *scrollPagerVC = [[BYScrollPagerContentViewController alloc] init];
	scrollPagerVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:scrollPagerVC animated:YES];
}

- (void)goChartView
{
	BYChartViewController *chartVC = [[BYChartViewController alloc] init];
	chartVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:chartVC animated:YES];
}

- (void)goLoadLocalDBData
{
	BYLoadLocalDBDataViewController *loadLocalDBDataVC = [[BYLoadLocalDBDataViewController alloc] init];
	loadLocalDBDataVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:loadLocalDBDataVC animated:YES];
}

- (void)goPayAndShare
{
	BYPayViewController *payVC = [[BYPayViewController alloc] init];
	payVC.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:payVC animated:YES];
}

- (void)goCSRequest
{
    BYCSViewController *csVC = [[BYCSViewController alloc] init];
    csVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:csVC animated:YES];
}

- (void)goAVVC
{
    BYAVViewController *avVC = [[BYAVViewController alloc] init];
    avVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:avVC animated:YES];
}

- (void)goChartsVC
{
    BYChartsViewController *chartsVC = [[BYChartsViewController alloc] init];
    chartsVC.title = @"ChartsVC";
    chartsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chartsVC animated:YES];
}

- (void)goRCDemoVC
{
    BYRCDemoViewController *rcDemoVC = [[BYRCDemoViewController alloc] init];
    rcDemoVC.title = @"RCDemo";
    rcDemoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:rcDemoVC animated:YES];
}

#pragma mark- common test methods
- (void)testHanZiToPinYin
{
	NSString *hanziStr = @"拼音测试";
	NSString *pinyinStr = [hanziStr pinyin];
	NSLog(@"汉字转拼音\n汉字：%@\n拼音：%@", hanziStr, pinyinStr);
}

- (void)objToDictionary
{
    Animal *aniA = [[Animal alloc] init];
    aniA.type = @11;
    aniA.animalName = @"cat";
    
    Animal *aniB = [[Animal alloc] init];
    aniB.type = @22;
    aniB.animalName = @"dog";
    
    TmpModel *tpM = [[TmpModel alloc] init];
    tpM.age = @21;
    tpM.name = @"xyz";
    tpM.animals = @[aniA, aniB];
    
    NSDictionary *tmpDict = [self customObjToDictionaryWC:tpM];
    NSLog(@"dictionary detail : %@", tmpDict);
    NSString *jsonSting = [self dataToJsonStringWithObject:tmpDict];
    NSLog(@"obj to json string : %@", jsonSting);
}

- (NSDictionary *)customObjToDictionaryWA:(id)obj
{
    NSString *className = NSStringFromClass([obj class]);
    const char *classN = [className UTF8String];
    id theClass = objc_getClass(classN);
    unsigned int count;
    objc_property_t *props = class_copyPropertyList(theClass, &count);
    
    NSMutableArray *propertyNames = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        objc_property_t property = props[i];
        NSString *propertyNameString = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [propertyNames addObject:propertyNameString];
    }
    
    NSMutableDictionary *kvDict = [NSMutableDictionary dictionaryWithCapacity:count];
    for (NSString *key in propertyNames) {
        SEL selector = NSSelectorFromString(key);
        id value = [obj performSelector:selector];
        
        if (value == nil) {
            value = [NSNull null];
        }
        
        [kvDict setObject:value forKey:key];
    }
    
    return kvDict;
}

- (NSDictionary *)customObjToDictionaryWB:(id)obj
{
    unsigned int propertyCount;
    Ivar *ivs = class_copyIvarList([obj class], &propertyCount);
    
    NSMutableDictionary *kvDict = [NSMutableDictionary dictionaryWithCapacity:propertyCount];
    
    NSMutableArray *arrayElements = [NSMutableArray array];
    
    //检查是否含有数组属性
    for (int i = 0; i < propertyCount; i++) {
        Ivar iv = ivs[i];
        const char *propertyType = ivar_getTypeEncoding(iv);
        
        NSString *propertyTypeString = [[NSString alloc] initWithCString:propertyType encoding:NSUTF8StringEncoding];
        
        if ([propertyTypeString containsString:@"NSArray"] || [propertyTypeString containsString:@"NSMutableArray"]) {
            id value = object_getIvar(obj, iv);
            [arrayElements addObjectsFromArray:value];
        }
    }
    
    NSMutableArray *dictElements = [NSMutableArray array];
    //将自定义对象转换成字典
    for (id v in arrayElements) {
        NSDictionary *tpDict = [self customObjToDictionaryWB:v];
        [dictElements addObject:tpDict];
    }
    
    for (int i = 0; i < propertyCount; i++) {
        Ivar iv = ivs[i];
        const char *propertyName = ivar_getName(iv);
        const char *propertyType = ivar_getTypeEncoding(iv);
        
        NSString *propertyNameString = [[NSString alloc] initWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSString *propertyTypeString = [[NSString alloc] initWithCString:propertyType encoding:NSUTF8StringEncoding];
        
        if (![propertyTypeString hasPrefix:@"@"]) {
            NSNumber *numberValue = [NSNumber numberWithLong:10];
            [kvDict setObject:numberValue forKey:propertyNameString];
        } else {
            id value = object_getIvar(obj, iv);
            if ([propertyTypeString containsString:@"NSArray"] || [propertyTypeString containsString:@"NSMutableArray"]) {
                [kvDict setObject:dictElements forKey:propertyNameString];
            } else {
                [kvDict setObject:value forKey:propertyNameString];
            }
        }
    }
    
    return kvDict;
}

- (NSDictionary *)customObjToDictionaryWC:(id)obj
{
    unsigned int propertyCount;
    Ivar *ivs = class_copyIvarList([obj class], &propertyCount);
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    NSMutableDictionary *kvDict = [NSMutableDictionary dictionaryWithCapacity:propertyCount];
    
    NSMutableArray *arrayElements = [NSMutableArray array];
    
    //检查是否含有数组属性
    for (int i = 0; i < propertyCount; i++) {
        Ivar iv = ivs[i];
        const char *propertyType = ivar_getTypeEncoding(iv);
        
        NSString *propertyTypeString = [[NSString alloc] initWithCString:propertyType encoding:NSUTF8StringEncoding];
        
        if ([propertyTypeString containsString:@"NSArray"] || [propertyTypeString containsString:@"NSMutableArray"]) {
            id value = object_getIvar(obj, iv);
            [arrayElements addObjectsFromArray:value];
        }
    }
    
    NSMutableArray *dictElements = [NSMutableArray array];
    //将自定义对象转换成字典
    for (id v in arrayElements) {
        NSDictionary *tpDict = [self customObjToDictionaryWC:v];
        [dictElements addObject:tpDict];
    }
    
    for (int i = 0; i < propertyCount; i++) {
        //获取属性名称
        objc_property_t property = properties[i];
        NSString *propertyNameString = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        //判断属性类型
        Ivar iv = ivs[i];
        const char *propertyType = ivar_getTypeEncoding(iv);
        NSString *propertyTypeString = [[NSString alloc] initWithCString:propertyType encoding:NSUTF8StringEncoding];
        
        if (![propertyTypeString hasPrefix:@"@"]) {
            NSNumber *numberValue = [NSNumber numberWithInt:00];
            [kvDict setObject:numberValue forKey:propertyNameString];
        } else {
            id value = object_getIvar(obj, iv);
            if ([propertyTypeString containsString:@"NSArray"] || [propertyTypeString containsString:@"NSMutableArray"]) {
                [kvDict setObject:dictElements forKey:propertyNameString];
            } else {
                [kvDict setObject:value forKey:propertyNameString];
            }
        }
    }
    
    return kvDict;
}

- (NSString *)dataToJsonStringWithObject:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return jsonString;
}

#pragma mark- Setter and getter
- (NSMutableArray *)demoList
{
	if (!_demoList) {
		_demoList = [NSMutableArray array];
	}
	return _demoList;
}

#pragma mark- Square area

@end
