//
//  mainLevel.m
//  BrainMemoryMaster1
//
//  Created by GBS-ios on 1/17/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "mainLevel.h"
#import <Parse/Parse.h>

@interface mainLevel (){
    CGRect screenRect;
    int height1;
    int width1;

}

@end

@implementation mainLevel

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
    
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width1, height1)];
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
   
    onlyOne=1;
   // backImg.image=[UIImage imageNamed:@"game_choose_bg.png"];
    [self.view addSubview:backImg];
    [NSThread detachNewThreadSelector:@selector(collectionVw) toTarget:self withObject:nil];
     [self createUI];
    

   
}

-(void)createUI{
   
    UIView *gameView=[[UIView alloc]initWithFrame:CGRectMake(40*width1/320, 80*height1/480, 240*width1/320, 240*height1/480)];
    //gameView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    [self.view addSubview:gameView];
   
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame=CGRectMake(10*width1/320,30*height1/480,70*width1/320, 50*height1/480);
    back.backgroundColor=[UIColor clearColor];
    back.titleLabel.textAlignment=NSTextAlignmentLeft;
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back setBackgroundImage:[UIImage imageNamed:@"arr2.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    
    
    UIImageView *labBackImg=[[UIImageView alloc]initWithFrame:CGRectMake(30*width1/320, 20*height1/480, 180*width1/320, 70*height1/480)];
    labBackImg.image=[UIImage imageNamed:@"gamelab.png"];
    [gameView addSubview:labBackImg];
    
    UILabel *gameLab=[[UILabel alloc]initWithFrame:CGRectMake(10*width1/320,15*height1/480,160*width1/320,40*height1/480)];
    gameLab.textColor=[UIColor blackColor];
    gameLab.textAlignment=NSTextAlignmentCenter;
    gameLab.layer.shadowColor=[UIColor whiteColor].CGColor;
    NSString *score=[NSString stringWithFormat:@"GAME%d",[SingletonClass sharedSingleton].level];
    gameLab.font=[UIFont systemFontOfSize:width1/14];
    gameLab.text=score;
    [labBackImg addSubview:gameLab];
    
   
    UIButton *play=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    play.frame=CGRectMake(20*width1/320, 100*height1/480,200*width1/320, height1/10);
    play.backgroundColor=[UIColor clearColor];
    play.layer.cornerRadius=7.0f;
    [play setBackgroundImage:[UIImage imageNamed:@"play_btn.png"] forState:UIControlStateNormal];
    [play setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    play.layer.shadowOffset=CGSizeMake(5, 3);
    play.titleLabel.font=[UIFont boldSystemFontOfSize:22.0];
    play.titleLabel.shadowOffset=CGSizeMake(2, 1);
    play.titleLabel.textColor=[UIColor whiteColor];
    play.layer.shadowOpacity=2.0;
    play.alpha=1;
    [play addTarget:self action:@selector(PlayAction) forControlEvents:UIControlEventTouchUpInside];
    [gameView addSubview:play];
    
    
    
    UIView *scoreView=[[UIView alloc]initWithFrame:CGRectMake(0,270, 320, 160)];
    scoreView.backgroundColor=[UIColor blackColor];
    scoreView.alpha=.3;
    //[self.view addSubview:scoreView];
    

    
    
}




-(void)PlayAction{
    
    if([SingletonClass sharedSingleton].level==1){
        
        PlayGame *play=[[PlayGame alloc]initWithNibName:@"PlayGame" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }
    if([SingletonClass sharedSingleton].level==2){
        
        PlayGamelevel2 *play=[[PlayGamelevel2 alloc]initWithNibName:@"PlayGamelevel2" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }
    if([SingletonClass sharedSingleton].level==3){
        PlayGameLevel3 *play=[[PlayGameLevel3 alloc]initWithNibName:@"PlayGameLevel3" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }
    if([SingletonClass sharedSingleton].level==4){
        PlayGameLevel4 *play=[[PlayGameLevel4 alloc]initWithNibName:@"PlayGameLevel4" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }
    if([SingletonClass sharedSingleton].level==5){
        PlayGameLevel5 *play=[[PlayGameLevel5 alloc]initWithNibName:@"PlayGameLevel5" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }
    if([SingletonClass sharedSingleton].level==6){
        PlayGameLevel6 *play=[[PlayGameLevel6 alloc]initWithNibName:@"PlayGameLevel6" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }
    if([SingletonClass sharedSingleton].level==7){
        PlayGameLevel7 *play=[[PlayGameLevel7 alloc]initWithNibName:@"PlayGameLevel7" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }
    if([SingletonClass sharedSingleton].level==8){
        PlayLevel8 *play=[[PlayLevel8 alloc]initWithNibName:@"PlayLevel8" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }
    if([SingletonClass sharedSingleton].level==9){
        Level9 *play=[[Level9 alloc]initWithNibName:@"Level9" bundle:nil];
        play.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play animated:YES completion:nil];
    }

    
    
    
    
    
}




-(void)backButAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark-
#pragma collection view


-(void)collectionVw{
    
        onlyOne=2;
    if([SingletonClass sharedSingleton].fbStatus==0){
        UIView *singleVw=[[UIView alloc]initWithFrame:CGRectMake(100*width1/320, 250*height1/480,120*width1/320,160*height1/480)];
        [self.view addSubview:singleVw];
        UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(0, 30*height1/480, 120*width1/320, 100*height1/480)];
                [singleVw addSubview:logo];
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0,130*height1/480, 120*width1/320, 30*height1/480)];
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"mainUser"]);
        name.backgroundColor = [UIColor redColor];
        name.font=[UIFont systemFontOfSize:15];
        //name.font = [UIFont fontWithName:@"Miso-Bold" size:20];
        name.textAlignment = NSTextAlignmentCenter;
        [singleVw addSubview:name];
        
        if([[NSUserDefaults standardUserDefaults]integerForKey:@"onceLoggedin"]==1){
            NSString *proImageUrl=[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[[NSUserDefaults standardUserDefaults]objectForKey:@"mainfbID"]];
            logo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:proImageUrl]]];
            name.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"mainUser"];

        }else{
            name.text=@"YOU";
            logo.image=[UIImage imageNamed:@""];
        }

        
        
        UILabel *Score = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 120*width1/320, 30*height1/480)];
        NSString *levelScore=[NSString stringWithFormat:@"levelScore%d",[SingletonClass sharedSingleton].level];
        NSInteger storedScore = [[NSUserDefaults standardUserDefaults] integerForKey:levelScore];
        Score.text=[NSString stringWithFormat:@"%d",(int)storedScore];
        Score.backgroundColor = [UIColor redColor];
        Score.font = [UIFont fontWithName:@"Miso-Bold" size:20];
        Score.textAlignment = NSTextAlignmentCenter;
        [singleVw addSubview:Score];
        
        
        
        return;
    }
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(80*width1/320, 130*height1/480);
    flowLayout.minimumInteritemSpacing =25;
    flowLayout.minimumLineSpacing = 20;
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(30*width1/320, 250*height1/480, 260*width1/320, 150*height1/480) collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.bounces = YES;
     self.collectionView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.collectionView];

}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   
        return [SingletonClass sharedSingleton].friendUsers.count+1;
   
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *info;
    for (UILabel *lbl in cell.contentView.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            [lbl removeFromSuperview];
        }
    }
     NSString *levelScore1=[NSString stringWithFormat:@"levelScore%d",[SingletonClass sharedSingleton].level];
    if(indexPath.row==0){
        info=[SingletonClass sharedSingleton].Player;
        [SingletonClass sharedSingleton].previousScoreOfCurrentPlayer=[[info objectForKey:levelScore1] intValue];
    }
    else{
    info=[[SingletonClass sharedSingleton].friendUsers objectAtIndex:indexPath.row-1];
    }
    


    
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80*width1/320, 25*height1/480)];
    name.backgroundColor = [UIColor clearColor];
    name.font=[UIFont systemFontOfSize:width1/25];
    name.textAlignment = NSTextAlignmentCenter;
    name.textColor=[UIColor blackColor];
    name.text=[info objectForKey:@"userName"];
    [cell.contentView addSubview:name];

    
    
    UILabel *Score = [[UILabel alloc]initWithFrame:CGRectMake(0, 105*height1/480, 80*width1/320,25*height1/480)];
    Score.backgroundColor = [UIColor clearColor];
    Score.textColor=[UIColor blackColor];
    Score.font=[UIFont systemFontOfSize:width1/25];
   
    NSLog(@"%@",info);
    int no=[[info objectForKey:levelScore1]integerValue];
    NSString *str=[NSString stringWithFormat:@"%d",no];
    Score.text=str;
   
    Score.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:Score];

    
       
    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(0,25*height1/480,80*width1/320, 80*height1/480)];
    logo.image=[UIImage imageNamed:@""];
    NSString *proImageUrl=[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[info objectForKey:@"PlayerFBID"]];
    logo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:proImageUrl]]];
    [cell addSubview:logo];
    
    cell.backgroundColor = [UIColor clearColor];
    //https://graph.facebook.com/%@/picture?type=small
    
    return cell;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
