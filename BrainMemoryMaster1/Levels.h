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
    UITableView *tableView;
    UILabel* lab;
    UICollectionViewCell *cell;
    int noOfCell;
    NSMutableArray *friendIds;
    NSMutableArray *friendUsers;

    }
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;


@end
