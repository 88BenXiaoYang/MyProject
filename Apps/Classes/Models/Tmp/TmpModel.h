//
//  TmpModel.h
//  Apps
//
//  Created by by on 2017/8/21.
//  Copyright © 2017年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, strong) NSNumber *type;
@property (nonatomic,   copy) NSString *animalName;

@end

@interface TmpModel : NSObject

@property (nonatomic, strong) NSNumber *age;
@property (nonatomic,   copy) NSString *name;
@property (nonatomic, strong) NSArray *animals;

@end
