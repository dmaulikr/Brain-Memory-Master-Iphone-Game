//
//  ContineuorTryViewController.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "ContineuorTryViewController.h"

@interface ContineuorTryViewController (){
    CGRect screenRect;
    int height1;
    int width1;
    int check;
    }

@end

@implementation ContineuorTryViewController

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
    
    check=0;
    
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    count =0;
   //if([SingletonClass sharedSingleton].life==1)
    //   [self removeFromParentViewController];
    [self createUI];
    // Do any additional setup after loading the view from its nib.
}



-(void)createUI{
    
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 00, width1, height1)];
     if((width1==320)&&(height1==480)){
        backImg.image=[UIImage imageNamed:@"game2_choose_bg copy.png"];
    }
    else if((width1==320)&&(height1==568)){
        backImg.image=[UIImage imageNamed:@"game2_choose_bg copy.png"];
    }
    else if((width1>=375)&&(height1>=667)){
        backImg.image=[UIImage imageNamed:@"game3_choose_bg copy.png"];

    }
    else if((width1>600)&&(height1>1150)){
        backImg.image=[UIImage imageNamed:@"game4_choose_bg.png"];
    }
    else if((width1>800)&&(height1>1700)){
        backImg.image=[UIImage imageNamed:@"game5_choose_bg.png"];
    }
    [self.view addSubview:backImg];
    


    NSArray *resultDisplay=[NSArray arrayWithObjects:@"Good Job",@"Brilliant",@"correct!" ,nil];
