//
//  PlayGame.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "PlayGame.h"

@interface PlayGame (){
    CGRect screenRect;
    int height1;
    int width1;
    UILabel *label;
}

@end

@implementation PlayGame

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
   
    _mainLevel=(int)[SingletonClass sharedSingleton].mainLevel;
    letters=[[NSMutableArray alloc]init];
    timeOver=1;
    tryChance=0;
    if((_mainLevel==1)||(_mainLevel==2)){
        time=4;
    }
    else if(_mainLevel==3){
        time=6;
    }
    else if(_mainLevel==4){
        time=7;
    }

    
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
    //self.view.backgroundColor=[UIColor blackColor];
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
    //scoreLab.font=[UIFont systemFontOfSize:17.0f];
    scoreLab.layer.shadowColor=[UIColor whiteColor].CGColor;
    //title.font=[UIFont boldsystemFontOfSize:20.0f];
    NSString *score=[NSString stringWithFormat:@"Score:%d",[SingletonClass sharedSingleton].Score];
  //  NSLog(@"score==%d",[SingletonClass sharedSingleton].Score);
    scoreLab.font=[UIFont systemFontOfSize:width1/22];
   
    scoreLab.text=score;
    [self.view addSubview:scoreLab];
    
    
    
    UILabel *levelLabel=[[UILabel alloc]initWithFrame:CGRectMake(width1/2-width1/8-5,width1/15,width1/4+10,40)];
    //levelLabel.backgroundColor=[UIColor ];
    levelLabel.textColor=[UIColor blueColor];
    levelLabel.textAlignment=NSTextAlignmentCenter;
    levelLabel.layer.shadowColor=[UIColor whiteColor].CGColor;
    levelLabel.font=[UIFont systemFontOfSize:width1/22];
    NSString *levelStr=[NSString stringWithFormat:@"Game: %d",(int)[SingletonClass sharedSingleton].level];
    levelLabel.text=levelStr;
    [self.view addSubview:levelLabel];
    
    
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width1==320){
        back.frame=CGRectMake(10*width1/320, (width1/15)+12,34*width1/320,20*height1/480);
    }
    else{
    back.frame=CGRectMake(10*width1/320, (width1/15),34*width1/320,20*height1/480);
    }
    back.backgroundColor=[UIColor clearColor];
    
    [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];

     back.titleLabel.textAlignment=NSTextAlignmentLeft;
    back.titleLabel.font=[UIFont systemFontOfSize:width1/22];
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    //------------------------------------------------------
    //TOP VIEW
   
    //top white line
    
   // count =0;
    
    
    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0, width1/15+45, width1, 1)];
    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
    [self.view addSubview:devider];
    letters=[[NSMutableArray alloc]init];
    chars=[NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    

    [self createCollectionView];
    [self waitTime];
    //call methode afetr time over
    
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

    
    highScore.textAlignment=NSTextAlignmentRight;
    highScore.layer.shadowColor=[UIColor whiteColor].CGColor;
    
    
    NSLog(@"before highscore====%d",[SingletonClass sharedSingleton].Score);
 //   NSString *levelScore=[NSString stringWithFormat:@"levelScore%d",[SingletonClass sharedSingleton].Score];
    
 //    NSLog(@"string level score====%@",levelScore);
    
    
    
    highScore.textColor=[UIColor whiteColor];
    highScore.font=[UIFont systemFontOfSize:width1/22];
    
    
    NSInteger storedScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore1"];
    NSLog(@"stored score===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore1"]);
    
    
    highScore.text=[NSString stringWithFormat:@"Highscore:%d",(int)storedScore];
    NSLog(@"highsco=======%ld",(long)storedScore);
    
    [lifeView addSubview:highScore];
    
    
    int x=5;
    NSLog(@"after click life===%d",[SingletonClass sharedSingleton].life );
    
    for(int i=0;i<5;i++){
        UIImageView *life1=[[UIImageView alloc]init];
        
             life1.image=[UIImage imageNamed:@"no_life.png"];
     
       
            
        
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


-(void)backButAction{
    
    
    
    
    
    UIAlertView  *alert1=[[UIAlertView alloc]initWithTitle:@"Message"
                                                  message:@" Want to quit the game?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert1 show];
    alert1.delegate=self;


}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",(long)buttonIndex);
    if(buttonIndex==0)
    {
        ScoreViewController *s1=[[ScoreViewController alloc]init];
        if([SingletonClass sharedSingleton].Score!=0)
            if([SingletonClass sharedSingleton].Score!=0)
        [s1 facebukshare];
        //[s1 checkHighScore];
       // [s1 checkBeatFriends];
        

        
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
    [UIView animateWithDuration:time animations:^{
        timeView1.frame=CGRectMake(width1/6, height1/6, width1-width1/3, 10);
        
    }];
    
    
}


-(void)waitTime
{
    timeView=[[UIView alloc]initWithFrame:CGRectMake(width1/6,height1/6, width1-width1/3, 10)];
    timeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    timeView.layer.cornerRadius=7.0f;
    [self.view addSubview:timeView];
    
    timeView1=[[UIView alloc]initWithFrame:CGRectMake(width1/6, height1/6, 20,10)];
    timeView1.backgroundColor=[UIColor redColor];
    timeView1.layer.cornerRadius=7.0f;
    
    [self.view addSubview:timeView1];
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(width1/6+10,height1/6-23, width1-width1/3, 20 )];
    
    if ((width1>=375)&&(height1>=667)) {
        label.frame=CGRectMake(width1/6+24,height1/6-26, width1-width1/3, 20);
    }
    else{
        label.frame=CGRectMake(width1/6+10,height1/6-23, width1-width1/3, 20);
    }
    label.text=@"Remember the alphabets";
    label.textColor=[UIColor blackColor];
    [self.view addSubview:label];
    
    
   
}

#pragma mark-
#pragma mark- action after timeover
//come here after time over
-(void)timerOver{
    
    timeOver=2;
    timeView.hidden=YES;
   timeView1.hidden=YES;
    label.hidden=YES;
    
    
  for(UICollectionView *view in self.view.subviews){
        if ([view isKindOfClass:[UICollectionView class]]) {
            [view removeFromSuperview];
        }
    }
    [self createCollectionView];
    
    //===================================
    
    UITextField *selectLetter=[[UITextField alloc]initWithFrame:CGRectMake(0, height1/6-20, width1, 50)];
    
    selectLetter.font=[UIFont systemFontOfSize:18.0f];
    selectLetter.textAlignment=NSTextAlignmentCenter;
    selectLetter.textColor=[UIColor blackColor];
    [self.view addSubview:selectLetter];
    //choose rando letter
    
    [selectLetter resignFirstResponder];
selectLetter.delegate=self;
    selectLetter.font=[UIFont systemFontOfSize:width1/22];
    int lettorNo = arc4random_uniform(8);
    if (letters.count!=0) {
        letter=[letters objectAtIndex:lettorNo];
        selectLetter.text=[NSString stringWithFormat:@"Identify cell containing '%@'",letter];
        NSLog(@"search letterno-->%d",lettorNo);
        NSLog(@"nos are:%@",letters);

    }
    
    
}


#pragma mark-
#pragma mark- collection and methode
-(void)createCollectionView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 5;
    if([SingletonClass sharedSingleton].Score>90){
         _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10, height1/5+20, width1-20, width1) collectionViewLayout:layout];
    }
    
   else if([SingletonClass sharedSingleton].Score>60){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.147, height1/5+20, width1*.72, width1) collectionViewLayout:layout];
    }
    else //if (_mainLevel==2)
    {
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.135, height1/5+20, width1*.74, width1*.7) collectionViewLayout:layout];
    }
  /*  else if (_mainLevel==3){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.1, height1/5+20, width1*.8, width1*.7) collectionViewLayout:layout];
    }
    
    else if (_mainLevel==4){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1/10, height1/5+20, width1*.8,.85*width1) collectionViewLayout:layout];
    }
    
    else if (_mainLevel==5){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(25, 170, 270, 270) collectionViewLayout:layout];
    }*/
    
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    //_collectionView.layer.transform=CATransform3DMakeRotation(0.0, 1.0, 0.0, 0.0);
    //_collectionView.layer.transform=CATransform3DMakeRotation(-.7,2, 0, 0);
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    _collectionView.layer.shadowColor=[UIColor blackColor].CGColor;
    _collectionView.layer.opacity=.8;
    [_collectionView.layer setShadowOffset:CGSizeMake(5, 2)];

   [self.view addSubview:_collectionView];
    
    
}
#pragma mark-
#pragma mark- collection methode

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if([SingletonClass sharedSingleton].Score>120){
        return 20;
    }
    else if ([SingletonClass sharedSingleton].Score>90){
        return 16;
    }
    else if ([SingletonClass sharedSingleton].Score>60){
        return 12;
    }
    else{
       return 9;
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
    
    
    
        lab =[[UILabel alloc]initWithFrame:CGRectMake(0,0,cell.bounds.size.width, cell.bounds.size.height)];
    
    
    
    if(timeOver==1){
      //inserting letters
        lab.textColor=[UIColor whiteColor];
        int lettorNo = arc4random_uniform(25);
        NSLog(@"to chosse----%d",lettorNo);
        //NSString *char=[chars objectAtIndex:lettorNo];
        lab.text=[chars objectAtIndex:lettorNo];
        //lab.font=[UIFont boldSystemFontOfSize:20.0f];
       
 [letters insertObject:[chars objectAtIndex:lettorNo] atIndex:indexPath.row];
       //  NSLog(@"%@",letters);
     
        
    }
    //when time is completed to choose the block
   else{
        lab.textColor=[UIColor clearColor];
    }
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=[UIFont systemFontOfSize:width1/20];
    cell.layer.borderWidth=.2f;
    cell.layer.borderColor=[UIColor blueColor].CGColor;
    cell.layer.cornerRadius=6.0f;
    
    cell.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    [cell.contentView addSubview:lab];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(timeOver==2){
        
        ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
        if([letter isEqualToString:[letters objectAtIndex:indexPath.row]]){
            next.result=true;
        }
        else
        {
            next.result=false;
        }
        next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
        //[curlableMapViewController presentModalViewController:next animated:YES];
        [self presentViewController:next animated:YES completion:nil];
        
    }
    tryChance++;
    
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(_mainLevel==1){
        return CGSizeMake(width1/4-15, width1/8);
    }
    else if (_mainLevel==2){
        return CGSizeMake(width1/4-15, width1/8);
    }
    else if (_mainLevel==3){
        return CGSizeMake(width1*.1875, width1/8);
    }
    else if (_mainLevel==4){
        return CGSizeMake(width1*.1875, width1/8);
    }
    else if (_mainLevel==5){
        return CGSizeMake(50, 30);
    }
    return CGSizeMake(70, 50);
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
