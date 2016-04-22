//
//  Timer.m
//  BrainMemoryMaster1
//
//  Created by GLB-163 on 7/21/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "Timer.h"

@interface Timer (){
    CGRect screenRect;
    int height1;
    int width1;
    UILabel *title1,*title3;
int remTime,totalTime;
    
    NSString * firstTime;
    UIView *lifeView,*lifeView1;
    UIImageView *life1;
    UIImageView *life;
    int x,x1,first;
    int timeloop;
    UIView *popUp;
    GADBannerView *bannerView;
    UILabel *label;
    mainLevel *go;
    

}

@end


@implementation Timer

//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:YES];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(time) name:@"timeForLife" object:nil];
//}

//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:YES];
//     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(time) name:@"timeForLife" object:nil];
//}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}

- (void)viewDidLoad {
    
    
    
 [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(time) name:@"timeForLife" object:nil];
    
    go=[[mainLevel alloc]initWithNibName:@"Levels" bundle:nil];

    
    [super viewDidLoad];
    interstitialView = [[GADInterstitial alloc]initWithAdUnitID:interstitialId];
    interstitialView.delegate = self;
    
    GADRequest * request =[[GADRequest alloc]init];
  //  request.testDevices =@[@"776b4f21d15a8741aeab7bd0c4ed6613"];
    [interstitialView  loadRequest:request];
    

  //  [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(time) name:@"timerForLife" object:nil];
    
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

   //[timer invalidate];
   
   
    x=5;
    x1=5;
    
    first=0;
    
    [SingletonClass sharedSingleton].background=1;
    
 
    
    
    
    
    
    
    
    
    
  firstTime =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
    NSLog(@"Firsttime------%@",firstTime);
   // firstTime=nil;
    if (!firstTime) {
        
        
        NSDate *starttime = [NSDate date];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
        
        NSString *strCurrentDate = [formatter stringFromDate:starttime];
        
        NSLog(@"Start Time-------->@%@",strCurrentDate);
        _defaults= [NSUserDefaults standardUserDefaults];
        [_defaults setObject:strCurrentDate forKey:@"startkey"];
        [_defaults synchronize];
        NSLog( @"%d",[_defaults synchronize]);
        
    }
    
     
    self.view.backgroundColor=[UIColor whiteColor];
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 00, width1, height1)];
    if((width1==320)&&(height1==480)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1==320)&&(height1>480)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1>320)&&(height1<1000)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1>400)&&(height1<1150)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1>600)&&(height1>1150)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1>800)&&(height1>1700)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
       [self.view addSubview:backImg];
    
    
    
    
    
    //-----------------------------------------
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width1==320){
        back.frame=CGRectMake(10*width1/320, (width1/15)+12,34*width1/320,20*height1/480);
    }
    else{
        back.frame=CGRectMake(10*width1/320, (width1/15),34*width1/320,20*height1/480);
    }
    back.backgroundColor=[UIColor clearColor];
    back.titleLabel.font=[UIFont systemFontOfSize:width1/20];
    [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    
    back.titleLabel.textAlignment=NSTextAlignmentLeft;
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
       [self.view addSubview:back];
   //-----------------------------------------
   
    if([SingletonClass sharedSingleton].Score!=-1)
    {
    UILabel *score=[[UILabel alloc]init];
    if((width1==320)&&(height1==480)){
        
        
        
        score.frame=CGRectMake(10, screenRect.size.height/2-130, 80, height1/15);
    }
    
    
    else if((width1==320)&&(height1==568)){
         score.frame=CGRectMake(10, screenRect.size.height/2-170, 100, height1/15);
    }
    else{
        score.frame=CGRectMake(10, screenRect.size.height/2-220, 130, height1/15);
    }

   
    score.text=[NSString stringWithFormat:@"Game:%d",[SingletonClass sharedSingleton].level];
       score.font=[UIFont fontWithName:@"Newborough" size:18];
            score.textColor=[UIColor blackColor];
    [self.view addSubview:score];
    }
    if( [SingletonClass sharedSingleton].levelScore!=-1){
        
        UILabel *game=[[UILabel alloc]init];
        if((width1==320)&&(height1==480)){
            
            
            
            game.frame=CGRectMake(width1-86, screenRect.size.height/2-130, 120, height1/15);
        }
        
        
        else if((width1==320)&&(height1==568)){
            game.frame=CGRectMake(width1-86, screenRect.size.height/2-170, 120, height1/15);
        }
        else{
            game.frame=CGRectMake(width1-86, screenRect.size.height/2-220, 120, height1/15);
        }
        game.text=[NSString stringWithFormat:@"Score:%d",[SingletonClass sharedSingleton].Score];
        game.font=[UIFont fontWithName:@"Newborough" size:18];

        game.backgroundColor=[UIColor clearColor];
        game.textColor=[UIColor blackColor];
        [self.view addSubview:game];
        
    }
    
    //----------life display bar---------
    
    if((width1==320)&&(height1==480)){
        
        
        
        lifeView=[[UIView alloc]initWithFrame:CGRectMake(screenRect.size.width/2-70, 70, width1-2*screenRect.size.width/2-70, height1/15)];
        }
    
    
    else if((width1==320)&&(height1==568)){
        lifeView=[[UIView alloc]initWithFrame:CGRectMake(screenRect.size.width/2-70, 85 , width1-2*screenRect.size.width/2-70, height1/15)];
    }
    else if((width1==375)&&(height1==667)){

    lifeView=[[UIView alloc]initWithFrame:CGRectMake(screenRect.size.width/2-70,95 , width1-2*screenRect.size.width/2-70, height1/15)];
    }
    else if((width1>=414)&&(height1>=736)){
        
        lifeView=[[UIView alloc]initWithFrame:CGRectMake(screenRect.size.width/2-80, 110 , width1-2*screenRect.size.width/2-70, height1/15)];
    }

    
    lifeView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lifeView];
    
    
    //---------------------------------
    
    
    
    
    
    
    
    
    
    
    
    
    
    //--------no more life---------------------
    
    
    title3=[[UILabel alloc]initWithFrame:CGRectMake(0,height1*220/480+40,width1,30)];
    title3.backgroundColor=[UIColor clearColor];
    title3.textColor=[UIColor redColor];
    title3.textAlignment=NSTextAlignmentCenter;
    title3.font=[UIFont fontWithName:@"Newborough" size:30];
    title3.text=@"Time For Next Life!!";
    
    [self.view addSubview:title3];
    
    
    UILabel *title4=[[UILabel alloc]init ];
    if(width1==375&&height1==667){
        title4.frame=CGRectMake(0,height1-230,width1,30);
        
    }
    else if(width1>=414&&height1>=736){
        title4.frame=CGRectMake(0,height1-230,width1,30);
    }
    else if (width1==320&&height1==568){
        title4.frame=CGRectMake(0,height1-160,width1,30);
    }
    else if(width1==320&&height1==480){
         title4.frame=CGRectMake(0,height1-140,width1,30);

    }
    else {
        title4.frame=CGRectMake(0,height1-150,width1,30);
        
        
    }

    title4.backgroundColor=[UIColor clearColor];
    title4.textColor=[UIColor blackColor];
    title4.textAlignment=NSTextAlignmentCenter;
    
    title4.text=@"Click for free lives on facebook!";
    title4.font=[UIFont fontWithName:@"Newborough" size:18];
    [self.view addSubview:title4];

    
    
    UIButton *gamerequest=[UIButton buttonWithType:UIButtonTypeRoundedRect]  ;
    if(width1==375&&height1==667){
    gamerequest.frame=CGRectMake(100,height1-200,180,50);
        
    }
    else if(width1>=414&&height1>=736){
           gamerequest.frame=CGRectMake(120,height1-200,180,50);
    }
    else if (width1==320&&height1==568){
         gamerequest.frame=CGRectMake(70,height1-130,180,50);
    }
        else {
         gamerequest.frame=CGRectMake(70,height1-110,180,50);
        

    }
    [gamerequest setBackgroundImage:[UIImage imageNamed:@"get_life.png"] forState:UIControlStateNormal];
    //[gamerequest setTitle:@"SEND REQUST" forState:UIControlStateNormal];
    [gamerequest setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
       [gamerequest addTarget:self action:@selector(gameRequestFuction) forControlEvents:UIControlEventTouchUpInside];
     
     [self.view addSubview:gamerequest];

    
   
    
   //-----------------------------------------
    
   
    _title2=[[UILabel alloc]initWithFrame:CGRectMake(0,height1*220/480+70,width1,height1*50/480)];
    _title2.backgroundColor=[UIColor clearColor];
   _title2.textColor=[UIColor redColor];
    self.title2.textAlignment=NSTextAlignmentCenter;
    self.title2.font=[UIFont fontWithName:@"Newborough" size:30];
   // title.text=@"5:00";
   [self.view addSubview:self.title2];
    
    
    
    
    for(int i=0;i<5;i++){
        
        if(width1==320&&height1==568){
             life1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"no-life1.png"]];
        }
        else if(width1>=414&&height1>=736){
            life1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"no_life6+.png"]];
        }else{
             life1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"no_life.png"]];
        }
 
    life1.frame=CGRectMake(x1,10, width1/15,width1/15);
    x1=x1+width1/15+3;
       x1++;
    [lifeView addSubview:life1];
        
        
        
    }
    
   
       
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:1]  forKey:@"timercheck"];
          [[NSUserDefaults standardUserDefaults]synchronize];

    
