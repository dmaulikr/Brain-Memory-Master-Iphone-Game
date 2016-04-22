//
//  PlayGameLevel4.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/14/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "PlayGameLevel4.h"

@interface PlayGameLevel4 (){
    CGRect screenRect;
    int height1;
    int width1;
    int alert4;
}

@end

@implementation PlayGameLevel4

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
    alert4=1;
    
    

    
    
    
    
    
    
    
    
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    // Do any additional setup after loading the view from its nib.
    
    timeOver=1;
    differentCellNo = arc4random_uniform(63);
    
    
    colorNO=arc4random_uniform(8);
    if(colorNO==3||colorNO==2)
        colorNO=1;
    if(colorNO==5)
        colorNO=7;
    
        
    _mainLevel=[SingletonClass sharedSingleton].mainLevel;
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
   
    
    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0, width1/15+40, width1, 1)];
    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
    [self.view addSubview:devider];
    
    
    [self waitTime];
    colors=[NSArray arrayWithObjects:[UIColor blueColor],[UIColor whiteColor],[UIColor redColor],[UIColor yellowColor],[UIColor brownColor],[UIColor greenColor],[UIColor grayColor],[UIColor orangeColor],[UIColor purpleColor], nil];
    //call methode afetr time over
    
    
    
    [self createCollectionView];
    [self performSelector:@selector(timerOver) withObject:nil afterDelay:4];
    
    
    
    
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
    highScore.textAlignment=NSTextAlignmentRight;
    highScore.layer.shadowColor=[UIColor whiteColor].CGColor;
   // NSString *levelScore=[NSString stringWithFormat:@"levelScore%d%d",[SingletonClass sharedSingleton].mainLevel,//[SingletonClass sharedSingleton].level];
    highScore.textColor=[UIColor whiteColor];
    highScore.font=[UIFont systemFontOfSize:width1/22];
    NSInteger storedScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore4"];
    
    highScore.text=[NSString stringWithFormat:@"Highscore:%d",(int)storedScore];
    NSLog(@"stored score===%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"highScore4"]);
    

    
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
    UIButton *back1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width1==320){
        back1.frame=CGRectMake(10*width1/320, (width1/15)+12,34*width1/320,20*height1/480);
    }
    else{
        back1.frame=CGRectMake(10*width1/320, (width1/15),34*width1/320,20*height1/480);
    }
    back1.backgroundColor=[UIColor clearColor];
    
    [back1 setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];

    back1.titleLabel.textAlignment=NSTextAlignmentLeft;
    back1.titleLabel.font=[UIFont systemFontOfSize:width1/20];
    [back1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back1 addTarget:self action:@selector(backButAction4:) forControlEvents:UIControlEventTouchUpInside];
    back1.enabled=YES;
    [self.view addSubview:back1];
    
    
    
    
}

