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
    
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    
  }



-(void)createUI{
    
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 00, width1, height1)];
    if((width1==320)&&(height1==480)){
        backImg.image=[UIImage imageNamed:@"game_choose_bg.png"];
            }
    else if((width1==320)&&(height1>480)){
        backImg.image=[UIImage imageNamed:@"game1_choose_bg.png"];
    }
    else if((width1>320)&&(height1<1000)){
        backImg.image=[UIImage imageNamed:@"game2_choose_bg.png"];
    }
    else if((width1>400)&&(height1<1150)){
        backImg.image=[UIImage imageNamed:@"game3_choose_bg.png"];
    }
    else if((width1>600)&&(height1>1150)){
        backImg.image=[UIImage imageNamed:@"game4_choose_bg.png"];
    }
    else if((width1>800)&&(height1>1700)){
        backImg.image=[UIImage imageNamed:@"game5_choose_bg.png"];
    }
    [self.view addSubview:backImg];
    


    NSArray *resultDisplay=[NSArray arrayWithObjects:[UIImage imageNamed:@"goodjob.png"],[UIImage imageNamed:@"welldone.png"],[UIImage imageNamed:@"brilliant.png"],nil];
    
    
    
    UIButton *tryAgain=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    tryAgain.frame=CGRectMake(width1*70/320,height1*325/480,width1*180/320,height1*35/480);
    tryAgain.backgroundColor=[UIColor clearColor];
    tryAgain.layer.cornerRadius=7.0f;
    [tryAgain setBackgroundImage:[UIImage imageNamed:@"try_again_btn.png"] forState:UIControlStateNormal];
    tryAgain.layer.shadowColor=[UIColor whiteColor].CGColor;
    [tryAgain addTarget:self action:@selector(tryAgainAction) forControlEvents:UIControlEventTouchUpInside];
        if(([SingletonClass sharedSingleton].level==1)||([SingletonClass sharedSingleton].level==3)||([SingletonClass sharedSingleton].level==9)){
        [self.view addSubview:tryAgain];
    }
  
    
    UIButton *contineu=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    contineu.frame=CGRectMake(width1*70/320,height1*280/480,width1*180/320,height1*35/480);

    contineu.backgroundColor=[UIColor clearColor];
    [contineu setBackgroundImage:[UIImage imageNamed:@"continue_btn.png"] forState:UIControlStateNormal];
    contineu.layer.cornerRadius=7.0f;
    contineu.layer.shadowColor=[UIColor whiteColor].CGColor;
    [contineu addTarget:self action:@selector(contineuAction) forControlEvents:UIControlEventTouchUpInside];
      [self.view addSubview:contineu];
    
    
    
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(0,height1*220/480,width1,height1*50/480)];
    title.backgroundColor=[UIColor clearColor];
    title.textColor=[UIColor blackColor];
    title.textAlignment=NSTextAlignmentCenter;
    title.font=[UIFont boldSystemFontOfSize:width1/15];
    
    
    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(width1*85/320,height1*80/480,width1*150/320,width1*130/320)];
    [self.view addSubview:logo];
    
    if(_result==true){
        int DispNo = arc4random_uniform(3);
        if(DispNo==0){
        logo.frame=CGRectMake(width1*65/320,height1*80/480,width1*190/320,width1*150/320);
        }
       else if(DispNo==1){
            logo.frame=CGRectMake(width1*80/320,height1*60/480,width1*160/320,width1*160/320);
        }
       else {
           logo.frame=CGRectMake(width1*85/320,height1*100/480,width1*150/320,width1*150/320);
       }

        logo.image=[resultDisplay objectAtIndex:DispNo];
    }
    else{
        logo.frame=CGRectMake(width1*75/320,height1*80/480,width1*170/320,width1*130/320);
        if(_timeOver==true){
            logo.image=[UIImage imageNamed:@"uff.png"];
            title.text=@"Time Over!.";
            
        }
        else{
            title.text=@"Oh! no";
            logo.image=[UIImage imageNamed:@"uff.png"];
        }
    }
    [self.view addSubview:title];
    
    
    
    
    
    
    //increase score
    if(_result==true){
        tryAgain.enabled=NO;
        
        [SingletonClass sharedSingleton].Score=[SingletonClass sharedSingleton].Score+(10*[SingletonClass sharedSingleton].mainLevel);
        [SingletonClass sharedSingleton].levelScore=[SingletonClass sharedSingleton].levelScore+10;
    }
    else  if(_result==false){
        [SingletonClass sharedSingleton].life--;
    }
    else if(_timeOver==true){
        [SingletonClass sharedSingleton].life--;
        
    }
    
    if([SingletonClass sharedSingleton].levelScore>=30){
        if([SingletonClass sharedSingleton].mainLevel==4){
            
        }
        else{
            [SingletonClass sharedSingleton].levelScore=0;
            
        }
        
        [SingletonClass sharedSingleton].mainLevel++;
        
    }
    
    
   
    
    //------------------------------------------------
    //check whether current score is highscore
    //NSString *levelScore=[NSString stringWithFormat:@"levelScore%d",([SingletonClass sharedSingleton].level)];
    
        
    
    
}

-(void)viewWillAppear:(BOOL)animated{
     [self createUI];
}

-(void)viewDidAppear:(BOOL)animated{
 
    if(([SingletonClass sharedSingleton].life==0)||(([SingletonClass sharedSingleton].levelScore==30)&&([SingletonClass sharedSingleton].mainLevel==5))){
    ScoreViewController *scoreVw=[[ScoreViewController alloc]initWithNibName:@"ScoreViewController" bundle:nil];
                             
    scoreVw.modalPresentationStyle=UIModalTransitionStyleFlipHorizontal;
                             
    [self presentViewController:scoreVw animated:YES completion:nil];
    
        
    }
}




-(void)tryAgainAction{
    self.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)contineuAction{
    if([SingletonClass sharedSingleton].level==2){
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
        [SingletonClass sharedSingleton].noOfGame++;
        
        PlayGame *play=[[PlayGame alloc]initWithNibName:@"PlayGame" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];

    }
  }






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
