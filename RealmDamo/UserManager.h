//
//  UserManager.h
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic,copy) NSString *userName;
@property (copy, nonatomic) NSString *projectname;
@property (readonly,nonatomic,copy) NSString *initialProjecName;//初始项目名



@end
