//
//  Levels.m
//  BrainMemoryMaster1
//
//  Created by GBS-ios on 1/16/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "Levels.h"
#import <Parse/Parse.h>
@interface Levels (){
    CGRect screenRect;
    int height1;
    int width1;
}

@end

@implementation Levels

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
    
    if([SingletonClass sharedSingleton].networkStatus==true){
       if([SingletonClass sharedSingleton].fbStatus==1){
            PFInstallation *currentInstallation = [PFInstallation currentInstallation];
           [currentInstallation setObject:[SingletonClass sharedSingleton].fbID forKey:@"FBID"];
           [currentInstallation saveInBackground];
           
           
           if([SingletonClass sharedSingleton].firstDisplayFriend!=2){
           dispatch_async(dispatch_get_main_queue(),^{
           [self method2];
               [SingletonClass sharedSingleton].firstDisplayFriend=2;
           });
           }
           /*
           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
              @autoreleasepool {
                   
                [self method2];
               }});
           }
           */
           
           //[NSThread detachNewThreadSelector:@selector(method2) toTarget:self withObject:nil];
           
           
           
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"First"]!=2){
        
        
        PFQuery *query = [PFQuery queryWithClassName:@"BMMScore2"];
        [query whereKey:@"PlayerFBID" equalTo:[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if(objects.count==0){
               
                PFObject *testObject = [PFObject objectWithClassName:@"BMMScore2"];
                testObject[@"PlayerFBID"] = [SingletonClass sharedSingleton].fbID;
                testObject[@"userName"] = [SingletonClass sharedSingleton].name;
                for(int i=0;i<=9;i++){
                    NSString *st=[NSString stringWithFormat:@"levelScore%d",i];
                    testObject[st]=[NSNumber numberWithInteger:0];
                }
                [testObject saveInBackground];
                [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"First"];
            }
        }];
        
        }
    
    }
    }
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    noOfCell=0;
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
    
    
    
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame=CGRectMake(10*width1/320,30*height1/480,70*width1/320, 50*height1/480);
    back.backgroundColor=[UIColor clearColor];
    back.titleLabel.textAlignment=NSTextAlignmentLeft;
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back setBackgroundImage:[UIImage imageNamed:@"arr2.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
}


-(void)viewDidAppear:(BOOL)animated{
    

    CGFloat t1=.07;
    for(int i=0; i<9;i++){
        [self performSelector:@selector(creatCollView) withObject:nil afterDelay:t1];
        t1=t1+.07;
    }
    
}


-(void)backButAction{
    FirstViewController *gotoMain=[[FirstViewController alloc]init];
    [self presentViewController:gotoMain animated:YES completion:nil];
    
}


-(void)creatCollView{
    if(noOfCell!=0){
    for(UICollectionView *view in self.view.subviews){
        if ([view isKindOfClass:[UICollectionView class]]) {
            [view removeFromSuperview];
        }
    }
    }
    
    [self createCollectionView];
    
}





-(void)method2{
    [FBRequestConnection startForMyFriendsWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // result will contain an array with your user's friends in the "data" key
            NSArray *friendObjects = [result objectForKey:@"data"];
            friendIds = [NSMutableArray arrayWithCapacity:friendObjects.count];
            // Create a list of friends' Facebook IDs
            for (NSDictionary *friendObject in friendObjects) {
                NSLog(@"%@",[friendObject objectForKey:@"id"]);
                [friendIds addObject:[friendObject objectForKey:@"id"]];
            }
            
    
             PFQuery *friendQuery = [PFQuery queryWithClassName:@"BMMScore2"];
             [friendQuery whereKey:@"PlayerFBID" containedIn:friendIds];
             
            [SingletonClass sharedSingleton].friendUsers = (NSMutableArray*)[friendQuery findObjects];
            NSLog(@"%@",[SingletonClass sharedSingleton].friendUsers);
        }
    }];
}




#pragma mark-
#pragma mark- collection and methode



-(void)createCollectionView{
    noOfCell++;
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing =5;
   
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width1/16, height1/5, width1-width1/8,width1-width1/8) collectionViewLayout:layout];
       
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
    

    if(noOfCell>indexPath.row){
       
    
        
    UIImageView *rotateView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,width1*90/320,width1*90/320)];
   
           if(indexPath.row==0){
            rotateView.image=[UIImage imageNamed:@"missing_alphabet.png"];
        }
        else if (indexPath.row==1){
            rotateView.image=[UIImage imageNamed:@"color_identity.png"];
 
        }
        else if (indexPath.row==2){
            rotateView.image=[UIImage imageNamed:@"face_identity.png"];
  
        }
        else if (indexPath.row==3){
            rotateView.image=[UIImage imageNamed:@"slightly_different_cell.png"];
  
        }
        else if (indexPath.row==4){
            rotateView.image=[UIImage imageNamed:@"missing_alphabet.png"];
  
        }
        else if (indexPath.row==5){
            rotateView.image=[UIImage imageNamed:@"red_blue_cell.png.png"];
  
        }
        else if (indexPath.row==6){
            rotateView.image=[UIImage imageNamed:@"identity_sequence.png"];
  
        }
        else if (indexPath.row==7){
            rotateView.image=[UIImage imageNamed:@"diffrent_smily.png"];
  
        }
        else if (indexPath.row==8){
            rotateView.image=[UIImage imageNamed:@"color_pair.png"];
 
        }
    [cell.contentView addSubview:rotateView];
    cell.layer.cornerRadius=45.0f;
     cell.backgroundColor=[UIColor colorWithRed:(CGFloat)250/255 green:(CGFloat)250/255 blue:(CGFloat)250/255 alpha:.2];
    }
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     [SingletonClass sharedSingleton].level=(int)indexPath.row+1;
    [SingletonClass sharedSingleton].Score=0;
    [SingletonClass sharedSingleton].life=5;
    [SingletonClass sharedSingleton].levelScore=0;
    [SingletonClass sharedSingleton].correntAns=0;
    [SingletonClass sharedSingleton].mainLevel=1;
    mainLevel *levelPlay=[[mainLevel alloc]initWithNibName:@"mainLevel" bundle:nil];
       levelPlay.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
  [self presentViewController:levelPlay animated:YES completion:nil];
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(width1*90/320,width1*90/320);
}


//not used methode

- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
