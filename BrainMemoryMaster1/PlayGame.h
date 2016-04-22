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
<<<<<<< HEAD
#import "ScoreViewController.h"

@interface PlayGame : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    NSMutableArray *letters;
    NSString *letter;
    NSArray *chars;
    int tryChance,count;
=======

@interface PlayGame : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{
    NSMutableArray *letters;
    NSString *letter;
    NSArray *chars;
    int tryChance;
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
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
