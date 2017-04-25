//
//  RLMObject+SetValue.h
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMObject (SetValue)

/**
 *  给所有对象加入RLM专用SetValue方法
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
- (void)RLM_SetValue:(id)value forKey:(NSString *)key;



@end
