//
//  RLMRealm+Custom.m
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "RLMRealm+Custom.h"
#import "UserManager.h"
#import <objc/runtime.h>

#define KSchemaVersion 1

@implementation RLMRealm (Custom)

+ (void)reConfig{

    UserManager * user = [UserManager sharedManager];
    
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [docPath objectAtIndex:0];
    NSString *fileDic = [NSString stringWithFormat:@"%@/%@/%@",path,user.userName,user.projectname];
    NSString *filePath = [fileDic stringByAppendingString:@"/data.realm"];
    NSLog(@"数据库目录 = %@",filePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath:fileDic]) {
        
        [fileManager createDirectoryAtPath:fileDic withIntermediateDirectories:YES attributes:nil error:nil];
        
        if (![fileManager fileExistsAtPath:filePath]) {
            [fileManager createFileAtPath:filePath contents:nil attributes:nil];
        }
    }
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    config.fileURL = [NSURL fileURLWithPath:filePath];
    config.readOnly = NO;
    config.schemaVersion = KSchemaVersion;
    config.migrationBlock = ^(RLMMigration *migration , uint64_t oldSchemaVersion) {
        // 这里是设置数据迁移的block
        if (oldSchemaVersion < KSchemaVersion) {
        }
    };
    [RLMRealmConfiguration setDefaultConfiguration:config];
}

@end
