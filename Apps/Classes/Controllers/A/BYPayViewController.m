//
//  BYPayViewController.m
//  Apps
//
//  Created by BianYong on 17/6/1.
//  Copyright © 2017年 BY. All rights reserved.
//

#import "BYPayViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "RSADataSigner.h"
#import "WXApi.h"
#import "BYUtils.h"
#import "BYHttpEngine.h"
#import "WXOrder.h"

@interface BYPayViewController ()

@property (nonatomic, strong) UIButton *aliPayBtn;
@property (nonatomic, strong) UIButton *wxPayBtn;

@end

@implementation BYPayViewController
#pragma mark- Live circle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self initSetting];
	[self layoutElements];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark- Overwrite
#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
- (void)goAliPay:(UIButton *)sender
{
	NSLog(@"支付宝支付");
	[self doAlipayPay];
}

- (void)goWXPay:(UIButton *)sender
{
	NSLog(@"微信支付");
    [self doWXPay];
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)initSetting
{
	self.title = @"Pay";
	self.view.backgroundColor = BG_Color;
}

- (void)layoutElements
{
	[self.view addSubview:self.aliPayBtn];
	[self.view addSubview:self.wxPayBtn];
}

- (NSString *)generateTradeNO
{
	static int kNumber = 15;
	
	NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	NSMutableString *resultStr = [[NSMutableString alloc] init];
	srand((unsigned)time(0));
	for (int i = 0; i < kNumber; i++)
	{
		unsigned index = rand() % [sourceStr length];
		NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
		[resultStr appendString:oneStr];
	}
	return resultStr;
}

#pragma mark- ==============点击订单模拟支付行为==============
//
//选中商品调用支付宝极简支付
//
- (void)doAlipayPay
{
	//重要说明
	//这里只是为了方便直接向商户展示支付宝的整个支付流程；所以Demo中加签过程直接放在客户端完成；
	//真实App里，privateKey等数据严禁放在客户端，加签过程务必要放在服务端完成；
	//防止商户私密数据泄露，造成不必要的资金损失，及面临各种安全风险；
	/*============================================================================*/
	/*=======================需要填写商户app申请的===================================*/
	/*============================================================================*/
	NSString *appID = ALIPAY_APPID;
	
	// 如下私钥，rsa2PrivateKey 或者 rsaPrivateKey 只需要填入一个
	// 如果商户两个都设置了，优先使用 rsa2PrivateKey
	// rsa2PrivateKey 可以保证商户交易在更加安全的环境下进行，建议使用 rsa2PrivateKey
	// 获取 rsa2PrivateKey，建议使用支付宝提供的公私钥生成工具生成，
	// 工具地址：https://doc.open.alipay.com/docs/doc.htm?treeId=291&articleId=106097&docType=1
	NSString *rsa2PrivateKey = @"";
	NSString *rsaPrivateKey = ALIPAY_PRIVATEKEY;
	/*============================================================================*/
	/*============================================================================*/
	/*============================================================================*/
	
	//partner和seller获取失败,提示
	if ([appID length] == 0 ||
		([rsa2PrivateKey length] == 0 && [rsaPrivateKey length] == 0))
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
														message:@"缺少appId或者私钥。"
													   delegate:self
											  cancelButtonTitle:@"确定"
											  otherButtonTitles:nil];
		[alert show];
		return;
	}
	
	/*
	 *生成订单信息及签名
	 */
	//将商品信息赋予AlixPayOrder的成员变量
	Order* order = [Order new];
	
	// NOTE: app_id设置
	order.app_id = appID;
	
	// NOTE: 支付接口名称
	order.method = @"alipay.trade.app.pay";
	
	// NOTE: 参数编码格式
	order.charset = @"utf-8";
	
	// NOTE: 当前时间点
	NSDateFormatter* formatter = [NSDateFormatter new];
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	order.timestamp = [formatter stringFromDate:[NSDate date]];
	
	// NOTE: 支付版本
	order.version = @"1.0";
	
	// NOTE: sign_type 根据商户设置的私钥来决定
	order.sign_type = (rsa2PrivateKey.length > 1)?@"RSA2":@"RSA";
	
	// NOTE: 商品数据
	order.biz_content = [BizContent new];
	order.biz_content.body = @"我是测试数据";
	order.biz_content.subject = @"1";
	order.biz_content.out_trade_no = [self generateTradeNO]; //订单ID（由商家自行制定）
	order.biz_content.timeout_express = @"30m"; //超时时间设置
	order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", 0.01]; //商品价格
	
	//将商品信息拼接成字符串
	NSString *orderInfo = [order orderInfoEncoded:NO];
	NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
	NSLog(@"orderSpec = %@",orderInfo);
	
	// NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
	//       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
	NSString *signedString = nil;
	RSADataSigner* signer = [[RSADataSigner alloc] initWithPrivateKey:((rsa2PrivateKey.length > 1)?rsa2PrivateKey:rsaPrivateKey)];
	if ((rsa2PrivateKey.length > 1)) {
		signedString = [signer signString:orderInfo withRSA2:YES];
	} else {
		signedString = [signer signString:orderInfo withRSA2:NO];
	}
	
	//test
