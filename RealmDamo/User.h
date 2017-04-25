//
//  User.h
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Realm/Realm.h>

#import "Post.h"
@interface User : RLMObject

@property NSString *nickName;

@property (readonly)RLMLinkingObjects *posts;


@end

@interface SubUser : RLMObject

@property NSString *nickName;


@end
