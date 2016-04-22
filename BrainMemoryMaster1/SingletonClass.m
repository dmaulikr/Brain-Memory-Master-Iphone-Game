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


<<<<<<< HEAD

+(SingletonClass*)sharedSingleton{
       
    
=======
+(SingletonClass*)sharedSingleton{
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    @synchronized(self){
        
        if(!sharedSingleton){
            sharedSingleton=[[SingletonClass alloc]init];
        }
    }return sharedSingleton;
}
@end
