//
//  PlayGame.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "ContineuorTryViewController.h"
#import "mainLevel.h"

@interface PlayGame : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{
    NSMutableArray *letters;
    NSString *letter;
    NSArray *chars;
    int tryChance;
    int timeOver;
    int time;
    
    UIView *timeView;
    UIView *timeView1;
    
    UILabel* lab;
    UICollectionViewCell *cell;
    
    
}
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;
@end
