//
//  PlayGameLevel6.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/15/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "ContineuorTryViewController.h"
#import "mainLevel.h"
@interface PlayGameLevel6 : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{
    NSArray *colors;
    int differentCellNo;
    int blueColor;
    int redColor;
    int timeOver;
    int time;
    
    UIView *timeView;
    UIView *timeView1;
    
    
    UICollectionViewCell *cell;
    UITextField *selectLetter;
}
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;


@end