[self time];
     
    
    }


    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self.view addSubview:bannerView];
    NSLog(@"called====");
}
- (void)adView:(GADBannerView *)bannerViewdidFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError:%@", [error localizedDescription]);
}


-(void)enter{
    mainLevel *m=[[mainLevel alloc]init];
    [self presentViewController:m animated:YES completion:nil];
}

//----------Back button----------

-(IBAction)back:(id)sender{
  
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:0]  forKey:@"timercheck"];
    [[NSUserDefaults standardUserDefaults]synchronize];

           if([SingletonClass sharedSingleton].life>0){
        
         [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
        [[SingletonClass sharedSingleton].timer invalidate];
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"startkey"];
           [[NSUserDefaults standardUserDefaults]synchronize];
   }
        else{
            [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];

        }
    
    [SingletonClass sharedSingleton].defaults1= [NSUserDefaults standardUserDefaults];
    [[SingletonClass sharedSingleton].defaults1 setObject:[NSNumber numberWithInt:remTime] forKey:@"backkey"];
    [_defaults synchronize];
    NSLog( @"%d",[_defaults synchronize]);
   // [[SingletonClass sharedSingleton].timer invalidate];
    
    //----------------------------------------
    
    if(interstitialView.isReady){
        NSLog(@"entering the ads.........");
        
               [interstitialView presentFromRootViewController:self];
    }else{

  
    go.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:go animated:YES completion:nil];
    }
}



 -(void)time
{
   NSString *strDate =[[NSUserDefaults standardUserDefaults] valueForKey:@"startkey"];

    NSLog(@"%@",strDate);
    
    if (![strDate isEqualToString:@"0"])
    {
        
        
        NSDate *currentDate = [NSDate date];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
        NSString *strCurrentDate = [formatter stringFromDate:currentDate];
        currentDate=[formatter dateFromString:strCurrentDate];
        
        
        NSDateFormatter *formatter1 = [[NSDateFormatter alloc]init];
        [formatter1 setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
        NSDate *oldDate = [formatter1 dateFromString:strDate];
        unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSSecondCalendarUnit;
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDateComponents *conversionInfo = [cal components:unitFlags fromDate:oldDate  toDate:currentDate  options:0];
        
        //int months = (int)[conversionInfo month];
        int days = (int)[conversionInfo day];
        int hours = (int)[conversionInfo hour];
        int minutes = (int)[conversionInfo minute];
        int seconds = (int)[conversionInfo second];
        
        NSLog(@"%d days %d hours %d min %d sec", days, hours, minutes, seconds);
        
        [self getExtraLife:days andHour:hours andMin:minutes andSec:seconds];
       [SingletonClass sharedSingleton].timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];

    }
    else{
      
            
        
            //[self.lblNextLifeTime setString:@"Full of life"];
       
    }

    

 
}


