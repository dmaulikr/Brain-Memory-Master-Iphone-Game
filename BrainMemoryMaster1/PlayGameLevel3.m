//
//  PlayGameLevel3.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/14/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "PlayGameLevel3.h"

@interface PlayGameLevel3 (){
    CGRect screenRect;
    int height1;
    int width1;
}

@end

@implementation PlayGameLevel3

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
    selectedArray=[[NSMutableArray alloc]init];
    _mainLevel=(int)[SingletonClass sharedSingleton].mainLevel;
    timeOver=1;
    tryChance=0;
    if((_mainLevel==1)||(_mainLevel==3)){
        time=4;
    }
    else if((_mainLevel==2)||(_mainLevel==4)){
        time=3;
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

   // backImg.backgroundColor=[UIColor grayColor];
    //backImg.layer.transform=CATransform3DMakeRotation(1.5,.5,0,-.1);
    [self.view addSubview:backImg];
   // self.view.backgroundColor=[UIColor blackColor];
    //-----------------------------------------------------
    imageArray=[NSArray arrayWithObjects:[UIImage imageNamed:@"smiley_1@2x.png"],[UIImage imageNamed:@"smiley_2@2x.png"],[UIImage imageNamed:@"smiley_3@2x.png"],[UIImage imageNamed:@"smiley_4@2x.png"],[UIImage imageNamed:@"smiley_7@2x.png"],[UIImage imageNamed:@"smiley_8@2x.png"],[UIImage imageNamed:@"smiley_9@2x.png"],[UIImage imageNamed:@"smiley_5@2x.png"],[UIImage imageNamed:@"smiley_6@2x.png"],nil];
    //bottom view
    UILabel *scoreLab=[[UILabel alloc]initWithFrame:CGRectMake(width1-width1/4,width1/15,width1/4,40)];
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

    
    //------------------------------------------------------
    //TOP VIEW
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    [self.view addSubview:header];
    
    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0,width1/15+45, width1, 1)];
    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
    [self.view addSubview:devider];
    
    [self createCollectionView];
    [self waitTime];
    
    
   

    
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

    
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width1==320){
        back.frame=CGRectMake(10*width1/320, (width1/15)+12,34*width1/320,20*height1/480);
    }
    else{
        back.frame=CGRectMake(10*width1/320, (width1/15),34*width1/320,20*height1/480);
    }
    back.backgroundColor=[UIColor clearColor];
     back.titleLabel.textAlignment=NSTextAlignmentLeft;
    //back.titleLabel.text=@"<<--";
    [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];

    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    back.titleLabel.font=[UIFont systemFontOfSize:width1/20];
    //[back addTarget:self action:@selector(backButAction2:) forControlEvents:UIControlEventTouchUpInside];
    [back addTarget:self action:@selector(backButAction2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    
    
}


-(IBAction)backButAction2:(id)sender{
    
    Levels *go=[[Levels alloc]initWithNibName:@"Levels" bundle:nil];
    go.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:go animated:YES completion:nil];
    

    
}

#pragma mark-
#pragma mark- waitTime
//time to memorise letters.





-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:time animations:^{
        timeView1.frame=CGRectMake(width1*60/320,height1*80/480,width1*200/320, 10*width1/320);
        
    }];
    
    
}


