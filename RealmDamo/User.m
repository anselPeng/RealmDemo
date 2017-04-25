//
//  User.m
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "User.h"

@implementation User

+(NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties{


    return @{
             @"posts":[RLMPropertyDescriptor descriptorWithClass:Post.class propertyName:@"auther"]
             };
}

@end


@implementation SubUser


@end
