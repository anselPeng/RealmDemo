//
//  UserManager.m
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

+ (instancetype)sharedManager {
    static UserManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
        shared_manager.userName = @"default";
        shared_manager.projectname = @"default";
    });
    return shared_manager;
}

- (NSString *)initialProjecName{
    return @"default";
}

@end
