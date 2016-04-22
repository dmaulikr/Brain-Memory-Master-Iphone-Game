//
//  game2.h
//  BrainMemoryMaster1
//
//  Created by GLB-163 on 7/30/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Levels.h"
#import "PlayGamelevel2.h"
#import "PlayGameLevel3.h"
#import "PlayGamelevel4.h"
#import "PlayGameLevel5.h"
#import "PlayGameLevel6.h"
#import "PlayGameLevel7.h"
#import "PlayLevel8.h"
#import "Level9.h"
#import "PlayGame.h"

#import <sqlite3.h>
#import <Parse/Parse.h>
#import <Bolts/Bolts.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface game2 : UIViewController<GADBannerViewDelegate>{
    sqlite3 *DB;
}


@end