-(void)waitTime{
    timeView=[[UIView alloc]initWithFrame:CGRectMake(width1*60/320,height1*80/480,width1*200/320, 10*width1/320)];
    timeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    timeView.layer.cornerRadius=7.0*width1/320;
    [self.view addSubview:timeView];
    
    timeView1=[[UIView alloc]initWithFrame:CGRectMake(width1*60/320,height1*80/480, 20,10*width1/320)];
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
    [self createCollectionView];
    
    //===================================
    UITextField *selectLetter=[[UITextField alloc]initWithFrame:CGRectMake(width1*160/320,height1*70/480,width1*220/320,50)];
    
    selectLetter.font=[UIFont systemFontOfSize:width1/18];
    selectLetter.textAlignment=NSTextAlignmentLeft;
    selectLetter.textColor=[UIColor blackColor];
    [self.view addSubview:selectLetter];
    selectLetter.backgroundColor=[UIColor clearColor];
    //choose rando letter
    [selectLetter resignFirstResponder];
    selectLetter.delegate=self;
    int imgNo = arc4random_uniform(9);
    selectImage=[selectedArray objectAtIndex:imgNo];
    
    UIImageView *findImage=[[UIImageView alloc]initWithImage:selectImage];
    findImage.frame=CGRectMake(width1*110/320,height1*70/480,40*width1/320, 40*width1/320);
    [self.view addSubview:findImage];
    selectLetter.text=[NSString stringWithFormat:@"Find Me"];
    
    
}


#pragma mark-
#pragma mark- collection and methode
-(void)createCollectionView{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 5;
    if((_mainLevel==1)||(_mainLevel==2)){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*50/320,height1*130/480,width1*225/320,height1*245/480) collectionViewLayout:layout];
    }
   
    else if ((_mainLevel==3)||(_mainLevel==4)){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1*32.5/320,height1*130/480,width1*255/320,height1*255/480) collectionViewLayout:layout];
    }
    
    
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
     _collectionView.layer.transform=CATransform3DMakeRotation(.05,0, 0, 0.0);
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    // _collectionView.layer.transform=CATransform3DMakeRotation(-.9,2, 0, 0);
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
        return 9;
    }
    else if (_mainLevel==3){
        return 12;
    }
    else{
        return 12;
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
    
    
    if((_mainLevel==1)||(_mainLevel==2)){
        img =[[UIImageView alloc]initWithFrame:CGRectMake(15*width1/320, 15*width1/320, 40*width1/320, 40*width1/320)];    }
    
    else if ((_mainLevel==3)||(_mainLevel==4)){
        img =[[UIImageView alloc]initWithFrame:CGRectMake(15*width1/320, 10*height1/320, 30*width1/320, 30*width1/320)];
    }
    
    
    if(timeOver==1){
        
        
        //NSString *char=[chars objectAtIndex:lettorNo];
        // lab.text=[chars objectAtIndex:lettorNo];
        //lab.font=[UIFont boldSystemFontOfSize:20.0f];
        // [letters insertObject:[chars objectAtIndex:lettorNo] atIndex:indexPath.row];
        int imgNo = arc4random_uniform(8);
        
        img.image=(UIImage*)[imageArray objectAtIndex:imgNo];
        [selectedArray insertObject:[imageArray objectAtIndex:imgNo] atIndex:indexPath.row];
    }
    else{
    }
    //img.image=[UIImage imageNamed:@"heart-icon.png"];
    if(timeOver==2){
        for(UIImageView *view in cell.contentView.subviews){
            if ([view isKindOfClass:[UIImageView class]]) {
                [view removeFromSuperview];
            }
        }
        
    }
    cell.layer.borderWidth=.2f;
    cell.layer.borderColor=[UIColor blueColor].CGColor;
    cell.layer.cornerRadius=6.0f;
    cell.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    [cell.contentView addSubview:img];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(timeOver==2){
        
        ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
        if([selectImage isEqual:[selectedArray objectAtIndex:indexPath.row]]){
            next.result=true;
        }
        else{
            next.result=false;
        }
        //next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
        //[curlableMapViewController presentModalViewController:next animated:YES];
        [self presentViewController:next animated:YES completion:nil];
        
    }
    tryChance++;
    
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if((_mainLevel==1)||(_mainLevel==2)){
        return CGSizeMake(width1*70/320,width1*70/320);
    }
    
    else if ((_mainLevel==3)||(_mainLevel==4)){
        return CGSizeMake(width1*60/320,height1*60/480);
    }
    else{
    return CGSizeMake(70, 50);
    }
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
