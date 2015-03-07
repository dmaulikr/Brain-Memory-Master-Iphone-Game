//
//  mainLevel.h
//  BrainMemoryMaster1
//
//  Created by GBS-ios on 1/17/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "Levels.h"
#import "PlayGame.h"
#import "PlayGamelevel2.h"
#import "PlayGameLevel3.h"
#import "PlayGameLevel4.h"
#import "PlayGameLevel5.h"
#import "PlayGameLevel6.h"
#import "PlayGameLevel7.h"
#import "PlayLevel8.h"
#import "Level9.h"
#import <sqlite3.h>
@interface mainLevel : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    sqlite3 *_databaseHandle;
       int onlyOne;
    NSMutableArray *score3;
    NSMutableArray *userName;
}
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int gameLevel;
@property(nonatomic,strong) NSMutableArray *friendIds;

@end
