//
//  PlayGameLevel5.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/15/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "ContineuorTryViewController.h"
#import "mainLevel.h"
@interface PlayGameLevel5 : UIViewController<UITextFieldDelegate>{
    
    int timeOver;
    int time;
    int shouldmissLeter;
    UIView *timeView;
    UIView *timeView1;
    BOOL result;
    
    UITextField *selectLetter;
}
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int mainLevel;


@end
