//
//  FirstViewController.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayGame.h"
#import "SingletonClass.h"
#import "Levels.h"
#import "mainLevel.h"
#import "FirstAppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import <sqlite3.h>
#import <Social/Social.h>
//1653836841510383
//fb1653836841510383
@interface FirstViewController : UIViewController<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate,FBLoginViewDelegate>{
    UIButton *cancel;
    UIScrollView *helpView;
    UIView *header;
    sqlite3 *_databaseHandle;
   }

@end
