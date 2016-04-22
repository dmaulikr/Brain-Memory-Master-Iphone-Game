//
//  Levels.h
//  BrainMemoryMaster1
//
//  Created by GBS-ios on 1/16/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "ScoreViewController.h"
<<<<<<< HEAD
#import "game2.h"
#import "mainLevel.h"
#import "Timer.h"

#import <GoogleMobileAds/GoogleMobileAds.h>


@interface Levels : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,GADBannerViewDelegate,GADInterstitialDelegate>{
=======
#import "FirstViewController.h"
#import "PlayGame.h"
#import "PlayGamelevel2.h"
#import "PlayGameLevel3.h"
#import "PlayGameLevel4.h"
#import "PlayGameLevel5.h"
#import "PlayGameLevel6.h"
#import "PlayGameLevel7.h"
#import "PlayLevel8.h"
#import "Level9.h"
#import "mainLevel.h"

@interface Levels : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    UITableView *tableView;
    UILabel* lab;
    UICollectionViewCell *cell;
    int noOfCell;
<<<<<<< HEAD
    GADInterstitial *interstitialView;
=======
    NSMutableArray *friendIds;
    NSMutableArray *friendUsers;

>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    }
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;
<<<<<<< HEAD
@property(nonatomic,strong)NSUserDefaults *defaults;
=======
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f


@end
