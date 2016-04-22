//
//  PlayGamelevel2.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/14/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "PlayGamelevel2.h"

@interface PlayGamelevel2 (){
    CGRect screenRect;
    int height1;
    int width1;
    int alertt;
}

@end

@implementation PlayGamelevel2

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
    alertt=1;
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    selectedColor=[[NSMutableArray alloc]init];
    selectedColorName=[[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view from its nib.
    timeOver=1;
    
    _mainLevel=[SingletonClass sharedSingleton].mainLevel;
    
    if((_mainLevel==1)||(_mainLevel==2))
        time=4;
    
    else if(_mainLevel==3)
        time=3;
            else if
            (_mainLevel==4)
        time=2;
    
    
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
    }    else if((width1>800)&&(height1>1700)){
        backImg.image=[UIImage imageNamed:@"game5_choose_bg.png"];
    }

    [self.view addSubview:backImg];
    //-----------------------------------------------------
    //top view
    
    UILabel *scoreLab=[[UILabel alloc]init];
    if ((width1>=375)&&(height1>=667)) {
        scoreLab.frame=CGRectMake(width1-115,width1/15,width1/4,40);
    }
    else{
        scoreLab.frame=CGRectMake(width1-90,width1/15,width1/4,40);
    }

    scoreLab.textColor=[UIColor blueColor];
    scoreLab.textAlignment=NSTextAlignmentCenter;
    //scoreLab.font=[UIFont systemFontOfSize:17.0f];
    scoreLab.layer.shadowColor=[UIColor whiteColor].CGColor;
    //title.font=[UIFont boldsystemFontOfSize:20.0f];
    scoreLab.font=[UIFont systemFontOfSize:width1/20];
    NSString *score=[NSString stringWithFormat:@"Score:%d",[SingletonClass sharedSingleton].Score];
    scoreLab.text=score;
    [self.view addSubview:scoreLab];
    
    
    
    
    
    
    UILabel *levelLabel=[[UILabel alloc]initWithFrame:CGRectMake(width1/2-width1/8-5,width1/15,width1/4+10,40)];
    //levelLabel.backgroundColor=[UIColor ];
    levelLabel.textColor=[UIColor blueColor];
    levelLabel.textAlignment=NSTextAlignmentCenter;
    levelLabel.layer.shadowColor=[UIColor whiteColor].CGColor;
    levelLabel.font=[UIFont systemFontOfSize:width1/20];

    NSString *levelStr=[NSString stringWithFormat:@"Game:%d",(int)[SingletonClass sharedSingleton].level];
    levelLabel.text=levelStr;
    [self.view addSubview:levelLabel];
    

    
    //------------------------------------------------------
    //TOP VIEW
       
    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0, width1/15+45, width1, 1)];
    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
    [self.view addSubview:devider];
    
    //self.view.backgroundColor=[UIColor ]
    [self waitTime];
    colors=[NSArray arrayWithObjects:[UIColor blueColor],[UIColor whiteColor],[UIColor redColor],[UIColor yellowColor],[UIColor brownColor],[UIColor greenColor],[UIColor purpleColor],[UIColor orangeColor],[UIColor colorWithRed:(CGFloat)252/255 green:(CGFloat)15/255 blue:(CGFloat)192/255 alpha:1],[UIColor colorWithRed:(CGFloat)58/255 green:(CGFloat)179/255 blue:(CGFloat)252/255 alpha:1],[UIColor grayColor], nil];
    colorName=[NSArray arrayWithObjects:@"blue",@"white",@"red",@"yellow",@"brown",@"green",@"purple",@"orrage",@"pink",@"sky blue",@"gray", nil];
    //call methode afetr time over
    
    
    
    [self createCollectionView];
    [self performSelector:@selector(timerOver) withObject:nil afterDelay:(time+.2)];
    
    
    
}



-(void)viewWillAppear:(BOOL)animated{
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
    

    highScore.textAlignment=NSTextAlignmentCenter;
    highScore.layer.shadowColor=[UIColor whiteColor].CGColor;
   // NSString *levelScore=[NSString stringWithFormat:@"levelScore%d%d",[SingletonClass sharedSingleton].mainLevel,[SingletonClass sharedSingleton].level];
    highScore.font=[UIFont systemFontOfSize:width1/22];
    NSInteger storedScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore2"];
    
    highScore.text=[NSString stringWithFormat:@"Highscore:%d",(int)storedScore];
     NSLog(@"stored score===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore2"]);


    highScore.textColor=[UIColor whiteColor];
    
    [lifeView addSubview:highScore];
    
    
    int x=5;
    NSLog(@"after click life===%d",[SingletonClass sharedSingleton].life );
    
    for(int i=0;i<5;i++){
        UIImageView *life1=[[UIImageView alloc]init];
        life1.frame=CGRectMake(x,10, width1/15,width1/15);
        
            life1.image=[UIImage imageNamed:@"no_life.png"];
       
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
    alertt=2;
    
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


#pragma mark-
#pragma mark- waitTime
//time to memorise letters.





-(void)viewDidAppear:(BOOL)animated{
    if(!selectLetter){
        
        //if(width1>=375&&height1>=667){
            selectLetter=[[UITextField alloc]initWithFrame:CGRectMake(0, 75, width1, 50)];
       // }
        //else{
        //selectLetter=[[UITextField alloc]initWithFrame:CGRectMake(0, height1*100/480, width1, 50)];
        //}
        
        selectLetter.font=[UIFont systemFontOfSize:width1/20];
        selectLetter.textAlignment=NSTextAlignmentCenter;
        selectLetter.textColor=[UIColor blackColor];
        [selectLetter resignFirstResponder];
        selectLetter.delegate=self;
        [self.view addSubview:selectLetter];
        //choose rando letter
    }
    int lettorNo;
    if((_mainLevel==1)||(_mainLevel==2)){
   lettorNo = arc4random_uniform(6);
    }
    else{
         lettorNo = arc4random_uniform(9);
    }
    ansColor=(UIColor*)[selectedColor objectAtIndex:lettorNo];
    selectLetter.text=[NSString stringWithFormat:@"Identify label with '%@' color",[selectedColorName objectAtIndex:lettorNo]];
   

    [UIView animateWithDuration:time animations:^{
        //timeView1.frame=CGRectMake(width1*60/320, height1*160/480, width1*200/320, 10);
        timeView1.frame=CGRectMake(width1/6, 120, width1-width1/3, 10);
        
    }];
    
    
}


-(void)waitTime{
    
    
    
    
    
    //timeView=[[UIView alloc]initWithFrame:CGRectMake(width1*60/320, height1*160/480, width1*200/320, 10)];
      timeView=[[UIView alloc]initWithFrame:CGRectMake(width1/6,120, width1-width1/3, 10)];
    timeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    timeView.layer.cornerRadius=7.0f;
    [self.view addSubview:timeView];
    
   // timeView1=[[UIView alloc]initWithFrame:CGRectMake(width1*60/320, height1*160/480, 20,10)];
        timeView1=[[UIView alloc]initWithFrame:CGRectMake(width1/6,120, 20,10)];
    timeView1.backgroundColor=[UIColor redColor];
    timeView1.layer.cornerRadius=7.0f;
    
    [self.view addSubview:timeView1];
}

#pragma mark-
#pragma mark- action after timeover
//come here after time over
-(void)timerOver{
    
    if(timeOver==2)
    {
        
    }
   

    else{
    timeOver=2;
        
        if(alertt!=2)
        {
        
            ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
            next.timeOver=true;
    next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:next animated:YES completion:nil];
        }
        else
        {
            [SingletonClass sharedSingleton].life--;
        }
    }
    
    
}


