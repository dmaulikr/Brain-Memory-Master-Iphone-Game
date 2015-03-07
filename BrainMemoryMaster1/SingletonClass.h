//
//  SingletonClass.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject
@property(nonatomic,assign)BOOL networkStatus;
@property(nonatomic,assign)int fbStatus;
@property(nonatomic,strong)NSString *fbID;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong) NSMutableArray *friendUsers;
@property(nonatomic,strong)NSDictionary *Player;
@property(nonatomic,assign)int correntAns;
@property(nonatomic,assign)int Score;
@property(nonatomic,assign)int levelScore;

@property(nonatomic, assign)int mainLevel;
@property(nonatomic, assign)int level;
@property(nonatomic,assign)int subLevel;

@property(nonatomic,assign)int noOfGame;
@property(nonatomic,assign)int life;
@property(nonatomic,assign)int firstDisplayFriend;
@property(nonatomic,assign)int previousScoreOfCurrentPlayer;
+(SingletonClass*)sharedSingleton;

@end
