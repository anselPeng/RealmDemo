//
//  Post.m
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "Post.h"
#import "User.h"


NSNumber * time_stamp(){
    
    NSDate *senddate = [NSDate date];
    NSString *date2 = [NSString stringWithFormat:@"%ld", (NSInteger)[senddate timeIntervalSince1970]];
    return [NSNumber numberWithInteger:date2.integerValue];
}

@implementation Post

/**
 *  必须属性，在加入数据库前必须赋值
 *
 *  @return <#return value description#>
 */
+ (NSArray<NSString *> *)requiredProperties{

    return @[@"title"];
}

/**
 *  设置属性，这些属性不会存入数据库
 *
 *  @return <#return value description#>
 */
+(NSArray<NSString *> *)ignoredProperties{

    return @[];
}

/**
 *  设置默认值
 *
 *  @return <#return value description#>
 */
+(NSDictionary *)defaultPropertyValues{

    NSString *string = time_stamp().stringValue;
    return @{@"look":@(0),@"isTop":@(NO),@"identifer":string};
}

/**
 *  设置索引属性
 *
 *  @return <#return value description#>
 */
+(NSArray<NSString *> *)indexedProperties{


    return @[@"title",@"look"];
}

+ (NSString *)primaryKey{
    return @"identifer";
}


@end
