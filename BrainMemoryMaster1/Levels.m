//
//  Levels.m
//  BrainMemoryMaster1
//
//  Created by GBS-ios on 1/16/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "Levels.h"

@interface Levels (){
    CGRect screenRect;
    int height1;
    int width1;
    Timer *t2;
    int game;
GADBannerView *bannerView;
    
    game2 *play2;
    
    

}

@end

@implementation Levels

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    for (NSString *fontFamilyName in [UIFont familyNames]) {
//        for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]) {
//            NSLog(@"Family: %@    Font: %@", fontFamilyName, fontName);
//        }
//    }

    
    
    interstitialView = [[GADInterstitial alloc]initWithAdUnitID:interstitialId];
    interstitialView.delegate = self;
    
    GADRequest * request =[[GADRequest alloc]init];
    //request.testDevices =@[@"776b4f21d15a8741aeab7bd0c4ed6613"];
    [interstitialView  loadRequest:request];

    
    bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    
    // Specify the ad's "unit identifier". This is your publisher ID.
    bannerView.adUnitID = bannerId;
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView.rootViewController = self;
    //    [self.view addSubview:bannerView];
    //
    //    // Initiate a generic request to load it with an ad.
    [bannerView loadRequest:[GADRequest request]];
    
    bannerView.delegate=self;
    

   
    
    
    
  /*  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //Call your function or whatever work that needs to be done
        //Code in this part is run on a background thread
       
        
        [gm1 playerrank];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
           
            [gm1 displayFacebook];

            
            
                    });
    });*/

    
    
    
    
    //-------------------------For Timer class--------------
       
    
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    NSLog(@"height---%d  width------%d",height1,width1);
    noOfCell=0;
    //self.view.backgroundColor=[UIColor blackColor];
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 00, width1, height1)];
     if((width1==320)&&(height1==480)){
        backImg.image=[UIImage imageNamed:@"game2_choose_bg copy.png"];
    }
    else if((width1==320)&&(height1==568)){
        backImg.image=[UIImage imageNamed:@"game2_choose_bg copy.png"];
    }
    else if((width1==375)&&(height1=667)){
        backImg.image=[UIImage imageNamed:@"game3_choose_bg copy.png"];
    }
    else if((width1>=414 && height1>=736)){
        backImg.image=[UIImage imageNamed:@"game_choose_bg6+.png"];
    }

    else if((width1>800)&&(height1>1700)){
        backImg.image=[UIImage imageNamed:@"game5_choose_bg.png"];
    }

    [self.view addSubview:backImg];
    
    UIView *BackSecondView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    BackSecondView.backgroundColor=[UIColor blackColor];

    BackSecondView.alpha=.5;
    
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame=CGRectMake(10,30, 35*width1/320, 20*height1/480);
    back.backgroundColor=[UIColor clearColor];
    
    //[back setTitle:@"<<--" forState:UIControlStateNormal];
    back.titleLabel.textAlignment=NSTextAlignmentLeft;
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    if(width1>=414&& height1>=736){
         [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    }
    else{
    [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    }
    [back addTarget:self action:@selector(backButAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    
       //[self.view addSubview:BackSecondView];
    
    //self.view.backgroundColor=[UIColor blackColor];
   
    // Do any additional setup after loading the view from its nib.




}
- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
    //[UIView beginAnimations:@"BannerSlide" context:nil];
 
    if(width1>=375&&height1>=667){
        bannerView.frame = CGRectMake(0,
                                      self.view.frame.size.height -
                                      bannerView.frame.size.height,
                                      width1,
                                      60);
        
        
    }
    else{
  
    bannerView.frame = CGRectMake(0,
                                  self.view.frame.size.height -
                                  bannerView.frame.size.height,
                                  bannerView.frame.size.width,
                                  bannerView.frame.size.height);
  
    }

    
        // [UIView commitAnimations];
    [self.view addSubview:bannerView];
    NSLog(@"called====");
}
- (void)adView:(GADBannerView *)bannerView
didFailToReceiveAdWithError:(GADRequestError *)error {
 
    NSLog(@"adView:didFailToReceiveAdWithError:%@", [error localizedDescription]);

}






-(void)viewDidAppear:(BOOL)animated{
    
    CGFloat t1=.07;
    for(int i=0; i<9;i++){
        //collection will be displayed after delay
        [self performSelector:@selector(creatCollView) withObject:nil afterDelay:t1];
        t1=t1+.07;
        
        
    }
    UILabel *label=[[UILabel alloc]init];
    
     if(width1==414 && height1==736){
        label.frame =CGRectMake(115,height1-150, 300, 40);
        label.font=[UIFont fontWithName:@"Arial-ItalicMT" size:22];
        }
     else if(width1==375 && height1==667)
     {
             label.frame =CGRectMake(100,height1-130, 300, 40);
             label.font=[UIFont fontWithName:@"Arial-ItalicMT" size:18];
        
     }
     else {
         label.frame =CGRectMake(80,height1-90, 300, 40);
         label.font=[UIFont fontWithName:@"Arial-ItalicMT" size:18];
         

     }
    label.text=@"Select a game to play";
    
    label.textColor=[UIColor blackColor];
    [self.view addSubview:label];
    

    
}


-(void)backButAction{
    mainLevel *gotoMain=[[mainLevel alloc]initWithNibName:@"mainLevel" bundle:nil];
    [self presentViewController:gotoMain animated:YES completion:nil];
    
}


-(void)creatCollView{
    if(noOfCell!=0){
        //is false
    for(UICollectionView *view in self.view.subviews){
        if ([view isKindOfClass:[UICollectionView class]]) {
            [view removeFromSuperview];
        }
    }
    }
    [self createCollectionView];
}


#pragma mark-
#pragma mark- collection and methode
-(void)createCollectionView{
    noOfCell++;
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing =5;
   //make a view
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1/16, height1/5, width1-width1/8,width1-width1/8) collectionViewLayout:layout];
       
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:_collectionView];
    
    
}
#pragma mark-
#pragma mark- collection methode

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return 9;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    

    if(noOfCell>indexPath.row){
       
    
        lab =[[UILabel alloc]initWithFrame:CGRectMake(10,25, width1/4-10, width1/8)];
        lab.textColor=[UIColor blueColor];
    //lab.backgroundColor=[UIColor colorWithRed:(CGFloat)255/255 green:(CGFloat)255/255 blue:(CGFloat)255/255 alpha:.05];
        
        cell.backgroundColor=[UIColor clearColor];
   
    lab.textColor=[UIColor clearColor];
    lab.text=[NSString stringWithFormat:@"Level%d",(int)(indexPath.row+1)];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=[UIFont boldSystemFontOfSize:20.0f];
    
    //cell.layer.borderWidth=.2f;
    //cell.layer.borderColor=[UIColor redColor].CGColor;
           UIImageView *rotateView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,width1*90/320,width1*90/320)];
      
    //rotateView.layer.cornerRadius=7.0;
    rotateView.backgroundColor=[UIColor clearColor];
    rotateView.layer.borderColor=[UIColor clearColor].CGColor;
    rotateView.layer.borderWidth=.3f;
    rotateView.layer.shadowColor=[UIColor blackColor].CGColor;
     [rotateView.layer setShadowOffset:CGSizeMake(5, 0)];
    [rotateView.layer setOpacity:2];
        if(width1==375 && height1==667){
            
            if(indexPath.row==0){
                rotateView.image=[UIImage imageNamed:@"identity_sequence1.png"];
            }
            else if (indexPath.row==1){
                rotateView.image=[UIImage imageNamed:@"color_identity1.png"];
                
            }
            else if (indexPath.row==2){
                rotateView.image=[UIImage imageNamed:@"face_identity1.png"];
                
            }
            else if (indexPath.row==3){
                rotateView.image=[UIImage imageNamed:@"slightly_different_cell1.png"];
                
            }
            else if (indexPath.row==4){
                rotateView.image=[UIImage imageNamed:@"letter_missing1.png"];
                
            }
            else if (indexPath.row==5){
                rotateView.image=[UIImage imageNamed:@"red_blue_cell1.png"];
                
            }
            else if (indexPath.row==6){
                rotateView.image=[UIImage imageNamed:@"identity_sequence1.png"];
                
            }
            else if (indexPath.row==7){
                rotateView.image=[UIImage imageNamed:@"diffrent_smily1.png"];
                
            }
            else if (indexPath.row==8){
                rotateView.image=[UIImage imageNamed:@"color_pair1.png"];
                
            }

        }
        else if(width1>=414 && height1>=736)
        {
            if(indexPath.row==0){
                rotateView.image=[UIImage imageNamed:@"identity_sequence6+.png"];
            }
            else if (indexPath.row==1){
                rotateView.image=[UIImage imageNamed:@"color_identity6+.png"];
                
            }
            else if (indexPath.row==2){
                rotateView.image=[UIImage imageNamed:@"face_identity6+.png"];
                
            }
            else if (indexPath.row==3){
                rotateView.image=[UIImage imageNamed:@"slightly_different_cell6+.png"];
                
            }
            else if (indexPath.row==4){
                rotateView.image=[UIImage imageNamed:@"letter_missing6+.png"];
                
            }
            else if (indexPath.row==5){
                rotateView.image=[UIImage imageNamed:@"red_blue_cell6+.png"];
                
            }
            else if (indexPath.row==6){
                rotateView.image=[UIImage imageNamed:@"identity_sequence6+.png"];
                
            }
            else if (indexPath.row==7){
                rotateView.image=[UIImage imageNamed:@"diffrent_smily6+.png"];
                
            }
            else if (indexPath.row==8){
                rotateView.image=[UIImage imageNamed:@"color_pair6+.png"];
                
            }

            
        }
        else{
            
        
        if(indexPath.row==0){
            rotateView.image=[UIImage imageNamed:@"identity_sequenceabc.png"];
        }
        else if (indexPath.row==1){
            rotateView.image=[UIImage imageNamed:@"color_identity.png"];
 
        }
        else if (indexPath.row==2){
            rotateView.image=[UIImage imageNamed:@"face_identity.png"];
  
        }
        else if (indexPath.row==3){
            rotateView.image=[UIImage imageNamed:@"slightly_different_cell.png"];
  
        }
        else if (indexPath.row==4){
            rotateView.image=[UIImage imageNamed:@"letter_missing.png"];
  
        }
        else if (indexPath.row==5){
            rotateView.image=[UIImage imageNamed:@"red_blue_cell.png"];
  
        }
        else if (indexPath.row==6){
            rotateView.image=[UIImage imageNamed:@"identity_sequence.png"];
  
        }
        else if (indexPath.row==7){
            rotateView.image=[UIImage imageNamed:@"diffrent_smily.png"];
  
        }
        else if (indexPath.row==8){
            rotateView.image=[UIImage imageNamed:@"color_pair.png"];
 
        }
        }
    [cell.contentView addSubview:rotateView];
    cell.layer.cornerRadius=45.0f;
    lab.layer.shadowColor=[UIColor blackColor].CGColor;
    [lab.layer setShadowOpacity:1];
    [lab.layer setShadowOffset:CGSizeMake(5, 0)];
    
        }
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //starting of the game all
    [SingletonClass sharedSingleton].level=(int)indexPath.row+1;
    [SingletonClass sharedSingleton].Score=0;
    
    //--------------------------------------
    //  [SingletonClass sharedSingleton].life=5;
    //----------------------------------------
    
    [SingletonClass sharedSingleton].levelScore=0;
    
    
    
    
    
    
    
    if(indexPath.row==0){
        game=0;
        if([SingletonClass sharedSingleton].life==0)
            
        {
            [SingletonClass sharedSingleton].levelScore=-1;
            [SingletonClass sharedSingleton].Score=-1;


            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            
            [self presentViewController:t2 animated:YES completion:nil];
        }
        else{
            
            
            if(interstitialView.isReady && [SingletonClass sharedSingleton].subLevel!=0){
                NSLog(@"entering the ads.........");
                [SingletonClass sharedSingleton].subLevel=0;
                 play2=[[game2 alloc]init];
                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];
            }
            
        }
    }
    if(indexPath.row==1){
        game=1;
        if([SingletonClass sharedSingleton].life==0)
        {
            [SingletonClass sharedSingleton].levelScore=-1;
             [SingletonClass sharedSingleton].Score=-1;
            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            [self presentViewController:t2 animated:YES completion:nil];
        }else
        {
            
            
            
            
            if(interstitialView.isReady&&[SingletonClass sharedSingleton].subLevel!=0){
                NSLog(@"ads present.....");
                [SingletonClass sharedSingleton].subLevel=0;

                play2=[[game2 alloc]init];
                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                  [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];
                
            }
        }
        
        
    }
    
    if(indexPath.row==2){
        game=2;
        if([SingletonClass sharedSingleton].life==0)
        {
            [SingletonClass sharedSingleton].levelScore=-1;
             [SingletonClass sharedSingleton].Score=-1;
            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            [self presentViewController:t2 animated:YES completion:nil];
        }else{
            
            if(interstitialView.isReady&& [SingletonClass sharedSingleton].subLevel!=0){
                 [SingletonClass sharedSingleton].subLevel=0;
                NSLog(@"ads present.....");
               play2=[[game2 alloc]init];
                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                 [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];
                
            }
            
            
        }
    }
    if(indexPath.row==3){
        game=3;
        if([SingletonClass sharedSingleton].life==0)
        {
            [SingletonClass sharedSingleton].levelScore=-1;
             [SingletonClass sharedSingleton].Score=-1;
            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            [self presentViewController:t2 animated:YES completion:nil];
        }else{
            
            if(interstitialView.isReady&& [SingletonClass sharedSingleton].subLevel!=0){
                
                NSLog(@"ads present.....");
                  [SingletonClass sharedSingleton].subLevel=0;
                play2=[[game2 alloc]init];

                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];
            }
            
            
        }
    }
    if(indexPath.row==4){
        game=4;
        if([SingletonClass sharedSingleton].life==0)
        {
            [SingletonClass sharedSingleton].levelScore=-1;
             [SingletonClass sharedSingleton].Score=-1;
            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            [self presentViewController:t2 animated:YES completion:nil];
        }else{
            
            
            if(interstitialView.isReady&& [SingletonClass sharedSingleton].subLevel!=0){
                NSLog(@"ads present.....");
                                  [SingletonClass sharedSingleton].subLevel=0;
                play2=[[game2 alloc]init];

                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                   [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];
                
            }
            
            
        }
    }
    if(indexPath.row==5){
        game=5;
        if([SingletonClass sharedSingleton].life==0)
        {
            [SingletonClass sharedSingleton].levelScore=-1;
             [SingletonClass sharedSingleton].Score=-1;
            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            [self presentViewController:t2 animated:YES completion:nil];
        }else{
            
            if(interstitialView.isReady&& [SingletonClass sharedSingleton].subLevel!=0){
                NSLog(@"ads present.....");
                   [SingletonClass sharedSingleton].subLevel=0;
                play2=[[game2 alloc]init];
                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                 [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];            }
            
            
        }
    }
    if(indexPath.row==6){
        game=6;
        if([SingletonClass sharedSingleton].life==0)
        {
            [SingletonClass sharedSingleton].levelScore=-1;
             [SingletonClass sharedSingleton].Score=-1;
            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            [self presentViewController:t2 animated:YES completion:nil];
        }else{
            
            
            if(interstitialView.isReady&& [SingletonClass sharedSingleton].subLevel!=0){
                NSLog(@"ads present.....");
                [SingletonClass sharedSingleton].subLevel=0;
                 play2=[[game2 alloc]init];
                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];              }
            
            
            
        }
    }
    if(indexPath.row==7){
        game=7;
        if([SingletonClass sharedSingleton].life==0)
        {
            [SingletonClass sharedSingleton].levelScore=-1;
             [SingletonClass sharedSingleton].Score=-1;
            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            [self presentViewController:t2 animated:YES completion:nil];
        }else{
            
            if(interstitialView.isReady&& [SingletonClass sharedSingleton].subLevel!=0){
                NSLog(@"ads present.....");
                 [SingletonClass sharedSingleton].subLevel=0;
                play2=[[game2 alloc]init];
                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                 [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];
            }
            
        }
    }
    if(indexPath.row==8){
        game=8;
        if([SingletonClass sharedSingleton].life==0)
        {
            [SingletonClass sharedSingleton].levelScore=-1;
             [SingletonClass sharedSingleton].Score=-1;
            t2=[[Timer alloc]init];
            t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [[SingletonClass sharedSingleton].timer invalidate];
            
            [self presentViewController:t2 animated:YES completion:nil];
        }else{
            
            
            
            if(interstitialView.isReady&& [SingletonClass sharedSingleton].subLevel!=0){
                
                NSLog(@"ads present.....");
                 [SingletonClass sharedSingleton].subLevel=0;
                
                play2=[[game2 alloc]init];

                [interstitialView presentFromRootViewController:self];
                
            }
            else{
                 [SingletonClass sharedSingleton].subLevel=1;
                play2=[[game2 alloc]init];
                play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
                [self presentViewController:play2 animated:YES completion:nil];
            }
            
            
        }
    }
    
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(width1*90/320,width1*80/320);
}



- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)interstitialDidReceiveAd:(GADInterstitial *)interstitial{
    
}
- (void)interstitial:(GADInterstitial *)interstitial didFailToReceiveAdWithError:(GADRequestError *)error{
    switch (game) {
        case 0:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            break;
        case 1:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 2:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 3:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 4:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 5:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 6:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 7:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 8:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
            
        default:
            break;
    }
    
    NSLog(@"error...............");
}
- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial{
    
    
    switch (game) {
        case 0:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            break;
        case 1:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 2:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 3:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 4:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 5:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 6:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 7:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
        case 8:
            play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:play2 animated:YES completion:nil];
            
            break;
            
        default:
            break;
    }
}

@end
