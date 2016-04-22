//
//  PlayGameLevel3.h
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

@interface PlayGameLevel3 : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{
    int tryChance,count;
=======

@interface PlayGameLevel3 : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{
    int tryChance;
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    int timeOver;
    int time;
    NSArray *imageArray;
    NSMutableArray *selectedArray;
    UIImage *selectImage;
    
    
    UIView *timeView;
    UIView *timeView1;
    
    UIImageView *img;
    UICollectionViewCell *cell;
    
    
}
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;
<<<<<<< HEAD
-(IBAction)backButAction2:(id)sender;
=======
//-(void)backButAction2;
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f

@end
