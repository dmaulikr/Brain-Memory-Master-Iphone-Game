//
//  BannerAds.h
//  BrainMemoryMaster1
//
//  Created by GLB-163 on 8/25/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <UIKit/UIKit.h>

@interface BannerAds : UIViewController<GADBannerViewDelegate>
-(void)createAD;
@end
