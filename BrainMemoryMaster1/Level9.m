//
//  Level9.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/16/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "Level9.h"

@interface Level9 (){
    CGRect screenRect;
    int height1;
    int width1;
}

@end

@implementation Level9

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
    // Do any additional setup after loading the view from its nib.
    clickNo=1;
    timeOver=1;
    _mainLevel=[SingletonClass sharedSingleton].mainLevel;
    
    if((_mainLevel==1)||(_mainLevel==3)){
        time=5;
    }
   else if((_mainLevel==2)||(_mainLevel==4)){
        time=4;
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

    //-----------------------------------------------------
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
    
    
    UIView *devider=[[UIView alloc]initWithFrame:CGRectMake(0,width1/15+45, width1, 1)];
    devider.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:1];
    [self.view addSubview:devider];
    
    
    [self waitTime];
    if((_mainLevel==1)||(_mainLevel==2)){
        
        colors=[NSArray arrayWithObjects:[UIColor blueColor],[UIColor whiteColor],[UIColor redColor],[UIColor yellowColor],[UIColor blueColor],[UIColor whiteColor],[UIColor redColor],[UIColor yellowColor], nil];
        colorsName=[NSArray arrayWithObjects:@"blue",@"white",@"red",@"yellow",@"blue",@"white",@"red",@"yellow",nil];
    }
    else if((_mainLevel==3)||(_mainLevel==4)){
    colors=[NSArray arrayWithObjects:[UIColor blueColor],[UIColor whiteColor],[UIColor redColor],[UIColor yellowColor],[UIColor brownColor],[UIColor greenColor],[UIColor blueColor],[UIColor whiteColor],[UIColor redColor],[UIColor yellowColor],[UIColor brownColor],[UIColor greenColor], nil];
    colorsName=[NSArray arrayWithObjects:@"blue",@"white",@"red",@"yellow",@"brown",@"green",@"blue",@"white",@"red",@"yellow",@"brown",@"green",nil];
    }
   
    //call methode afetr time over
    if((_mainLevel==1)||(_mainLevel==2)){
    for(int i=0;i<8;i++){
    int k=0;
        int no3=0;
        while(k<1){
        no3=arc4random_uniform(8);
        for(int j=0;j<i;j++){
            if(sequence[j]==no3){
                k=0;
                break;
                
            }
            
            else{
               k=2;
            }
       
        }
            if(i==0){
                k=2;
            }
        }
            sequence[i]=no3;
        k=2;
        NSLog(@"%d",no3);
        
    }
    }
    
    
    
    if((_mainLevel==3)||(_mainLevel==4)){
        for(int i=0;i<12;i++){
            int k=0;
            int no3=0;
            while(k<1){
                no3=arc4random_uniform(12);
                for(int j=0;j<i;j++){
                    if(sequence[j]==no3){
                        k=0;
                        break;
                        
                    }
                    
                    else{
                        k=2;
                    }
                    
                }
                if(i==0){
                    k=2;
                }
            }
            sequence[i]=no3;
            k=2;
            NSLog(@"%d",no3);
            
        }
        
        
    }

    
    
    [self createCollectionView];
    
    [self performSelector:@selector(timerOver) withObject:nil afterDelay:(time+.3)];
    //int tempSequence[8];
    
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

-(void)viewDidAppear:(BOOL)animated{
    
    [UIView animateWithDuration:time animations:^{
        timeView1.frame=CGRectMake(60*width1/320, 120*height1/480, 200*width1/320, 10*height1/480);
        
    }];
    
    
}


-(void)waitTime{
    timeView=[[UIView alloc]initWithFrame:CGRectMake(60*width1/320, 120*height1/480, 200*width1/320, 10*height1/480)];
    timeView.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    timeView.layer.cornerRadius=7.0*width1/320;
    [self.view addSubview:timeView];
    
    timeView1=[[UIView alloc]initWithFrame:CGRectMake(60*width1/320, 120*height1/480, 20, 10*height1/480)];
    timeView1.backgroundColor=[UIColor redColor];
    timeView1.layer.cornerRadius=7.0*width1/320;
    
    [self.view addSubview:timeView1];
}

