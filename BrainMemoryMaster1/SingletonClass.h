//
//  SingletonClass.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject
@property(nonatomic,assign)int Score;
@property(nonatomic,assign)int levelScore;

@property(nonatomic, assign)int mainLevel;
@property(nonatomic, assign)int level;
@property(nonatomic,assign)int subLevel;

@property(nonatomic,assign)int noOfGame;
@property(nonatomic,assign)int life;
@property(nonatomic,strong)NSUserDefaults *defaults1;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)int background;
@property(nonatomic,assign)int firstlife;
@property(nonatomic,assign)int timerCheck;
@property(nonatomic,assign)int tag;
@property(nonatomic,assign)int alert;

+(SingletonClass*)sharedSingleton;

@end
