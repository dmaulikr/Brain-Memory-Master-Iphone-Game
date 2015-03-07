//
//  PlayGameLevel7.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/15/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "PlayGameLevel7.h"

@interface PlayGameLevel7 (){
    CGRect screenRect;
    int height1;
    int width1;
}

@end

@implementation PlayGameLevel7

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

    isalph=1;
    noOfClick=1;
    blinkNo=0;
       // Do any additional setup after loading the view from its nib.
    timeOver=1;
    sequenceNo=0;
    noOfBlink=1;

    _mainLevel=[SingletonClass sharedSingleton].mainLevel;
    self.view.backgroundColor=[UIColor blackColor];
    //-----------------------------------------------------
    //bottom view
    UILabel *scoreLab=[[UILabel alloc]initWithFrame:CGRectMake(width1-width1/4-10,width1/15,width1/4,40)];
    scoreLab.textColor=[UIColor blueColor];
    scoreLab.textAlignment=NSTextAlignmentCenter;
    scoreLab.font=[UIFont systemFontOfSize:width1/20];
    scoreLab.layer.shadowColor=[UIColor whiteColor].CGColor;
    //title.font=[UIFont boldsystemFontOfSize:20.0f];
    NSString *score=[NSString stringWithFormat:@"Score: %d",[SingletonClass sharedSingleton].Score];
    scoreLab.text=score;
    [self.view addSubview:scoreLab];
    
    
    
    UILabel *levelLabel=[[UILabel alloc]initWithFrame:CGRectMake(width1/2-width1/8-5,width1/15,width1/4+10,40)];
    //levelLabel.backgroundColor=[UIColor ];
    levelLabel.textColor=[UIColor blueColor];
    levelLabel.textAlignment=NSTextAlignmentCenter;
    levelLabel.layer.shadowColor=[UIColor whiteColor].CGColor;
    levelLabel.font=[UIFont systemFontOfSize:width1/20];
    NSString *levelStr=[NSString stringWithFormat:@"level: %d",(int)[SingletonClass sharedSingleton].level];
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
     back.titleLabel.textAlignment=NSTextAlignmentLeft;
    [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];

    back.titleLabel.font=[UIFont systemFontOfSize:width1/20];
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    //------------------------------------------------------
    //TOP VIEW
    
    
    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0,width1/15+45, width1, 1)];
    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
    [self.view addSubview:devider];
    
    
    [self waitTime];
    colors=[NSMutableArray arrayWithObjects:[UIColor blueColor],[UIColor whiteColor],[UIColor redColor],[UIColor yellowColor],[UIColor brownColor],[UIColor greenColor],[UIColor grayColor],[UIColor orangeColor],[UIColor purpleColor], nil];
    //call methode afetr time over
    
    
    
    [self createCollectionView];
    
    
    
    
}







-(void)viewWillAppear:(BOOL)animated{
    
    //display no of life remain
    UIView *lifeView=[[UIView alloc]initWithFrame:CGRectMake(0, height1-height1/15, width1, height1/15)];
    lifeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    [self.view addSubview:lifeView];
    
    
    UILabel *highScore=[[UILabel alloc]initWithFrame:CGRectMake(width1/2+20,0,width1/2-30,height1/17)];
    highScore.textAlignment=NSTextAlignmentRight;
    highScore.layer.shadowColor=[UIColor whiteColor].CGColor;
    NSString *levelScore=[NSString stringWithFormat:@"levelScore%d",[SingletonClass sharedSingleton].level];
    highScore.textColor=[UIColor whiteColor];
    highScore.font=[UIFont systemFontOfSize:width1/22];
    NSInteger storedScore = [[NSUserDefaults standardUserDefaults] integerForKey:levelScore];
    
    highScore.text=[NSString stringWithFormat:@"Highscore:%d",(int)storedScore];
    
    //[lifeView addSubview:highScore];
    
    
    int x=5;
    for(int i=0;i<5;i++){
        UIImageView *life=[[UIImageView alloc]init];
        if(i<[SingletonClass sharedSingleton].life){
            life.image=[UIImage imageNamed:@"life.png"];
        }
        else{
            life.image=[UIImage imageNamed:@"no_life.png"];
        }
        // UIImageView *life=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"life.png"]];
        life.frame=CGRectMake(x,0, width1/12,width1/12);
        x=x+width1/10+3;
        [lifeView addSubview:life];
    }
    
    
    
    
    
    
}


-(void)backButAction{
    
    Levels *go=[[Levels alloc]initWithNibName:@"Levels" bundle:nil];
    go.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:go animated:YES completion:nil];
    
    
}


