//
//  ScoreViewController.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "FirstViewController.h"
#import "PlayGame.h"
#import "mainLevel.h"
#import "PlayGame.h"
#import "PlayGamelevel2.h"
#import "PlayGameLevel3.h"
#import "PlayGameLevel4.h"
#import "PlayGameLevel5.h"
#import "PlayGameLevel6.h"
#import "PlayGameLevel7.h"
#import "PlayLevel8.h"
#import "Level9.h"
<<<<<<< HEAD
#import <Parse/Parse.h>
#import <Bolts/Bolts.h>
#import <sqlite3.h>
#import "FirstAppDelegate.h"





@interface ScoreViewController : UIViewController
{
     sqlite3 *DB;
}


-(void)facebukshare;
-(void)checkHighScore;
-(void)checkBeatFriends;
-(void)retrievePlayerInfo;
=======
#import <FacebookSDK/FacebookSDK.h>
#import <Social/Social.h>
#import <sqlite3.h>


@interface ScoreViewController : UIViewController{
sqlite3 *_databaseHandle;
    NSMutableArray *localData;
    int previousScore;
}
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
@end