-(void)getExtraLife :(int)aday andHour:(int)ahour andMin:(int)amin andSec:(int)asec {
   //######################
    //timeloop=amin;
    //timeloop=asec;
    //####################
    
    int hoursInMin = ahour*60;
    hoursInMin=hoursInMin+amin;
    
     totalTime = amin*60+asec;
    NSLog(@"Total time---%d",totalTime);
    
    
    
    
    
    NSString *backtime =[[NSUserDefaults standardUserDefaults]objectForKey:@"timeRem"];
    //------------------------------------------------
    int backtimeint=[backtime intValue];
    NSLog(@"background time---------->%d",backtimeint);
    
    
    //life if previous
    
    int backgrd=[[[NSUserDefaults standardUserDefaults]objectForKey:@"backgroundd"] intValue];
    
    NSLog(@"if entered backgrnd-->%d",backgrd);
    int timer=[[[NSUserDefaults standardUserDefaults]objectForKey:@"fromtimertobackgnd"] intValue];
    
    
    
    if(backgrd==1 && timer==1){
        
        [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"backgroundd"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"fromtimertobackgnd"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
    NSString *lf =[[NSUserDefaults standardUserDefaults]valueForKey:@"lastlife"];
    int lif=[lf intValue];
    [SingletonClass sharedSingleton].life=lif;
    
    NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
    
        
    if(totalTime>=100){
        [SingletonClass sharedSingleton].life=5;
        first=1;
        [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
        [str synchronize];
        NSLog( @"%d",[str synchronize]);
        [[SingletonClass sharedSingleton].timer invalidate];
        _defaults2= [NSUserDefaults standardUserDefaults];
        
        
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:0]  forKey:@"timercheck"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        [_defaults2 setObject:nil forKey:@"startkey"];
        NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
        NSLog(@"%@",test);
        [title3 removeFromSuperview];
        [self.title2 removeFromSuperview];
        
        
        UILabel *lb=[[UILabel alloc]initWithFrame:CGRectMake(0,height1*220/480+50,width1,height1*50/480)];
       lb.backgroundColor=[UIColor clearColor];
        lb.textColor=[UIColor blueColor];
       lb.textAlignment=NSTextAlignmentCenter;
      
        lb.font=[UIFont fontWithName:@"Newborough" size:20];
        lb.text=@"You Got 5 Lives!!Go back to play";
        [self.view addSubview:lb];
       
//        title3.hidden=YES;
//        self. title2.textColor=[UIColor blueColor];
//        self. title2.textAlignment=NSTextAlignmentCenter;
//        self.title2.font=[UIFont fontWithName:@"Arial-ItalicMT " size:12];
//        self.  title2.text=@"Lives Regained!!Go back to play";

        
     
    }
    else if (totalTime>=80){
        
        
        [SingletonClass sharedSingleton].life=4;
        
        [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
        [str synchronize];
        NSLog( @"%d",[str synchronize]);
        
       // [[SingletonClass sharedSingleton].timer invalidate];
//        _defaults2= [NSUserDefaults standardUserDefaults];
        
        
      //  [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
        
        
//        [_defaults2 setObject:nil forKey:@"startkey"];
//        NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
//        NSLog(@"%@",test);

//        if([SingletonClass sharedSingleton].life==0){
//            [SingletonClass sharedSingleton].life=4;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//        }
//        else if ([SingletonClass sharedSingleton].life>=1){
//            [SingletonClass sharedSingleton].life=5;
//            NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//            [[SingletonClass sharedSingleton].timer invalidate];
//            _defaults2= [NSUserDefaults standardUserDefaults];
//            
//            
//            [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
//            
//            
//            [_defaults2 setObject:nil forKey:@"startkey"];
//            NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
//            NSLog(@"%@",test);
//            
//        }
//        
        
    }
    else if (totalTime>=60){
        
        
        [SingletonClass sharedSingleton].life=3;
        
        [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
        [str synchronize];
        NSLog( @"%d",[str synchronize]);
//        [[SingletonClass sharedSingleton].timer invalidate];
//        _defaults2= [NSUserDefaults standardUserDefaults];
//        
//        
//       // [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
//        
//        
//        [_defaults2 setObject:nil forKey:@"startkey"];
//        NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
//        NSLog(@"%@",test);

//        if([SingletonClass sharedSingleton].life==0){
//            [SingletonClass sharedSingleton].life=3;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//        }
//        else if ([SingletonClass sharedSingleton].life==1){
//            [SingletonClass sharedSingleton].life=4;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//        }
//        else if ([SingletonClass sharedSingleton].life>=2){
//            [SingletonClass sharedSingleton].life=5;
//            NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//            [[SingletonClass sharedSingleton].timer invalidate];
//            _defaults2= [NSUserDefaults standardUserDefaults];
//            
//            
//            [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
//            
//            
//            [_defaults2 setObject:nil forKey:@"startkey"];
//            NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
//            NSLog(@"%@",test);
//            
//        }
    }
    else if (totalTime>=40){
        [SingletonClass sharedSingleton].life=2;
        
        [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
        [str synchronize];
        NSLog( @"%d",[str synchronize]);
//        [[SingletonClass sharedSingleton].timer invalidate];
//        _defaults2= [NSUserDefaults standardUserDefaults];
//        
//        
//       // [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
//        
//        
//        [_defaults2 setObject:nil forKey:@"startkey"];
//        NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
//        NSLog(@"%@",test);
//
//        if([SingletonClass sharedSingleton].life==0){
//            [SingletonClass sharedSingleton].life=2;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//        }
//        else if ([SingletonClass sharedSingleton].life==1){
//            [SingletonClass sharedSingleton].life=3;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//        }
//        else if ([SingletonClass sharedSingleton].life==2){
//            [SingletonClass sharedSingleton].life=4;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//            
//        }
//        else if ([SingletonClass sharedSingleton].life>=3){
//            [SingletonClass sharedSingleton].life=5;
//            NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//            [[SingletonClass sharedSingleton].timer invalidate];
//            _defaults2= [NSUserDefaults standardUserDefaults];
//            
//            
//            [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
//            
//            
//            [_defaults2 setObject:nil forKey:@"startkey"];
//            NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
//            NSLog(@"%@",test);
//            
//        }
        
    }
   else if (totalTime>=20){
       [SingletonClass sharedSingleton].life=1;
       
       [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
       [str synchronize];
       NSLog( @"%d",[str synchronize]);
//       [[SingletonClass sharedSingleton].timer invalidate];
//       _defaults2= [NSUserDefaults standardUserDefaults];
//       
//       
//     //  [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
//       
//       
//       [_defaults2 setObject:nil forKey:@"startkey"];
//       NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
//       NSLog(@"%@",test);

//        if([SingletonClass sharedSingleton].life==0){
//            [SingletonClass sharedSingleton].life=1;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//        }
//        else if ([SingletonClass sharedSingleton].life==1){
//            [SingletonClass sharedSingleton].life=2;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//        }
//        else if ([SingletonClass sharedSingleton].life==2){
//            [SingletonClass sharedSingleton].life=3;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//            
//        }
//        else if ([SingletonClass sharedSingleton].life==3){
//            [SingletonClass sharedSingleton].life=4;
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//            
//        }
//        else if ([SingletonClass sharedSingleton].life>=4){
//            [SingletonClass sharedSingleton].life=5;
//            NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
//            [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
//            [str synchronize];
//            NSLog( @"%d",[str synchronize]);
//            [[SingletonClass sharedSingleton].timer invalidate];
//            _defaults2= [NSUserDefaults standardUserDefaults];
//            
//            
//            [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
//            
//            
//            [_defaults2 setObject:nil forKey:@"startkey"];
//            NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
//            NSLog(@"%@",test);
//            
//        }
       

    }
    
        x=5;

        for(int i=0;i<[SingletonClass sharedSingleton].life;i++){
            
            
            if(width1==320&&height1==568){
                life=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life1.png"]];
            }
            else if(width1>=414&&height1>=736){
                life=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life6+.png"]];
            }
            else{
                life=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life.png"]];
            }
            
            life.frame=CGRectMake(x,10, width1/15,width1/15);
            x=x+width1/15+3;
            
            x++;
            [lifeView addSubview:life];
        }

    
    
    }
    
    
    
    
    
    
    
    
    
        int rem =amin%5;
    
    int remTimeforLife = rem*60+asec;
    
    
    
    
    
    
    if(totalTime>=20){
        remTimeforLife=20-(int)(totalTime%20);
        
        
          NSLog(@"%d min Remaining----->%d",timeloop,remTimeforLife);
    }
    
    
    //-----------------
    else{
    //remTimeforLife=60-remTimeforLife;
remTimeforLife=20-remTimeforLife;
    NSLog(@"Remaining-----%d",remTimeforLife);
}

    
    [self updateTime:remTimeforLife];

}

-(void) updateTime:(int)timeRem{
    
    remTime = timeRem;
    if (remTime) {
        
       int min=remTime/60;
        int sec=remTime%60;
        
        if (sec<10) {
            
          self.title2.text =[NSString stringWithFormat:@"%i: 0%i",min,sec];
            NSLog(@"starting time %@",self.title2.text);
            
        }
        else{
           self. title2.text =[NSString stringWithFormat:@"%i: %i",min,sec];
            NSLog(@"else starting time %@",self.title2.text);
        }
   }
}

- (void)update
{
    
    if(first==1){
        [[SingletonClass sharedSingleton].timer invalidate];
    }
    totalTime++;
    NSLog(@"total time till now-------->%d",totalTime);
    
    
    [[NSUserDefaults standardUserDefaults]setInteger:totalTime forKey:@"timeRem"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    
    
    

    if(first!=1){

    
remTime--;
    }
   
    int minute = remTime/60;
    int second = remTime%60;
    
    if (second<10) {
       self. title2.text=[NSString stringWithFormat:@"%i:0%i",minute,second];
          NSLog(@"after 0 time %@",self.title2.text);
    }
    else{
         self.title2.text=[NSString stringWithFormat:@"%i:%i",minute,second];
         NSLog(@"else after 0 time %@",self.title2.text);
    }
    
    
    if (remTime==0 )
    {
        
             //life.hidden=NO;
        
       
        if([SingletonClass sharedSingleton].life<5){
        
        [SingletonClass sharedSingleton].life++;
        }
        
        
        NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
        [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
        [str synchronize];
        NSLog( @"%d",[str synchronize]);
        //-----------score---------------------
        
        if([SingletonClass sharedSingleton].life<=5){
        NSLog(@"after click life===%d",[SingletonClass sharedSingleton].life );
      // for(int i=0;i<[SingletonClass sharedSingleton].life;i++)
    //{
       // if(first!=0){
            if(width1==320&&height1==568){
                life=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life1.png"]];
            }else if(width1>=414&&height1>=736){
                life=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life6+.png"]];
            }
            
            else{
                life=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life.png"]];
            }
            life.frame=CGRectMake(x,10, width1/15,width1/15);
            x=x+width1/15+3;
           // NSLog(@"i=%d",i);
        x++;
            [lifeView addSubview:life];
        //life.hidden=NO;
        }
       // }
        
      // }
        
        

        
        
        
        //----------------------------------

        if([SingletonClass sharedSingleton].life<5)
        {
            
            NSLog(@"now life is--->%d",[SingletonClass sharedSingleton].life);
            
            //---------------------
           // firstTime=nil;
            
            
            //---------------------
            
          [[SingletonClass sharedSingleton].timer invalidate];
        
                    remTime=20;
            if([SingletonClass sharedSingleton].life!=5){
            [SingletonClass sharedSingleton].timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
            
             [[NSRunLoop currentRunLoop] addTimer: [SingletonClass sharedSingleton].timer forMode:NSDefaultRunLoopMode];
            }
       //title.text=[NSString stringWithFormat:@"01:00"];
            self.title2.text=[NSString stringWithFormat:@"00:20"];
        }
    else{
        
            [[SingletonClass sharedSingleton].timer invalidate];
        [SingletonClass sharedSingleton].timerCheck=0;
        
        title3.hidden=YES;
        
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"timeRem"];
        [[NSUserDefaults standardUserDefaults]synchronize];
//             UIAlertView  *alert=[[UIAlertView alloc]initWithTitle:@"Full of Lives"
//                                             message:@" Lives Regained" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Play", nil];
        
        
        
       
       self. title2.textColor=[UIColor blueColor];
       self. title2.textAlignment=NSTextAlignmentCenter;
//        self.title2.font=[UIFont fontWithName:@"Arial-ItalicMT " size:12];
//      self.  title2.text=@"Lives Regained!!Go back to play";
        
        self.title2.font=[UIFont fontWithName:@"Newborough" size:20];
       self.  title2.text=@"You Got 5 Lives!!Go back to play";

        //[self.view addSubview:self.title2];

        //-------------------------------------------
        _defaults2= [NSUserDefaults standardUserDefaults];
        
        
         [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
        
        
        [_defaults2 setObject:nil forKey:@"startkey"];
        NSString *test =[[NSUserDefaults standardUserDefaults]objectForKey:@"startkey"];
        
        
        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:0]  forKey:@"timercheck"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        
        
        
        NSLog(@"%@",test);
        //-------------------------------------------
//            [alert show];
//        alert.delegate=self;
        

        }
        
    
    }
}






//--------------textfield delegate-------------------
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",(long)buttonIndex);
    if(buttonIndex==0)
    {
               go.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        //----------------------------------------------------
                //-----------------------------------------------------
        [self presentViewController:go animated:YES completion:nil];

        
        
    }
    
    
    
   
    
}
-(void)gameRequestFuction{
    
    
    
    if([SingletonClass sharedSingleton].life<4){
    
    if([FBSDKAccessToken currentAccessToken]){
        
        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:0]  forKey:@"timercheck"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
    
    GameRequestView *gamerequestview=[[GameRequestView alloc]init];
    [self presentViewController:gamerequestview animated:YES completion:nil
     ];
    }
    else{
        NSLog(@"not logged to facebook");
//        popUp=[[UIView alloc]initWithFrame:CGRectMake(80, 280, 200, 20)];
//        popUp.layer.cornerRadius=6.0f;
//        popUp.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:1];
//        [self.view addSubview:popUp];
        
      label  =[[UILabel alloc]init];
        label.frame=CGRectMake(0,380,screenRect.size.width, 20);
        label.textAlignment=NSTextAlignmentCenter;
        label.text=@"Facebook not connected";
        label.textColor=[UIColor blackColor];
        label.font=[UIFont systemFontOfSize:11];
        label.backgroundColor=[UIColor grayColor];
    
        
        [self.view addSubview:label];
        [self performSelector:@selector(cancelLabel)  withObject:nil afterDelay:2];
        
        
        
        //[self.view insertSubview:letsGetStartedPopUp atIndex:2];
        
        [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
            
            popUp.frame=CGRectMake(80, 280, 200, 20);
        }completion:^(BOOL finished){
           
                            
                        }];
    
    }
    }
    else{
        label  =[[UILabel alloc]init];
        label.frame=CGRectMake(60,380, screenRect.size.width, 20);
        label.text=@"Sufficient Life To Play";
        label.textColor=[UIColor blackColor];
        label.backgroundColor=[UIColor grayColor];
        
        
        [self.view addSubview:label];
        [self performSelector:@selector(cancelLabel)  withObject:nil afterDelay:2];

    }
}
-(void)cancelLabel
{
    
    [label removeFromSuperview];
    
}
- (void)interstitialDidReceiveAd:(GADInterstitial *)interstitial{
    
}
- (void)interstitial:(GADInterstitial *)interstitial didFailToReceiveAdWithError:(GADRequestError *)error{
    mainLevel *go1=[[mainLevel alloc]initWithNibName:@"Levels" bundle:nil];
    go1.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:go1 animated:YES completion:nil];
   
    NSLog(@"error...............");
}
- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial{
    mainLevel *go1=[[mainLevel alloc]initWithNibName:@"Levels" bundle:nil];
    go1.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:go1 animated:YES completion:nil];
    
    }

@end
