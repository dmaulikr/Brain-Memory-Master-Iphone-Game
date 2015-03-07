//
//  PlayGameLevel7.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/15/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "ContineuorTryViewController.h"
#import "mainLevel.h"
@interface PlayGameLevel7 : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{
    NSMutableArray *colors;
    int differentCellNo;
    int timeOver;
    int isalph;
    int noOfClick;
    int blinkNo;
    
    BOOL answer;
    int cellColor;
    
    int sequence[8];
    int sequenceNo;
    int noOfBlink;
    
    
    UIView *timeView;
    UIView *timeView1;
    
    
    UICollectionViewCell *cell;
    UITextField *selectLetter;
}
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;

@end
