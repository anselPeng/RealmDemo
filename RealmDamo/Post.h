//
//  Post.h
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Realm/Realm.h>

RLM_ARRAY_TYPE(Post)
NSNumber * time_stamp();
@class User;
@interface Post : RLMObject

@property NSString * identifer;
@property NSString * title;
@property NSDate * timestamp;
@property NSString * content;
//@property RLMArray <Post *><Post> * comments;
@property User * auther;
@property NSNumber <RLMInt>* look;
@property NSNumber <RLMBool>* isTop;

@end
