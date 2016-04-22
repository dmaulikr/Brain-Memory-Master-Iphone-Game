//
//  BannerAds.m
//  BrainMemoryMaster1
//
//  Created by GLB-163 on 8/25/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "BannerAds.h"

@interface BannerAds ()

@end

@implementation BannerAds
    {
        GADBannerView *bannerView;
    }



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Create an ad of standard size at the default position (top of the screen).
    // Available AdSize constants are explained in GADAdSize.h.
            // Do any additional setup after loading the view.
}
-(void)createAD{
    bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    
    // Specify the ad's "unit identifier". This is your publisher ID.
    bannerView.adUnitID = @"ca-app-pub-8534288772685657/8832557324";
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView.rootViewController = self;
    //    [self.view addSubview:bannerView];
    //
    //    // Initiate a generic request to load it with an ad.
    [bannerView loadRequest:[GADRequest request]];
    
    bannerView.delegate=self;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
    //[UIView beginAnimations:@"BannerSlide" context:nil];
    bannerView.frame = CGRectMake(0.0,
                                  self.view.frame.size.height -
                                  bannerView.frame.size.height,
                                  bannerView.frame.size.width,
                                  bannerView.frame.size.height);
   // [UIView commitAnimations];
    [self.view addSubview:bannerView];
    NSLog(@"called====");
}
- (void)adView:(GADBannerView *)bannerView
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError:%@", [error localizedDescription]);
}
//- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
//    [UIView beginAnimations:@"BannerSlide" context:nil];
//    bannerView.frame = CGRectMake(0.0,
//                                  self.view.frame.size.height -
//                                  bannerView.frame.size.height,
//                                  bannerView.frame.size.width,
//                                  bannerView.frame.size.height);
//    [UIView commitAnimations];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
