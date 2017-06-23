//
//  BYHttpEngine.h
//  Apps
//
//  Created by BianYong on 16/8/22.
//  Copyright © 2016年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

typedef void(^BYResponseBlock)(NSData *responseData);
typedef void(^BYResponseJSONBlock)(id responseObj);
typedef void(^BYResponseErrorBlock)(NSError *error);

@interface BYHttpEngine : NSObject

+ (void)getRequestWithInterfacePath:(NSString *)interfacePath
							 params:(NSMutableDictionary *)params
				  completionHandler:(BYResponseBlock)completionHandler
					   errorHandler:(BYResponseErrorBlock)errorHandler;

+ (void)postRequestWithInterfacePath:(NSString *)interfacePath
							 params:(NSMutableDictionary *)params
				  completionHandler:(BYResponseBlock)completionHandler
					   errorHandler:(BYResponseErrorBlock)errorHandler;

+ (void)obtainDataListWithParams:(NSMutableDictionary *)dict
			   completionHandler:(BYResponseBlock)completionHandler
					errorHandler:(BYResponseErrorBlock)errorHandler;

+ (void)obtainTokenWithParamDict:(NSDictionary *)paramDict
			   completionHandler:(BYResponseBlock)completionHandler
					errorHandler:(BYResponseErrorBlock)errorHandler;

+ (void)obtainAppComboOrderNoWithOrderInfo:(NSDictionary *)paramDict
                         completionHandler:(BYResponseBlock)completionHandler
                              errorHandler:(BYResponseErrorBlock)errorHandler;

+ (void)requestServerDataWithInterface:(NSString *)interface
								params:(NSDictionary *)paramsDic
						   requestType:(NSInteger)requestType
                     completionHandler:(BYResponseBlock)completionHandler
                          errorHandler:(BYResponseErrorBlock)errorHandler;

@end