#pragma mark-
#pragma mark- collection and methode
-(void)createCollectionView{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 5;
   /* if((_mainLevel==1)||(_mainLevel==2)){
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*35/320, height1*200/480,width1*250/320,height1* 215/320) collectionViewLayout:layout];
    }
    
    
     else if ((_mainLevel==3)||(_mainLevel==4)){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*35/320, height1*200/480,width1*250/320,height1* 215/320) collectionViewLayout:layout];
     }*/
    
    if([SingletonClass sharedSingleton].Score>90){
//        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10, height1/2-60, width1-20, width1) collectionViewLayout:layout];
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10, 160, width1-20, width1) collectionViewLayout:layout];
    }
    
    else if([SingletonClass sharedSingleton].Score>60){
//        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.147, height1/2-35, width1*.72, width1) collectionViewLayout:layout];
            _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.147, 160, width1*.72, width1) collectionViewLayout:layout];

    }
    else //if (_mainLevel==2)
    {
//        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.135, height1/2-35, width1*.74, width1*.7) collectionViewLayout:layout];
            _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.147, 160, width1*.72, width1) collectionViewLayout:layout];

    }

     
    
    
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
    
     if ([SingletonClass sharedSingleton].Score>150){
        return 24;
    }
    else if ([SingletonClass sharedSingleton].Score>120){
        return 20;
    }
    else if ([SingletonClass sharedSingleton].Score>90){
        return 16;
    }
    else if ([SingletonClass sharedSingleton].Score>60){
        return 9;
    }


    else{
        return 6;
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    
   
    lab =[[UILabel alloc]initWithFrame:CGRectMake(0, 5, cell.bounds.size.width  ,cell.bounds.size.height-10)];
        
    
    cell.layer.borderColor=[UIColor whiteColor].CGColor;
    cell.layer.cornerRadius=5.0f;
    cell.layer.borderWidth=.5f;
    
    int lettorNo;
    int lettorNo1;
    if((_mainLevel==1)||(_mainLevel==2)){
    lettorNo= arc4random_uniform(11);
        NSLog(@"letterno=%d",lettorNo);
    lettorNo1 = arc4random_uniform(11);
       NSLog(@"letterno1=%d",lettorNo1);
    }
    else{
        lettorNo= arc4random_uniform(11);
        NSLog(@"letterno=%d",lettorNo);
       lettorNo1 = arc4random_uniform(11);
        NSLog(@"letterno1=%d",lettorNo1);
    }
    //NSLog(@"%d",lettorNo);
    lab.text=[colorName objectAtIndex:lettorNo];
  
    lab.textColor=[colors objectAtIndex:lettorNo1];
    lab.textAlignment=NSTextAlignmentCenter;
    [selectedColor insertObject:[colors objectAtIndex:lettorNo1] atIndex:indexPath.row];
    [selectedColorName insertObject:[colorName objectAtIndex:lettorNo1] atIndex:indexPath.row];
    
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=[UIFont boldSystemFontOfSize:width1/20];
    
    cell.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    [cell.contentView addSubview:lab];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    timeOver=2;
    ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
    if([ansColor isEqual:[selectedColor objectAtIndex:indexPath.row]])
    {
        next.result=true;
        NSLog(@"result=%d",next.result);
    }
    else{
        next.result=false;
        NSLog(@"result=%d",next.result);

    }
    next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:next animated:YES completion:nil];
    
}






- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //if(_level==1){
    return CGSizeMake(width1*70/320,height1*40/480);
    
    /*}
     else if (_level==2){
     return CGSizeMake(70, 40);
     }
     else if (_level==3){
     return CGSizeMake(60, 40);
     }
     else if (_level==4){
     return CGSizeMake(60, 40);
     }
     else if (_level==5){
     return CGSizeMake(50, 30);
     }
     return CGSizeMake(70, 50);
     */
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