-(void)backButAction4:(id)sender{
    
    alert4=2;
    UIAlertView  *alert1=[[UIAlertView alloc]initWithTitle:@"Message"
                                                   message:@" Want to quit the game?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert1 show];
    alert1.delegate=self;
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",(long)buttonIndex);
    if(buttonIndex==0)
    {
        ScoreViewController *s4=[[ScoreViewController alloc]init];
        if([SingletonClass sharedSingleton].Score!=0)
        [s4 facebukshare];
       // [s4 retrievePlayerInfo];
        //[s4 checkHighScore];
        //[s4 checkBeatFriends];
       
        
        
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
        selectLetter=[[UITextField alloc]initWithFrame:CGRectMake(50*width1/320, 85*height1/480, 220*width1/320, 40)];
        [selectLetter resignFirstResponder];
        selectLetter.delegate=self;
        
        selectLetter.font=[UIFont systemFontOfSize:width1/20];
        selectLetter.textAlignment=NSTextAlignmentCenter;
        selectLetter.textColor=[UIColor blackColor];
        [self.view addSubview:selectLetter];
        //choose rando letter
    }
    selectLetter.text=[NSString stringWithFormat:@"Identify slightly different cell"];
    [UIView animateWithDuration:3 animations:^{
        timeView1.frame=CGRectMake(60*width1/320, 70*height1/480, 200*width1/320, 10*height1/480);
        
    }];
    
    
}


-(void)waitTime{
    timeView=[[UIView alloc]initWithFrame:CGRectMake(60*width1/320, 70*height1/480, 200*width1/320, 10*height1/480)];
    timeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    timeView.layer.cornerRadius=7.0f;
    [self.view addSubview:timeView];
    
    timeView1=[[UIView alloc]initWithFrame:CGRectMake(60*width1/320, 70*height1/480, 20,10*height1/480)];
    timeView1.backgroundColor=[UIColor redColor];
    timeView1.layer.cornerRadius=7.0f;
    
    [self.view addSubview:timeView1];
}

#pragma mark-
#pragma mark- action after timeover
//come here after time over
-(void)timerOver
{
    if(timeOver==2)
    {
        
    }
    else{
        
    timeOver=2;
        if(alert4!=2)
        {
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


#pragma mark-
#pragma mark- collection and methode
-(void)createCollectionView{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 2;
   // if(_mainLevel==1){
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10*width1/320, 120*height1/480, 300*width1/320,300*width1/320) collectionViewLayout:layout];
    
   // }
    /* else if (_mainLevel==2){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(50, 170, 225, 215) collectionViewLayout:layout];
     }
     else if (_mainLevel==3){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(32.5, 170, 255, 215) collectionViewLayout:layout];
     }
     
     else if (_mainLevel==4){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(32.5, 170, 255,270) collectionViewLayout:layout];
     }
     
     else if (_mainLevel==5){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(25, 170, 270, 270) collectionViewLayout:layout];
     }*/
     
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
    /* if(_mainLevel==1){
     return 24;
     }
     else if (_mainLevel==2){
     return 40;
     }
     else if (_mainLevel==3){
     return 48;
     }
     else if (_mainLevel==4){
     return 56;
     }
     else if (_mainLevel==5){
     return 64;
     }*/
     return 64;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    
    //if(_mainLevel==1){
    //}
   /* else if (_mainLevel==2){
     lab =[[UILabel alloc]initWithFrame:CGRectMake(20,5, 30, 30)];    }
     else if (_mainLevel==3){
     lab =[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 30, 30)];
     }
     else if (_mainLevel==4){
     lab =[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 30, 30)];
     }
     else if (_mainLevel==5){
     lab =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 30, 30)];
     }*/
    
    
    cell.layer.borderColor=[UIColor whiteColor].CGColor;
    cell.layer.cornerRadius=5.0f;
    cell.layer.borderWidth=.5f;
    
    cell.backgroundColor=[colors objectAtIndex:colorNO];
    NSLog(@"color no=====%d",colorNO);
    NSLog(@"diffcellno=====%d",differentCellNo);
    
    if(indexPath.row==differentCellNo){
        cell1=cell;
        
        if([SingletonClass sharedSingleton].Score>180)
        {
            cell.alpha=0.7;
        }
        else if([SingletonClass sharedSingleton].Score>120){
            cell.alpha=0.65;
        }
        else if([SingletonClass sharedSingleton].Score>100){
            cell.alpha=0.6;
        }
        else if([SingletonClass sharedSingleton].Score>50){
            cell.alpha=0.5;
        }
        else{
            cell.alpha=0.5;
        }
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    timeOver=2;
    cell=[collectionView cellForItemAtIndexPath:indexPath];
    //---------------------------
    NSLog(@"index.......%ld",(long)indexPath.row);
   //NSIndexPath *ind=[[NSIndexPath alloc]initWithIndex:];
    
   // UICollectionViewCell  *cell1=[collectionView cellForItemAtIndexPath:ind];
    //------------------------------
    
    ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
    if(indexPath.row==differentCellNo){
        cell.backgroundColor=[UIColor greenColor];
        
        next.result=true;
    }
    else{
        cell.backgroundColor=[UIColor redColor];
        
        //---------------------------
        cell1.backgroundColor=[UIColor greenColor];
       // [self performSelector:nil withObject:nil afterDelay:2];
        //-------------------------
       next.result=false;

    }
    next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:next animated:YES completion:nil];
    
}






- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   // if(_level==1){
    return CGSizeMake(35*width1/320, 35*width1/320);
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
