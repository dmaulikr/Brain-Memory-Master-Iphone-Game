//
//  SingletonClass.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "SingletonClass.h"

static SingletonClass *sharedSingleton;
@implementation SingletonClass


+(SingletonClass*)sharedSingleton{
    @synchronized(self){
        
        if(!sharedSingleton){
            sharedSingleton=[[SingletonClass alloc]init];
        }
    }return sharedSingleton;
}
@end
