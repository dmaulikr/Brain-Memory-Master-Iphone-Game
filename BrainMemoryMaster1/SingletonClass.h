//
//  SingletonClass.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject
<<<<<<< HEAD
=======
@property(nonatomic,assign)BOOL networkStatus;
@property(nonatomic,assign)int fbStatus;
@property(nonatomic,strong)NSString *fbID;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong) NSMutableArray *friendUsers;
@property(nonatomic,strong)NSDictionary *Player;
@property(nonatomic,assign)int correntAns;
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
@property(nonatomic,assign)int Score;
@property(nonatomic,assign)int levelScore;

@property(nonatomic, assign)int mainLevel;
@property(nonatomic, assign)int level;
@property(nonatomic,assign)int subLevel;

@property(nonatomic,assign)int noOfGame;
@property(nonatomic,assign)int life;
<<<<<<< HEAD
@property(nonatomic,strong)NSUserDefaults *defaults1;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)int background;
@property(nonatomic,assign)int firstlife;
@property(nonatomic,assign)int timerCheck;
@property(nonatomic,assign)int tag;
@property(nonatomic,assign)int alert;

=======
@property(nonatomic,assign)int firstDisplayFriend;
@property(nonatomic,assign)int previousScoreOfCurrentPlayer;
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
+(SingletonClass*)sharedSingleton;

@end
