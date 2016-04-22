//
//  PlayGamelevel2.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/14/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "ContineuorTryViewController.h"
#import "mainLevel.h"
<<<<<<< HEAD
#import "ScoreViewController.h"
@interface PlayGamelevel2 : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
=======
@interface PlayGamelevel2 : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    NSArray *colors;
    NSArray *colorName;
    UIColor *ansColor;
    NSMutableArray *selectedColor;
    NSMutableArray *selectedColorName;
    int timeOver;
    int time;
    
    UIView *timeView;
    UIView *timeView1;
    
    
    UILabel* lab;
    UICollectionViewCell *cell;
    
    UITextField *selectLetter;
}
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;


@end
