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
#import "game2.h"
#import "mainLevel.h"
#import "Timer.h"

#import <GoogleMobileAds/GoogleMobileAds.h>


@interface Levels : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,GADBannerViewDelegate,GADInterstitialDelegate>{
    UITableView *tableView;
    UILabel* lab;
    UICollectionViewCell *cell;
    int noOfCell;
    GADInterstitial *interstitialView;
    }
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;
@property(nonatomic,strong)NSUserDefaults *defaults;


@end
