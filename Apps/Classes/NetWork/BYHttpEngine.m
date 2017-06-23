//
//  BYHttpEngine.m
//  Apps
//
//  Created by BianYong on 16/8/22.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "BYHttpEngine.h"
#import "BYUtils.h"

static AFHTTPSessionManager *sessionManager = nil;

@implementation BYHttpEngine

+ (void)initialize
{
	if (self == [BYHttpEngine class]) {
		//会话管理
		sessionManager = [AFHTTPSessionManager manager];
		//响应序列化
		sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
	}
}

//AFN的POST请求
+ (void)postObtainDataListWithInterfacePath:(NSString *)interfacePath
									 params:(NSDictionary *)paramDict
						  completionHandler:(BYResponseBlock)completionHandler
							   errorHandler:(BYResponseErrorBlock)errorHandler
{
	[sessionManager POST:interfacePath parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		completionHandler(responseObject);
		
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		errorHandler(error);
	}];
}

//AFN的GET请求
+ (void)getObtainDataListWithInterfacePath:(NSString *)interfacePath
									params:(NSDictionary *)paramDict
						 completionHandler:(BYResponseBlock)completionHandler
							  errorHandler:(BYResponseErrorBlock)errorHandler
{
	[sessionManager GET:interfacePath parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		completionHandler(responseObject);
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		errorHandler(error);
	}];
}

+ (void)getRequestWithInterfacePath:(NSString *)interfacePath
							 params:(NSMutableDictionary *)params
				  completionHandler:(BYResponseBlock)completionHandler
					   errorHandler:(BYResponseErrorBlock)errorHandler
{
	[self getObtainDataListWithInterfacePath:interfacePath params:params completionHandler:completionHandler errorHandler:errorHandler];
}

+ (void)postRequestWithInterfacePath:(NSString *)interfacePath
							  params:(NSMutableDictionary *)params
				   completionHandler:(BYResponseBlock)completionHandler
						errorHandler:(BYResponseErrorBlock)errorHandler
{
	[self postObtainDataListWithInterfacePath:interfacePath params:params completionHandler:completionHandler errorHandler:errorHandler];
}

+ (void)obtainDataListWithParams:(NSDictionary *)dict
			   completionHandler:(BYResponseBlock)completionHandler
					errorHandler:(BYResponseErrorBlock)errorHandler
{
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:dict];
	params[@"viewRole"] = @(0);
	params[@"userId"] = @(3083424);
	params[@"platform"] = @(1);//平台 1：ios；2：android
	params[@"pageSize"] = @(10);
	params[@"pageCurrent"] = @(1);
	params[@"isNeedPage"] = @(1);
	
	params[@"app_key"] = @"IhNt7ft4GTEkG3KsGX9F/g==";
	params[@"version"] = @"1.1";
	NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
	params[@"time"] = [NSString stringWithFormat:@"%f", timeInterval];
	
	//排序
	NSArray* sortedKeys = [params.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
		return [obj1 compare:obj2];
	}];
	
	//签名
	__block NSString* paraString = @"";
	[sortedKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		NSString* value = params[obj];
		paraString = [NSString stringWithFormat:@"%@%@=%@",paraString, obj,  value];
		if (idx < sortedKeys.count - 1)
		{
			paraString = [NSString stringWithFormat:@"%@&", paraString];
		}
	}];
	
	NSString* sign = [BYUtils stringWithXXTEncrypt:paraString];
	
	//把签名加到params
	params[@"sign"] = sign;
	
	//interfacePath ：协议头+主机地址+接口名称
	NSString *interfacePath = @"http://payapi.cq.51jiaxiaotong.com/v1/app/list";
	
	[self postObtainDataListWithInterfacePath:interfacePath params:params completionHandler:completionHandler errorHandler:errorHandler];
}

+ (void)obtainTokenWithParamDict:(NSDictionary *)paramDict
			   completionHandler:(BYResponseBlock)completionHandler
					errorHandler:(BYResponseErrorBlock)errorHandler
{
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:paramDict];
	params[@"schoolId"] = @(500012);
	params[@"phone"] = @"18810047219";
	
	NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
	params[@"timeStamp"] = [NSString stringWithFormat:@"%f", timeInterval];
	NSString *keyString = [params[@"phone"] stringByAppendingString:params[@"timeStamp"]];
	NSString *miyaoStr = @"99db604fb8c380b07c022938c7d7afdd";
	keyString = [keyString stringByAppendingString:miyaoStr];
	params[@"key"] = [BYUtils md5:keyString];
	
	NSString *interfacePath = @"http://cq.edu88.com/api/getTicketByPhone.htm";
	
	[self getObtainDataListWithInterfacePath:interfacePath params:params completionHandler:completionHandler errorHandler:errorHandler];
}

+ (void)obtainAppComboOrderNoWithOrderInfo:(NSDictionary *)paramDict
                         completionHandler:(BYResponseBlock)completionHandler
                              errorHandler:(BYResponseErrorBlock)errorHandler
{
    [self postWithParams:paramDict serverIP:@"http://payapi.cq.51jiaxiaotong.com" apiName:@"/v1/app/pay/order" completionHandler:^(NSData *responseData) {
        completionHandler(responseData);
    } errorHandler:^(NSError *error) {
        errorHandler(error);
    }];
}

//post 方法3
/**
 *  传入SEVER_IP的POST方法，对应参数app_key、version
 *
 */
+ (void)postWithParams:(NSDictionary *)params
              serverIP:(NSString *)serverIp
               apiName:(NSString *)apiName
     completionHandler:(BYResponseBlock)completionHandler
          errorHandler:(BYResponseErrorBlock)errorHandler
{
    //必带参数
    NSMutableDictionary* params_ = [NSMutableDictionary dictionaryWithDictionary:params];
    params_[@"app_key"] = app_key;
    params_[@"version"] = app_version;
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    params_[@"time"] = [NSString stringWithFormat:@"%f", timeInterval];
    
    //排序
    NSArray* sortedKeys = [params_.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    //签名
    __block NSString* paraString = @"";
    [sortedKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* value = params_[obj];
        paraString = [NSString stringWithFormat:@"%@%@=%@",paraString, obj,  value];
        if (idx < sortedKeys.count - 1)
        {
            paraString = [NSString stringWithFormat:@"%@&", paraString];
        }
    }];
    
    NSString* sign = [BYUtils stringWithXXTEncrypt:paraString];
    
    //把签名加到params
    params_[@"sign"] = sign;
    
    //	[self requestWithParams:params_ apiName:apiName httpMethod:@"POST" serverIP:serverIp  completionHandler:completionHandler errorHandler:errorHandler];      //原生登录用正式SERVER_IP
    
    
    NSString* urlString = [NSString stringWithFormat:@"%@%@", serverIp, apiName];
    [self postRequestWithInterfacePath:urlString params:params_ completionHandler:completionHandler errorHandler:errorHandler];
}

+ (void)requestServerDataWithInterface:(NSString *)interface
                                params:(NSDictionary *)paramsDic
						   requestType:(NSInteger)requestType
                     completionHandler:(BYResponseBlock)completionHandler
                          errorHandler:(BYResponseErrorBlock)errorHandler
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:paramsDic];
	if (requestType == RequestTypeGet) {
		[self getRequestWithInterfacePath:interface params:params completionHandler:completionHandler errorHandler:errorHandler];
	} else {
		[self postRequestWithInterfacePath:interface params:params completionHandler:completionHandler errorHandler:errorHandler];
	}
}

@end