//    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0, width1/15+50, width1, 1)];
//    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
//    [self.view addSubview:devider];
    
    
    
    UIButton *tryAgain=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    tryAgain.frame=CGRectMake(width1*70/320,height1*325/480,width1*180/320,height1*35/480);
    tryAgain.backgroundColor=[UIColor clearColor];
    tryAgain.layer.cornerRadius=7.0f;
    //[tryAgain setTitle:@"Try Again" forState:UIControlStateNormal];
    [tryAgain setBackgroundImage:[UIImage imageNamed:@"try_again_btn.png"] forState:UIControlStateNormal];
    tryAgain.layer.shadowColor=[UIColor whiteColor].CGColor;
    [tryAgain addTarget:self action:@selector(tryAgainAction) forControlEvents:UIControlEventTouchUpInside];
    //[[tryAgain titleLabel] setFont:[UIFont fontWithName:@"Knewave" size:width1/18]];
    //tryAgain.layer.borderColor=[UIColor blueColor].CGColor;
    //tryAgain.layer.borderWidth=.2f;
    if(([SingletonClass sharedSingleton].level==1)||([SingletonClass sharedSingleton].level==3)||([SingletonClass sharedSingleton].level==9))
    {
        [self.view addSubview:tryAgain];
    }
    
    UIButton *contineu=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    contineu.frame=CGRectMake(width1*70/320,height1*280/480,width1*180/320,height1*35/480);

    contineu.backgroundColor=[UIColor clearColor];
    [contineu setBackgroundImage:[UIImage imageNamed:@"continue_btn.png"] forState:UIControlStateNormal];
    contineu.layer.cornerRadius=7.0f;
    //[contineu setTitle:@"Continue" forState:UIControlStateNormal];
    //[[contineu titleLabel] setFont:[UIFont systemFontOfSize:width1/18];
    contineu.layer.shadowColor=[UIColor whiteColor].CGColor;
    [contineu addTarget:self action:@selector(contineuAction) forControlEvents:UIControlEventTouchUpInside];
    //contineu.layer.borderWidth=.2f;
    //contineu.layer.borderColor=[UIColor redColor].CGColor;
    
    [self.view addSubview:contineu];
    
    
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(0,height1*220/480,width1,height1*50/480)];
    title.backgroundColor=[UIColor clearColor];
    title.textColor=[UIColor blackColor];
    title.textAlignment=NSTextAlignmentCenter;
    title.font=[UIFont boldSystemFontOfSize:width1/18];
    
    
    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(width1*100/320,height1*100/480,width1*120/320,width1*120/320)];
    [self.view addSubview:logo];
    
    if(_result==true)
    {
        int DispNo = arc4random_uniform(3);
        NSLog(@"Disp no==%d",DispNo);
        
        title.text=[resultDisplay objectAtIndex:DispNo];
        logo.image=[UIImage imageNamed:@"good_job.png"];
    }
    else{
        if(_timeOver==true)
        {
            title.text=@"Time Over!.";
            
        }
        else{
            title.numberOfLines=2;
            title.text=@"Oh!\n Wrong Answer";
        }
    }
    [self.view addSubview:title];
    
    
    
    
    
    
    //increase score
    
    if(_result==true)
    {
        tryAgain.hidden=YES;
        [SingletonClass sharedSingleton].Score=[SingletonClass sharedSingleton].Score+10;
       // [SingletonClass sharedSingleton].levelScore=[SingletonClass sharedSingleton].levelScore+10;
        NSLog(@"after true click======%d",[SingletonClass sharedSingleton].life);
    }
    else  if(_result==false)
    {
        [SingletonClass sharedSingleton].life--;
        NSLog(@"after false click======%d",[SingletonClass sharedSingleton].life);
    }
    else if(_timeOver==true)
    {
        [SingletonClass sharedSingleton].life--;
        
    }
  //-----------------------------------------------------------------------------
   /* if([SingletonClass sharedSingleton].levelScore>=30)
    {
        [SingletonClass sharedSingleton].levelScore=0;
        [SingletonClass sharedSingleton].Score+=[SingletonClass sharedSingleton].life*10;
        
    }*/
    
    
   
    self.view.backgroundColor=[UIColor blackColor];
    //------------------------------------------------
    //check whether current score is highscore
    if([SingletonClass sharedSingleton].level==1){
    NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore1"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore1"])
        {
        [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore1"];
        NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
         }
    }
    else if([SingletonClass sharedSingleton].level==2){
        NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore2"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore2"])
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore2"];
            NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
        }

    }
    else if([SingletonClass sharedSingleton].level==3){
        NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore3"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore3"])
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore3"];
            NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
        }
        
    }
    else if([SingletonClass sharedSingleton].level==4){
        NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore4"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore4"])
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore4"];
            NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
        }
        
    }
    else if([SingletonClass sharedSingleton].level==5){
        NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore5"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore5"])
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore5"];
            NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
        }
        
    }
    else if([SingletonClass sharedSingleton].level==6){
        NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore6"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore6"])
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore6"];
            NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
        }
        
    }
    else if([SingletonClass sharedSingleton].level==7){
        NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore7"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore7"])
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore7"];
            NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
        }
        
    }
    else if([SingletonClass sharedSingleton].level==8){
        NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore8"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore8"])
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore8"];
            NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
        }
        
    }
    else if([SingletonClass sharedSingleton].level==9){
        NSLog(@"first highscore value===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore9"]);
        if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore9"])
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:@"highScore9"];
            NSLog(@"score=====%d",[SingletonClass sharedSingleton].Score);
        }
        
    }
    else{
        
    }







   

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
[back addTarget:self action:@selector(backButAction1:) forControlEvents:UIControlEventTouchUpInside];

[self.view addSubview:back];





}


