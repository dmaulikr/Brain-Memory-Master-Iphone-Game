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
    //tryChance=0;
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
   
    
    UILabel *scoreLab=[[UILabel alloc]initWithFrame:CGRectMake(width1-width1/4,width1/15,width1/4,40)];
    scoreLab.textColor=[UIColor blueColor];
    scoreLab.textAlignment=NSTextAlignmentCenter;
      scoreLab.layer.shadowColor=[UIColor whiteColor].CGColor;
    NSString *score=[NSString stringWithFormat:@"Score: %d",[SingletonClass sharedSingleton].Score];
    scoreLab.font=[UIFont systemFontOfSize:width1/20];
    scoreLab.text=score;
    [self.view addSubview:scoreLab];
    
    
    
    UILabel *levelLabel=[[UILabel alloc]initWithFrame:CGRectMake(width1/2-width1/8-5,width1/15,width1/4+10,40)];
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
    
    [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];

     back.titleLabel.textAlignment=NSTextAlignmentLeft;
    back.titleLabel.font=[UIFont systemFontOfSize:width1/22];
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    //------------------------------------------------------
    //TOP VIEW
   
    
    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0, width1/15+45, width1, 1)];
    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
    [self.view addSubview:devider];
    
    [self createCollectionView];
    [self waitTime];
    chars=[NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    
    //call methode afetr time over
    [self performSelector:@selector(timerOver) withObject:nil afterDelay:(time+.2)];
    
    
    
    
}



-(void)viewWillAppear:(BOOL)animated{
    UIView *lifeView=[[UIView alloc]initWithFrame:CGRectMake(0, height1-height1/15, width1, height1/15)];
    lifeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    [self.view addSubview:lifeView];
    
    
    UILabel *highScore=[[UILabel alloc]initWithFrame:CGRectMake(width1/2+20,0,width1/2-30,height1/17)];
    highScore.textAlignment=NSTextAlignmentRight;
    highScore.layer.shadowColor=[UIColor whiteColor].CGColor;
   
    highScore.textColor=[UIColor whiteColor];
    highScore.font=[UIFont systemFontOfSize:width1/22];
     NSString *levelScore=[NSString stringWithFormat:@"levelScore%d",[SingletonClass sharedSingleton].level];
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

-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:time animations:^{
        timeView1.frame=CGRectMake(width1/6, height1/6, width1-width1/3, 10*width1/320);
        
    }];
    
    
}


-(void)waitTime{
    timeView=[[UIView alloc]initWithFrame:CGRectMake(width1/6,height1/6, width1-width1/3, 10*width1/320)];
    timeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    timeView.layer.cornerRadius=7.0*width1/320;
    [self.view addSubview:timeView];
    
    timeView1=[[UIView alloc]initWithFrame:CGRectMake(width1/6, height1/6, 20,10*width1/320)];
    timeView1.backgroundColor=[UIColor redColor];
    timeView1.layer.cornerRadius=7.0*width1/320;
    
    [self.view addSubview:timeView1];
}

#pragma mark-
#pragma mark- action after timeover
//come here after time over
-(void)timerOver{
    
    timeOver=2;
    timeView.hidden=YES;
    timeView1.hidden=YES;
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
    letter=[letters objectAtIndex:lettorNo];
    selectLetter.text=[NSString stringWithFormat:@"Identify cell containing '%@'",letter];
    
    
}


#pragma mark-
#pragma mark- collection and methode
-(void)createCollectionView{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 5;
    if(_mainLevel==1){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.147, height1/5+20, width1*.72, width1*.7) collectionViewLayout:layout];
    }
    else if (_mainLevel==2){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.135, height1/5+20, width1*.74, width1*.7) collectionViewLayout:layout];
    }
    else if (_mainLevel==3){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*.1, height1/5+20, width1*.8, width1*.7) collectionViewLayout:layout];
    }
    
    else if (_mainLevel==4){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1/10, height1/5+20, width1*.8,.85*width1) collectionViewLayout:layout];
    }
    
    else if (_mainLevel==5){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(25, 170, 270, 270) collectionViewLayout:layout];
    }
    
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
    if(_mainLevel==1){
        return 9;
    }
    else if (_mainLevel==2){
        return 12;
    }
    else if (_mainLevel==3){
        return 16;
    }
    else if (_mainLevel==4){
        return 20;
    }
    else if (_mainLevel==5){
        return 25;
    }
    return 9;
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
        
        lab.textColor=[UIColor whiteColor];
        
        int lettorNo = arc4random_uniform(25);
        NSLog(@"%d",lettorNo);
        //NSString *char=[chars objectAtIndex:lettorNo];
        lab.text=[chars objectAtIndex:lettorNo];
        //lab.font=[UIFont boldSystemFontOfSize:20.0f];
        [letters insertObject:[chars objectAtIndex:lettorNo] atIndex:indexPath.row];
        
    }
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
        else{
            next.result=false;
        }
        //next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
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