#pragma mark-
#pragma mark- action after timeover
//come here after time over
-(void)timerOver{
    
    timeOver=2;
    [self createCollectionView];
    timeView.hidden=YES;
    timeView1.hidden=YES;
    if(!selectLetter){
        selectLetter=[[UITextField alloc]initWithFrame:CGRectMake(0, 100*height1/480, width1, 50)];
        [selectLetter resignFirstResponder];
        selectLetter.delegate=self;
        selectLetter.font=[UIFont systemFontOfSize:width1/20];
        selectLetter.textAlignment=NSTextAlignmentCenter;
        selectLetter.textColor=[UIColor blackColor];
        [self.view addSubview:selectLetter];
        //choose rando letter
    }
    int sum;
    
    if((_mainLevel==1)||(_mainLevel==2)){
        int number=arc4random_uniform(8);
        NSLog(@"%d",number);
        firstColor=sequence[number];
        

        for(int i=0;i<8;i++){
            sum=sequence[i];
            if(firstColor<4){
                if(sum>3){
                    sum=sum-4;
                    if(firstColor==sum)
                        secondColor=sequence[i];
                }
            }
            else if(firstColor>3){
                if(sum<4){
                    sum=sum+4;
                    if(sum==firstColor)
                        secondColor=sequence[i];
                    
                }
                
                
            }
            

        }
    }
    else if ((_mainLevel==3)||(_mainLevel==4)){
        int number=arc4random_uniform(12);
        NSLog(@"%d",number);
        firstColor=sequence[number];
        

        
        for(int i=0;i<12;i++){
            sum=sequence[i];
            if(firstColor<6){
                if(sum>5){
                    sum=sum-6;
                    if(firstColor==sum)
                        secondColor=sequence[i];
                }
            }
            else if(firstColor>5){
                if(sum<6){
                    sum=sum+6;
                    if(sum==firstColor)
                        secondColor=sequence[i];
                    
                }
                
                
            }
            
            
        }

        
    }
        
        
        
        
    
    NSLog(@"%d",firstColor);
    
    NSLog(@"%d",secondColor);
    
    
    selectLetter.text=[NSString stringWithFormat:@"Identify pair of cells with '%@' color",[colorsName objectAtIndex:firstColor]];
    
    //NSLog(@"----======-%@",[colors objectAtIndex:sequence[1]]);
    NSLog(@"%@",[colorsName objectAtIndex:firstColor]);
    NSLog(@"--------==%d",firstColor);
    
}


#pragma mark-
#pragma mark- collection and methode

-(void)createCollectionView{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 5;
    if((_mainLevel==1)||(_mainLevel==2)){
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(55*width1/320, 170*height1/480, 215*width1/320,150*height1/320) collectionViewLayout:layout];
    }
    
     else if ((_mainLevel==3)||(_mainLevel==4)){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(50*width1/320, 170*height1/480, 225*width1/320, 215*height1/480) collectionViewLayout:layout];
     }
    /*
     else if (_mainLevel==3){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(32.5, 170, 255, 215) collectionViewLayout:layout];
     }
     
     else if (_mainLevel==4){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(32.5, 170, 255,270) collectionViewLayout:layout];
     }
     
     else if (_mainLevel==5){
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(25, 170, 270, 270) collectionViewLayout:layout];
     }
     */
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
    if((_mainLevel==1)||(_mainLevel==2)){
     return 8;
     }
     else if ((_mainLevel==3)||(_mainLevel==4)){
     return 12;
     }
     else{
         return 0;
     }
    /*
     else if (_mainLevel==3){
     return 16;
     }
     else if (_mainLevel==4){
     return 20;
     }
     else if (_mainLevel==5){
     return 25;
     }*/
   
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    
    //if(_mainLevel==1){
    //}
    /*else if (_mainLevel==2){
     lab =[[UILabel alloc]initWithFrame:CGRectMake(20,5, 30, 30)];    }
     else if (_mainLevel==3){
     lab =[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 30, 30)];
     }
     else if (_mainLevel==4){
     lab =[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 30, 30)];
     }
     else if (_mainLevel==5){
     lab =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 30, 30)];
     }
     */
    //cell.layer.borderColor=[UIColor redColor].CGColor;
    //cell.layer.cornerRadius=5.0f;
    cell.layer.borderWidth=.5f;
    NSLog(@"%d",sequence[indexPath.row]);
    if(timeOver==1){
        cell.backgroundColor=[colors objectAtIndex:sequence[indexPath.row]];
    }
    else{
        cell.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(timeOver==2){
    
    ContineuorTryViewController *next=[[ContineuorTryViewController alloc]initWithNibName:@"ContineuorTryViewController" bundle:nil];
    if(clickNo==1){
        if((sequence[indexPath.row]==firstColor)||(sequence[indexPath.row]==secondColor)){
            next.result=true;
            clickNo++;
            
        }
        else {
            next.result=false;
        }
    }
    else if (clickNo==2){
        NSLog(@"%d",sequence[indexPath.row]);
        if((sequence[indexPath.row]==firstColor)||(sequence[indexPath.row]==secondColor)){
            
            next.result=true;
            clickNo++;
        }
        else{
            next.result=false;
        }
    }
    
    if((next.result ==false)||(clickNo==3)){
        //next.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:next animated:YES completion:nil];
    }
    }
}






- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //if(_level==1){
    return CGSizeMake(50*width1/320, 50*width1/320);
    
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
