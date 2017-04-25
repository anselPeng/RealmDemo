//
//  RLMObject+SetValue.m
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "RLMObject+SetValue.h"
#import <objc/runtime.h>
@implementation RLMObject (SetValue)

- (void)RLM_SetValue:(id)value forKey:(NSString *)key{
    
    [[RLMRealm defaultRealm] transactionWithBlock:^{
        [self setValue:value forKey:key];
    }];
}



@end
