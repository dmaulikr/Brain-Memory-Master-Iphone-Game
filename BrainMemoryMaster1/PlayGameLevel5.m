//
//  PlayGameLevel5.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/15/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "PlayGameLevel5.h"

@interface PlayGameLevel5 (){
    CGRect screenRect;
    int height1;
    int width1;
    int alert5;
}

@end

@implementation PlayGameLevel5

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
    alert5=1;
    
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    [self createUI];
    [self waitTime];
    
    //call methode afetr time over
    
    
    
    [self performSelector:@selector(timerOver) withObject:nil afterDelay:(time+.3)];
    
    
    
    
}


-(void)createUI{
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 00, width1, height1)];
     if((width1==320)&&(height1==480)){
        backImg.image=[UIImage imageNamed:@"game2_choose_bg copy.png"];
    }
    else if((width1==320)&&(height1==568)){
        backImg.image=[UIImage imageNamed:@"game2_choose_bg copy.png"];
    }
    else if((width1==375)&&(height1==667)){
        backImg.image=[UIImage imageNamed:@"game3_choose_bg copy.png"];

    }
    else if((width1>=414 && height1>=736)){
        backImg.image=[UIImage imageNamed:@"game_choose_bg6+.png"];
    }
    else if((width1>800)&&(height1>1700)){
        backImg.image=[UIImage imageNamed:@"game5_choose_bg.png"];
    }
    [self.view addSubview:backImg];

    timeOver=1;
    _mainLevel=[SingletonClass sharedSingleton].mainLevel;
    if(_mainLevel==1)
    {
        time=4;
    }
    else if(_mainLevel==2){
        time=3.5;
    }
    else if(_mainLevel==3){
        time=3;
    }
    else if(_mainLevel==4){
        time=2;
    }

    self.view.backgroundColor=[UIColor blackColor];
    //-----------------------------------------------------
    //bottom view
    UILabel *scoreLab=[[UILabel alloc]init];
    if ((width1>=375)&&(height1>=667)) {
        scoreLab.frame=CGRectMake(width1-115,width1/15,width1/4,40);
    }
    else{
        scoreLab.frame=CGRectMake(width1-90,width1/15,width1/4,40);
    }

    scoreLab.textColor=[UIColor blueColor];
    scoreLab.textAlignment=NSTextAlignmentCenter;
    scoreLab.font=[UIFont systemFontOfSize:width1/20];
    scoreLab.layer.shadowColor=[UIColor whiteColor].CGColor;
    //title.font=[UIFont boldsystemFontOfSize:20.0f];
    NSString *score=[NSString stringWithFormat:@"Score:%d",[SingletonClass sharedSingleton].Score];
    scoreLab.text=score;
    [self.view addSubview:scoreLab];
    
    
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
    [back addTarget:self action:@selector(backButAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    
    
    
    UILabel *levelLabel=[[UILabel alloc]initWithFrame:CGRectMake(120*width1/320,width1/15,80*width1/320,40)];
    //levelLabel.backgroundColor=[UIColor ];
    levelLabel.textColor=[UIColor blueColor];
    levelLabel.textAlignment=NSTextAlignmentCenter;
    levelLabel.layer.shadowColor=[UIColor whiteColor].CGColor;
    levelLabel.font=[UIFont systemFontOfSize:width1/20];
    NSString *levelStr=[NSString stringWithFormat:@"Game:%d",(int)[SingletonClass sharedSingleton].level];
    levelLabel.text=levelStr;
    [self.view addSubview:levelLabel];
    

    //------------------------------------------------------
    
    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0, width1/15+45, width1, 1)];
    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
    [self.view addSubview:devider];
    
    
    
    
    UIButton *trueBut=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    trueBut.frame=CGRectMake(20*width1/320, 320*height1/480,120*width1/320, 35*height1/480);
    trueBut.backgroundColor=[UIColor clearColor];
    trueBut.layer.cornerRadius=7.0f;
    //[trueBut setTitle:@"True" forState:UIControlStateNormal];
    //trueBut.titleLabel.text=@"True";
    //[[trueBut titleLabel] setFont:[UIFont fontWithName:@"Knewave" size:width1/20]];
    [trueBut setBackgroundImage:[UIImage imageNamed:@"true_btn.png"] forState:UIControlStateNormal];
    trueBut.layer.shadowColor=[UIColor whiteColor].CGColor;
    //[play setBackgroundImage:[UIImage imageNamed:@"login_button2.png"] forState:UIControlStateNormal];
    [trueBut addTarget:self action:@selector(trueAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:trueBut];
    
    
    
    UIButton *falseBut=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    falseBut.frame=CGRectMake(180*width1/320, 320*height1/480,120*width1/320, 35*height1/480);
    falseBut.backgroundColor=[UIColor clearColor];
    falseBut.layer.cornerRadius=7.0f;
    //[falseBut setTitle:@"False" forState:UIControlStateNormal];
    //falseBut.titleLabel.text=@"False";
    //[[falseBut titleLabel] setFont:[UIFont fontWithName:@"Knewave" size:width1/20]];
    falseBut.layer.shadowColor=[UIColor whiteColor].CGColor;
    //[play setBackgroundImage:[UIImage imageNamed:@"login_button2.png"] forState:UIControlStateNormal];
    [falseBut setBackgroundImage:[UIImage imageNamed:@"false_btn.png"] forState:UIControlStateNormal];
    [falseBut addTarget:self action:@selector(falseAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:falseBut];
    
    
    NSArray *chars=[NSArray arrayWithObjects:@"a",@" b",@" c",@" d",@" e",@" f",@" g",@" h",@" i",@" j",@" k",@" l",@" m",@" n",@" o",@" p",@" q",@" r",@" s",@" t",@" u",@" v",@" w",@" x",@" y",@" z",nil];
    
    UITextView *viewAbcdDisplay=[[UITextView alloc]init];
    if(width1>=414&&height1>=736){
        viewAbcdDisplay.frame= CGRectMake(50, 190*height1/480, 300, 150);
    }
    else{
    viewAbcdDisplay.frame=CGRectMake(25*width1/320, 190*height1/480, 270*width1/320, 100*height1/480);
        
    }
    viewAbcdDisplay.editable=NO;
    [self.view addSubview:viewAbcdDisplay];
    NSMutableString *charStr=[[NSMutableString alloc]init];
    int letterTobeMissed = arc4random_uniform(25);
    shouldmissLeter = arc4random_uniform(2);
    NSLog(@"%d",shouldmissLeter);
    NSLog(@"%d",letterTobeMissed);
    
    for(NSUInteger i=0;i<26;i++)
    {
        //conditon for not printing the missed letter
        if(!((shouldmissLeter==1)&&(letterTobeMissed==i)))
        {
            
            [charStr appendString:[chars objectAtIndex:i]];
            NSLog(@"%@",charStr);
        }
    }
    //viewAbcdDisplay.font=[UIFont fontWithName:@"Knewave" size:25.0f];
    viewAbcdDisplay.font=[UIFont boldSystemFontOfSize:width1/18];
    viewAbcdDisplay.backgroundColor=[UIColor clearColor];
    viewAbcdDisplay.layer.borderColor=[UIColor blackColor].CGColor;
    viewAbcdDisplay.layer.borderWidth=.5;
    viewAbcdDisplay.textColor=[UIColor blackColor];
    viewAbcdDisplay.text=charStr;
}




-(void)viewWillAppear:(BOOL)animated{
    
    //display no of life remain
    UIView *lifeView=[[UIView alloc]initWithFrame:CGRectMake(0, height1-height1/15, width1, height1/15)];
    lifeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    [self.view addSubview:lifeView];
    
    
    UILabel *highScore=[[UILabel alloc]init];
    if(width1==375&&height1==667 ){
        highScore.frame=CGRectMake(width1-180,0,width1/2-30,height1/17);
    }
    else if(width1>=414&&height1>=736){
        highScore.frame=CGRectMake(width1-200,0,width1/2-30,height1/17);
    }
    else{
        highScore.frame=CGRectMake(width1-150,0,width1/2-30,height1/17);
    }

    highScore.font=[UIFont systemFontOfSize:width1/22];
    highScore.textAlignment=NSTextAlignmentCenter;
    highScore.textColor=[UIColor whiteColor];
    highScore.layer.shadowColor=[UIColor whiteColor].CGColor;
   // NSString *levelScore=[NSString stringWithFormat:@"levelScore%d%d",[SingletonClass sharedSingleton].mainLevel,[SingletonClass sharedSingleton].level];
    
    NSInteger storedScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore5"];
    NSLog(@"stored score===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore5"]);
    

    
    highScore.text=[NSString stringWithFormat:@"Highscore:%d",(int)storedScore];
    
    
    [lifeView addSubview:highScore];
    
    
    int x=5;
    NSLog(@"after click life===%d",[SingletonClass sharedSingleton].life );
    
    for(int i=0;i<5;i++){
        UIImageView *life1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"no_life.png"]];
        life1.frame=CGRectMake(x,10, width1/15,width1/15);
        
        x=x+width1/15+3;
        
        [lifeView addSubview:life1];
        
    }
    
    
    NSLog(@"%d",[SingletonClass sharedSingleton].life);
    int x1=5;
    for(int i=0;i<[SingletonClass sharedSingleton].life;i++){
        
        UIImageView *life=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life.png"]];
        life.frame=CGRectMake(x1,10, width1/15,width1/15);
        
        x1=x1+width1/15+3;
        
        [lifeView addSubview:life];
    }
   
}

