//
//  ContineuorTryViewController.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "ScoreViewController.h"
#import "PlayGame.h"
#import "PlayGamelevel2.h"
#import "PlayGameLevel3.h"
#import "PlayGameLevel4.h"
#import "PlayGameLevel5.h"
#import "PlayGameLevel6.h"
#import "PlayGameLevel7.h"
#import "PlayLevel8.h"
#import "Level9.h"
#import "Timer.h"
#import <Parse/Parse.h>
#import <Bolts/Bolts.h>
#import <GoogleMobileAds/GoogleMobileAds.h>



@interface ContineuorTryViewController : UIViewController<UIAlertViewDelegate>
{
    int  count;
    
    
       
        
    
    

}
@property(nonatomic,assign)int tryChance;
@property(nonatomic,assign)BOOL result;
@property(nonatomic,assign)BOOL timeOver;
@property(nonatomic,strong)NSUserDefaults *defaults1;

@end