//	signedString = TEXT_SIGNSTRING;
	// NOTE: 如果加签成功，则继续执行支付
	if (signedString != nil) {
		//应用注册scheme,在AliSDKDemo-Info.plist定义URL types
		NSString *appScheme = @"alisdkdemo";
		
		//test
//		orderInfoEncoded = TEXT_OrderInfoEncoded;
		// NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
		NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
								 orderInfoEncoded, signedString];
		
		// NOTE: 调用支付结果开始支付
		[[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
			NSLog(@"Alipay callback reslut = %@",resultDic);
			//注：客户端若已安装支付宝客户端不走这段代码，需要在AppDelegate的 openURL:(NSURL *)url 里面实现对应支付结果回调操作
			//客户端若未安装支付宝客户端，才执行这段代码
			NSString *resultStatusStr = [resultDic objectForKey:@"resultStatus"];
			if ([resultStatusStr isEqualToString:@"9000"]) {
				NSString *orderPromptInfo = [NSString stringWithFormat:@"支付宝-网页支付-支付成功!"];
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"支付结果" message:orderPromptInfo delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
				[alert show];
			}
		}];
	}
}

- (void)doWXPay
{
    NSMutableDictionary *orderInfoDict = [NSMutableDictionary dictionary];
    orderInfoDict[@"price"] = @(0.01);// 交易总价格 微信支付，金额单位为分
    orderInfoDict[@"livetime"] = @(1);// 使用期限 单位：月
    orderInfoDict[@"userId"] = @(4769027);// 用户ID
    orderInfoDict[@"mobile"] = @"18810047219";// 订购用户手机号
    orderInfoDict[@"appId"] = @"6111611"; // 应用ID //成长帮手appId:9071052；乐学吧appId:5271404；拍照答疑appId:6111611
    orderInfoDict[@"prodSubject"] = @"测试"; // 订购商品名称
    orderInfoDict[@"prodBody"] = @"微信支付测试";    // 商品信息
    orderInfoDict[@"comboCode"] = @"gl_jt_hjy_dy1"; // 套餐编码
    orderInfoDict[@"userType"] = @(1);
    orderInfoDict[@"areaCode"] = @(0);
    orderInfoDict[@"channel"] = @"2"; // 支付渠道：1（AliPay），2（WXPay）
    
    /*
    //微信支付相关
    if (![WXApi isWXAppInstalled]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您还没有安装微信，请先下载微信客户端" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"去下载", nil];
        [alertView show];
        return;
    }
    
    if (![WXApi isWXAppSupportApi]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您当前的微信版本不支持支付功能" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
     */
    
    [BYHttpEngine obtainAppComboOrderNoWithOrderInfo:orderInfoDict completionHandler:^(NSData *responseData) {
        NSDictionary *dataDict = [responseData JSONObject];
        
        NSString *resultState = [dataDict stringValueForKey:@"result"];
        //成功时，取对应订单号
        if ([resultState isEqualToString:@"1"]) {
            NSArray *dataArr = [dataDict arrayValueForKey:@"datalist"];
            
            WXOrder *orderM = nil;
            for (NSDictionary *orderDict in dataArr) {
                orderM = [WXOrder appComboOrderModelWithDictionary:orderDict];
            }
            
            [self appOrderWithPrePayId:orderM.prepayID];
            
        } else {
        }
        
    } errorHandler:^(NSError *error) {
    }];
}

- (NSString *)appOrderWithPrePayId:(NSString *)prePayId
{
    NSString *parterid;
    NSString *appid;
    NSString *appKey;
    
    parterid = WXAppPartnerid;
    appid    = WXAppID;
    appKey   = WXAPPKey;
    
    //调起微信支付
    PayReq* request    = [[PayReq alloc] init];
    request.partnerId  = parterid;
    request.prepayId   = prePayId;
    request.package    = @"Sign=WXPay";
    request.nonceStr   = [self generate32BitRandomString];
    request.timeStamp  =  [[NSDate date] timeIntervalSince1970];
    
    NSDictionary *parmDic = @{@"appid":appid,
                              @"partnerid":request.partnerId,
                              @"prepayid":request.prepayId,
                              @"package":request.package,
                              @"noncestr":request.nonceStr,
                              @"timestamp":@(request.timeStamp)};
    
    request.sign       = [self generateSignWithDictionary:parmDic withAppKey:appKey];
    [WXApi sendReq:request];
    //日志输出
    
    return @"";
}

- (NSString *)generate32BitRandomString {
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < 32; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}

- (NSString *)generateSignWithDictionary:(NSDictionary *)dic withAppKey:(NSString *)appKey{
    //排序
    NSArray* sortedKeys = [dic.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    //签名
    __block NSString* paraString = @"";
    [sortedKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* value = dic[obj];
        paraString = [NSString stringWithFormat:@"%@%@=%@&",paraString, obj,  value];
    }];
    
    paraString = [NSString stringWithFormat:@"%@key=%@",paraString,appKey];
    paraString = [[BYUtils md5:paraString] uppercaseString];
    
    NSLog(@"%s paraString :%@",__func__,paraString);
    
    return paraString;
}

#pragma mark- Setter and getter
- (UIButton *)aliPayBtn
{
	if (!_aliPayBtn) {
		_aliPayBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
		[_aliPayBtn setBackgroundColor:WHITE_COLOR];
		_aliPayBtn.layer.cornerRadius = 5;
		[_aliPayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_aliPayBtn setTitle:@"aliPayBtn" forState:UIControlStateNormal];
		[_aliPayBtn addTarget:self action:@selector(goAliPay:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _aliPayBtn;
}

- (UIButton *)wxPayBtn
{
	if (!_wxPayBtn) {
		_wxPayBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
		[_wxPayBtn setBackgroundColor:WHITE_COLOR];
		_wxPayBtn.layer.cornerRadius = 5;
		[_wxPayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_wxPayBtn setTitle:@"wxPayBtn" forState:UIControlStateNormal];
		[_wxPayBtn addTarget:self action:@selector(goWXPay:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _wxPayBtn;
}

#pragma mark- Square area

@end
