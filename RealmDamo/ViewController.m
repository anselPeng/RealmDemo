//
//  ViewController.m
//  RealmDamo
//
//  Created by  彭安忠 on 2017/4/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import <Realm.h>
#import "User.h"
#import "RLMObject+SetValue.h"
#import "RLMRealm+Custom.h"
#import "RLMSyncUser.h"
#import "UserManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"_____-%@",[NSDate date]);
    [self action:nil];
    
    
}

- (void)configRealm{

    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.schemaVersion = 5;
    [RLMRealmConfiguration setDefaultConfiguration:config];
}

- (void)writData{
    
    User *user = [User new];
    user.nickName = @"Mike";
    
    Post *post = [[Post alloc] init];
    post.title = @"中国人";
    post.auther = user;
    
    
    SubUser *subUser = [[SubUser alloc] init];
    subUser.nickName = @"Mike";

    [self configRealm];
    
    RLMRealm * r = [RLMRealm defaultRealm];
    RLMRealmConfiguration * config = r.configuration;
    config.schemaVersion = 4;
    
    [r transactionWithBlock:^{
        
        [r addObject:user];
        [Post createInRealm:r withValue:@{@"identifer":time_stamp().stringValue,@"title":@"中国人"}];
        [r addObject:subUser];
        post.timestamp = [NSDate date];
    }];
    
    
}

- (void)query{

  NSLog(@"查询1： %@",[Post objectsWhere:@"title = '中国人'"]);
    NSLog(@"查询w： %@",[Post objectsWithPredicate:[NSPredicate predicateWithFormat:@"title = '中国人' AND look = 0"]]);
    
    
    
}




- (void)printData{
    NSLog(@"___Post:%@",[Post allObjects]);
    NSLog(@"___user:%@",[User allObjects]);
    NSLog(@"___Post:%@",[Post allObjects]);
}
- (IBAction)action:(id)sender {
    
    UserManager *manager = [UserManager sharedManager];
    
    if (self.projectTextField.text.length>0) {
        manager.projectname = self.projectTextField.text;
    }
    
    if (self.userTextFeild.text.length>0) {
        manager.userName = self.userTextFeild.text;
    }
    
    [RLMRealm reConfig];
    
    [self writData];
    [self query];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