-(IBAction)backButAction1:(id)sender{
 
    
    UIAlertView  *alert1=[[UIAlertView alloc]initWithTitle:@"Message"
                                                   message:@" Want to quit the game?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert1 show];
    alert1.delegate=self;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",(long)buttonIndex);
    if(buttonIndex==0)
    {
        ScoreViewController *s2=[[ScoreViewController alloc]init];
        if([SingletonClass sharedSingleton].Score!=0)
        [s2 facebukshare];
        //  [s2 checkHighScore];
        // [s2 checkBeatFriends];
        
        
        mainLevel *go1=[[mainLevel alloc]initWithNibName:@"Levels" bundle:nil];
        go1.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        //----------------------------------------------------
        //-----------------------------------------------------
        [self presentViewController:go1 animated:YES completion:nil];
        
        
        
    }
}



-(void)viewDidAppear:(BOOL)animated{
  /*  if(([SingletonClass sharedSingleton].life==0)||([SingletonClass sharedSingleton].Score>=30)){
    ScoreViewController *scoreVw=[[ScoreViewController alloc]initWithNibName:@"ScoreViewController" bundle:nil];
                             
    scoreVw.modalPresentationStyle=UIModalTransitionStyleFlipHorizontal;
           [self presentViewController:scoreVw animated:YES completion:nil];
    
        
    }*/
}



-(void)tryAgainAction{
    if([SingletonClass sharedSingleton].life==0)
    {
                    check=1;
            ScoreViewController *s1=[[ScoreViewController alloc]init];
        if([SingletonClass sharedSingleton].Score!=0){
            [s1 facebukshare];
            [s1 checkHighScore];
            [s1 checkBeatFriends];
        }
        
            
            //---------------------
            Timer *timer=[[Timer alloc]init];
            
            [[SingletonClass sharedSingleton].timer invalidate];
            [self presentViewController:timer animated:YES completion:nil];
            
            
            
        }
        

    else{
   self.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}


-(void)contineuAction{
    //__________________________________
    
   // if([SingletonClass sharedSingleton].Score>=30/*||([SingletonClass sharedSingleton].life==0)*/){
        
       // ScoreViewController *scoreVw=[[ScoreViewController alloc]initWithNibName:@"ScoreViewController" bundle:nil];
        
       // scoreVw.modalPresentationStyle=UIModalTransitionStyleFlipHorizontal;
      
        // [self dismissViewControllerAnimated:YES completion:nil];
             //  [self presentViewController:scoreVw animated:YES completion:nil];}
         if([SingletonClass sharedSingleton].life==0){
             
             
                             check=1;
                 ScoreViewController *s1=[[ScoreViewController alloc]init];
             if([SingletonClass sharedSingleton].Score!=0){
                 [s1 facebukshare];
                 [s1 checkHighScore];
                 [s1 checkBeatFriends];
                 
             }
             
                 //---------------------
                 Timer *timer=[[Timer alloc]init];
                 
                 [[SingletonClass sharedSingleton].timer invalidate];
                 [self presentViewController:timer animated:YES completion:nil];
                 
                 
                 
             

             
             
             
             
            //--------------------

        }
    
            
        
        
    

    //______________________________________
 else   if([SingletonClass sharedSingleton].level==2){
        PlayGamelevel2 *play=[[PlayGamelevel2 alloc]initWithNibName:@"PlayGamelevel2" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
    }
    else if([SingletonClass sharedSingleton].level==3){
        
        PlayGameLevel3 *play1=[[PlayGameLevel3 alloc]init];
        [self presentViewController:play1 animated:YES completion:nil];
    }
    else if([SingletonClass sharedSingleton].level==4){
        [SingletonClass sharedSingleton].noOfGame++;
        PlayGameLevel4 *play=[[PlayGameLevel4 alloc]initWithNibName:@"PlayGameLevel4" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
    }
    else if([SingletonClass sharedSingleton].level==5){
        
        [SingletonClass sharedSingleton].noOfGame++;
        PlayGameLevel5 *play=[[PlayGameLevel5 alloc]initWithNibName:@"PlayGameLevel5" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
        
    }
    else if([SingletonClass sharedSingleton].level==6){
        
        [SingletonClass sharedSingleton].noOfGame++;
        PlayGameLevel6 *play=[[PlayGameLevel6 alloc]initWithNibName:@"PlayGameLevel6" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
        
        
    }
    else if([SingletonClass sharedSingleton].level==7){
        
        [SingletonClass sharedSingleton].noOfGame++;
        
        PlayGameLevel7 *play=[[PlayGameLevel7 alloc]initWithNibName:@"PlayGameLevel7" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
        
        
        
    }
    else if([SingletonClass sharedSingleton].level==8){
        
        [SingletonClass sharedSingleton].noOfGame++;
        
        
        PlayLevel8 *play=[[PlayLevel8 alloc]initWithNibName:@"PlayLevel8" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];

        
        
    }
    else if([SingletonClass sharedSingleton].level==9){
        
        [SingletonClass sharedSingleton].noOfGame++;
        Level9 *play=[[Level9 alloc]initWithNibName:@"Level9" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];

        
        
        }
    
    else if([SingletonClass sharedSingleton].level==1){
       // if(count>=2)
        //{
        
      // else{
        [SingletonClass sharedSingleton].noOfGame++;
        
        PlayGame *play=[[PlayGame alloc]initWithNibName:@"PlayGame" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
            count++;
      // }
    }
  }






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