#pragma mark-
#pragma mark- waitTime
//time to memorise letters.




-(void)blinkCell{
    BOOL animationsEnabled = [UIView areAnimationsEnabled];
    [UIView setAnimationsEnabled:NO];
    [_collectionView reloadData];
    differentCellNo=arc4random_uniform(35);
    [UIView setAnimationsEnabled:animationsEnabled];
}



-(void)viewDidAppear:(BOOL)animated{
    int noOfrepeat=4+(_mainLevel*2);
    
    
   
    
    CGFloat t1=.5;
    for(int i=0; i<noOfrepeat;i++){
    [self performSelector:@selector(blinkCell) withObject:nil afterDelay:t1];
        t1=t1+.5;
    }
    [self performSelector:@selector(demoOver) withObject:nil afterDelay:(noOfrepeat/2)];

      if(!selectLetter){
        selectLetter=[[UITextField alloc]initWithFrame:CGRectMake(50*width1/320, 60*height1/480, 220*width1/320, 40)];
          [selectLetter resignFirstResponder];
          selectLetter.delegate=self;
        selectLetter.font=[UIFont systemFontOfSize:width1/20];
        selectLetter.textAlignment=NSTextAlignmentCenter;
        selectLetter.textColor=[UIColor blackColor];
        [self.view addSubview:selectLetter];
        //choose rando letter
    }
    selectLetter.text=[NSString stringWithFormat:@"Identify sequence"];
    
    [UIView animateWithDuration: 5
                          delay:(_mainLevel+3)
                        options: UIViewAnimationOptionCurveEaseOut
                     animations: ^{
                         
                        timeView1.frame=CGRectMake(60*width1/320, 95*height1/480, 200*width1/320, 10*height1/480);
                      
                     } completion: ^(BOOL finished) {
                         [self timerOver];
                        
                     }
     ];
    
    
    
}

-(void)demoOver{
    timeOver=2;
}



-(void)waitTime{
    timeView=[[UIView alloc]initWithFrame:CGRectMake(60*width1/320, 95*height1/480, 200*width1/320, 10*height1/480)];
    timeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    timeView.layer.cornerRadius=7.0*width1/320;
    [self.view addSubview:timeView];
    
    timeView1=[[UIView alloc]initWithFrame:CGRectMake(60*width1/320, 95*height1/480, 20, 10*height1/480)];
     timeView1.backgroundColor=[UIColor redColor];
    timeView1.layer.cornerRadius=7.0*width1/320;
    
    [self.view addSubview:timeView1];
}

#pragma mark-
#pragma mark- action after timeover
//come here after time over
-(void)timerOver{
    
   
    ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
    next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    next.timeOver=true;
    [self presentViewController:next animated:YES completion:nil];
    
    
}


#pragma mark-
#pragma mark- collection and methode
-(void)createCollectionView{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 2;
   
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10*width1/320, 125*height1/480, 300*width1/320,300*width1/320) collectionViewLayout:layout];
       [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:_collectionView];
    
    
}
#pragma mark-
#pragma mark- collection methode

//globussoft
- (void)reloadItemsAtIndexPaths:(NSInteger)indexPaths

{
    cell.alpha=0;
}





- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return 36;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    
    cell.layer.borderColor=[UIColor blueColor].CGColor;
    cell.layer.cornerRadius=22.0*width1/320;
    cell.layer.borderWidth=.1f;
    cell.backgroundColor=[UIColor blueColor];
    //colorWithRed:(CGFloat)57/255 green:(CGFloat)179/255  blue:(CGFloat)252/255  alpha:1
    cell.alpha=1;
    if(indexPath.row==differentCellNo){
        if(isalph==2){
            cell.backgroundColor=[UIColor blackColor];
            isalph=1;
            sequence[blinkNo]=differentCellNo;
            blinkNo++;
        }
        else{
            cell.backgroundColor=[UIColor blueColor];
            isalph=2;
        }
        
    }
    cell.highlighted=NO;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(timeOver==2){
    int number=3+_mainLevel;
    if(indexPath.row==sequence[sequenceNo]&&(noOfClick==noOfBlink)){
        answer=true;
        noOfClick++;
        noOfBlink++;
        sequenceNo++;
    }
    else{
        answer=false;
    }
    if((answer==false)||(noOfClick==number)){
        ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
        next.result=answer;
        //next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:next animated:YES completion:nil];
    }
    }
}






- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    return CGSizeMake(45*width1/320,45*width1/320);
    
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