-(void)backButAction:(id)sender{
    alert5=2;
    
    UIAlertView  *alert1=[[UIAlertView alloc]initWithTitle:@"Message"
                                                   message:@" Want to quit the game?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert1 show];
    alert1.delegate=self;
    
    

    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",(long)buttonIndex);
    if(buttonIndex==0)
    {
        ScoreViewController *s5=[[ScoreViewController alloc]init];
        if([SingletonClass sharedSingleton].Score!=0)
        [s5 facebukshare];
       // [s5 checkHighScore];
       // [s5 checkBeatFriends];
        
        
        mainLevel *go1=[[mainLevel alloc]initWithNibName:@"Levels" bundle:nil];
        go1.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        //----------------------------------------------------
        //-----------------------------------------------------
        [self presentViewController:go1 animated:YES completion:nil];
        
        
        
    }
}





#pragma mark-
#pragma mark- waitTime
//time to memorise letters.

-(void)viewDidAppear:(BOOL)animated{
    if(!selectLetter){
        selectLetter=[[UITextField alloc]initWithFrame:CGRectMake(0, 85*height1/480, width1, 50)];
        [selectLetter resignFirstResponder];
        selectLetter.delegate=self;
        
        selectLetter.font=[UIFont systemFontOfSize:width1/20];
        selectLetter.textAlignment=NSTextAlignmentCenter;
        selectLetter.textColor=[UIColor blackColor];
        [self.view addSubview:selectLetter];
        //choose rando letter
    }
    selectLetter.text=[NSString stringWithFormat:@"check whether any letter is missing"];
    [UIView animateWithDuration:time animations:^{
        timeView1.frame=CGRectMake(60*width1/320, 150*height1/480, 200*width1/320, 10);
        
    }];
    
    
}


-(void)waitTime{
    timeView=[[UIView alloc]initWithFrame:CGRectMake(60*width1/320, 150*height1/480, 200*width1/320, 10)];
    timeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    timeView.layer.cornerRadius=7.0f;
    [self.view addSubview:timeView];
    
    timeView1=[[UIView alloc]initWithFrame:CGRectMake(60*width1/320, 150*height1/480,20,10)];
    timeView1.backgroundColor=[UIColor redColor];
    timeView1.layer.cornerRadius=7.0f;
    
    [self.view addSubview:timeView1];
}

#pragma mark-
#pragma mark- action after timeover
//come here after time over
-(void)timerOver{
    if(timeOver==2){
        
    }
    else{
        
    timeOver=2;
        if(alert5!=2){
    ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
    next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    next.timeOver=true;
            [self presentViewController:next animated:YES completion:nil];
        }
        else{
            [SingletonClass sharedSingleton].life--;
        }
    }
    
    
}



-(void)trueAction{
    timeOver=2;
    ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
    next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    
    
    if(shouldmissLeter!=1){
        next.result=true;
    }
    else{
        next.result=false;
    }
    [self presentViewController:next animated:YES completion:nil];
    
    
}
-(void)falseAction{
    timeOver=2;
    
    ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
    next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    if(shouldmissLeter==1){
        next.result=true;
    }
    else{
        next.result=false;
    }
    [self presentViewController:next animated:YES completion:nil];
    
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
