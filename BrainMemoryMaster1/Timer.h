//
//  Timer.h
//  BrainMemoryMaster1
//
//  Created by GLB-163 on 7/21/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonClass.h"
#import "mainLevel.h"
#import "GameRequestView.h"

#import <GoogleMobileAds/GoogleMobileAds.h>

@interface Timer : UIViewController<UIAlertViewDelegate,GADBannerViewDelegate,GADInterstitialDelegate>
{
    int seconds,count;
        GADInterstitial *interstitialView;

}
@property(nonatomic,strong)NSUserDefaults *defaults;
@property(nonatomic,strong)NSUserDefaults *defaults2;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)NSDateFormatter *dateFormatter ;
@property(nonatomic,strong)NSString *wtime;
@property (strong,nonatomic) UILabel *title2;

- (void)update;
-(void)time;
-(void)present;

@end
