//
//  FirstAppDelegate.h
//  BrainMemoryMaster1
//
//  Created by GBS-ios on 1/16/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <Parse/Parse.h>
#import "mainLevel.h"
#import <sqlite3.h>
#import "Timer.h"
#import "SingletonClass.h"
#import "Flurry.h"




@interface FirstAppDelegate : UIResponder <UIApplicationDelegate,FBSDKSharingDelegate,UIAlertViewDelegate>{
    sqlite3 *DB;

}

@property (strong, nonatomic) UIWindow *window;
-(void)poostObjectGraph;
-(void)beatFriend;
-(void)requestLife;
@end
