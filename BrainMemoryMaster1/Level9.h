//
//  Level9.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/16/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "ContineuorTryViewController.h"
#import "mainLevel.h"

@interface Level9 : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>{
    NSArray *colors;
    NSArray *colorsName;
    int time;
    int newclor[16];
    int firstColor;
    int secondColor;
    
    int clickNo;
    int colorNO;
    int timeOver;
    UIColor *selectColor;
    
    UIView *timeView;
    UIView *timeView1;
    int sequence[16];
    
    UICollectionViewCell *cell;
    UITextField *selectLetter;
}
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;

@end
