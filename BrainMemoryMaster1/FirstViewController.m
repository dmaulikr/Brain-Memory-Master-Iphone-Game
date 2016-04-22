//
//  FirstViewController.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController (){
    UIView *header1;
    CGRect screenRect;
    int height1;
    int width1;
}
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
<<<<<<< HEAD

    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    
}

-(void)createUI{
    
    
    /*Task of the Day
     ===================
     [8 hrs]Project-Brain Memory Master.
     Work on implementing next levels with increasing difficulty level.
     Work on storing score levelwise.
     */
    /*
     1.in this level we need to memorise alphabets in given time, after that we need to identify the position of specific alphabet.
     2.in this level we need to identify text with given color within given time.
     3.same as first level but instead of alphabets smileys are used.
     4.in this level we need to identify cell with slightly different color compare to other cells within given time.
     5.in this level we need to identify whether any letter is missing in given alphabets.
     6.in this level there will be cells with blue and red color we need to identify whether blue cell are greater than red cells in given time.
     7.in this level some cells will blink in demo after that we need to identify sequence.
     8.in this level there will be some smileys we need to identify slightly different smiley in given time.
     9.same as first level but need to identify cell pair with 
       given color.
     
     
     
     
     */
    
   
    
   
     screenRect = [[UIScreen mainScreen] bounds];
=======
   [SingletonClass sharedSingleton].networkStatus=[self connectedToInternet];
    if([SingletonClass sharedSingleton].networkStatus==true){
        [self facebookLogin];
    }
}




#pragma mark-
#pragma facebook
-(void)facebookLogin{
    
    FBLoginView *loginView =
    [[FBLoginView alloc] initWithReadPermissions:
     @[@"public_profile", @"email", @"user_friends"]];
    loginView.frame=CGRectMake(60*width1/320, 350*height1/480,200*width1/320,40*height1/480);
    //CGRectMake(70*width1/320, 288*height1/480,180*width1/320, 45*height1/480);    loginView.layer.cornerRadius=10.0f;
    loginView.layer.shadowColor=[UIColor blackColor].CGColor;
    loginView.layer.shadowOffset=CGSizeMake(5, 10);
    loginView.layer.shadowOpacity=.8f;
    loginView.delegate=self;
    [self.view addSubview:loginView];
    
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"First"]==0){
        [[NSUserDefaults standardUserDefaults]setObject:user.objectID forKey:@"mainfbID"];
        [[NSUserDefaults standardUserDefaults]setObject:user.name forKey:@"mainUser"];
        [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"onceLoggedin"];
    }
    
    [SingletonClass sharedSingleton].fbStatus=1;
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"]);
     NSLog(@"%@",user.objectID);
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"]!=(id)user.objectID){
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"First"];
    }
    NSString *fbStr=[NSString stringWithString:user.objectID];
    [[NSUserDefaults standardUserDefaults]setObject:fbStr forKey:@"fbID"];
    [SingletonClass sharedSingleton].fbID=user.objectID;
    [SingletonClass sharedSingleton].name=user.name;

    [SingletonClass sharedSingleton].fbStatus=1;
    [self loadmainUserScore];
    NSLog(@"%@",user);
     NSLog(@"%@",user.name);
    
}

// Handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user performs an action outside of you app to recover,
    // the SDK provides a message, you just need to surface it.
    // This handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures that happen outside of the app
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}


#pragma mark-
#pragma LoadScore
-(void)viewDidAppear:(BOOL)animated{
    }

-(void)loadmainUserScore{
    if([SingletonClass sharedSingleton].networkStatus==true){
        if([SingletonClass sharedSingleton].fbStatus==1){
            PFQuery *query = [PFQuery queryWithClassName:@"BMMScore2"];
            [query whereKey:@"PlayerFBID" equalTo:[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"]];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                
                PFObject *object = [objects objectAtIndex:0];
                [SingletonClass sharedSingleton].Player=object;
                NSLog(@"%@",object);
                
            }];
        }
    }
    
}

#pragma mark-
#pragma UI

-(void)createUI{
    
    //http://developer.xamarin.com/guides/ios/
    
   
    screenRect = [[UIScreen mainScreen] bounds];
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,width1 ,height1)];
        backImg.alpha=1;
<<<<<<< HEAD
    //backImg.image=[self captureBlur:backImg];
    [self.view addSubview:backImg];

    
    //UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(width1/2-50, 100, 120, 140)];
    //[self.view addSubview:logo];
    
    header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width1, 60)];
    //[self.view addSubview:header];
    
    self.view.backgroundColor=[UIColor blackColor];
    //self.view.alpha=.2;
    
    
   
    
    
    
    
    UIButton *play=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    play.frame=CGRectMake(width1/4-20, height1/2+height1/10,width1/2+40, height1/10);
    play.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    play.layer.cornerRadius=7.0f;
    //[play setTitle:@"PLAY" forState:UIControlStateNormal];
   // play.titleLabel.text=@"PLAY";
   //[play setBackgroundImage:[UIImage imageNamed:@"play5_btn.png"] forState:UIControlStateNormal];
=======
    [self.view addSubview:backImg];


    
    UIButton *play=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    play.frame=CGRectMake(60*width1/320, 288*height1/480,200*width1/320, 40*height1/480);
    play.backgroundColor=[UIColor clearColor];
    play.layer.cornerRadius=7.0f;
    [play setBackgroundImage:[UIImage imageNamed:@"play_btn.png"] forState:UIControlStateNormal];
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    [play setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
      play.layer.shadowOffset=CGSizeMake(5, 3);
    play.titleLabel.font=[UIFont boldSystemFontOfSize:22.0];
    play.titleLabel.shadowOffset=CGSizeMake(2, 1);
    play.titleLabel.textColor=[UIColor whiteColor];
    play.layer.shadowOpacity=2.0;
<<<<<<< HEAD
   play.alpha=0;
=======
    play.alpha=0;
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    [play addTarget:self action:@selector(PlayAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:play];
    
    
<<<<<<< HEAD
    UIButton *help=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    help.frame=CGRectMake(width1/4-20, height1/2+20+height1/10+height1/10,width1/2+40,height1/10);
    help.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    help.layer.cornerRadius=7.0f;
    
    [help setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    [help setBackgroundImage:[UIImage imageNamed:@"help5_btn.png"] forState:UIControlStateNormal];
    //[help setBackgroundImage:[UIImage imageNamed:@"login_button2.png"] forState:UIControlStateNormal];
    help.titleLabel.textColor=[UIColor whiteColor];
    help.titleLabel.shadowOffset=CGSizeMake(2, 1);
    help.layer.shadowColor=[UIColor blackColor].CGColor;
    help.layer.shadowOffset=CGSizeMake(5, 3);
    [[help titleLabel] setFont:[UIFont boldSystemFontOfSize:22.0]];
    help.layer.shadowOpacity=2.0;

    [help addTarget:self action:@selector(helpAction) forControlEvents:UIControlEventTouchUpInside];
    help.enabled=NO;
    [self.view addSubview:help];
=======
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    
    
    if((width1==320)&&(height1==480)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1==320)&&(height1>480)){
        backImg.image=[UIImage imageNamed:@"Login1_bg.png"];
    }
    else if((width1>320)&&(height1<1000)){
        backImg.image=[UIImage imageNamed:@"Login2_bg.png"];
    }
    else if((width1>400)&&(height1<1150)){
        backImg.image=[UIImage imageNamed:@"Login3_bg.png"];
    }
    else if((width1>600)&&(height1>1150)){
        backImg.image=[UIImage imageNamed:@"Login4_bg.png"];
    }
    else if((width1>800)&&(height1>1700)){
<<<<<<< HEAD
        backImg.image=[UIImage imageNamed:@"Login3_bg.png"];
    }

    
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(0, 220,width1,30)];
    title.backgroundColor=[UIColor clearColor];
    title.textColor=[UIColor whiteColor];
    title.textAlignment=NSTextAlignmentCenter;
    //title.font=[UIFont fontWithName:@"Knewave" size:28.0f];
    title.layer.shadowColor=[UIColor blackColor].CGColor;
    title.layer.shadowOpacity=2.0f;
    //title.layer.borderWidth=1.0f;
    //title.layer.borderColor=[UIColor redColor].CGColor;
    
    title.layer.shadowOffset=CGSizeMake(8.0, 5.0);
    title.font=[UIFont boldSystemFontOfSize:25.0f];
    
    title.alpha=0;
    title.text=@"Brain Memory Master";
    [self.view addSubview:title];
    //[self runSpinAnimationOnView:(UIView*)title];
    
    //title.layer.transform = CATransform3DMakeRotation(.6, .50, 0.0, 0.0);
    
    
    
  [UIView animateWithDuration:.5 animations:^{
        
        title.alpha=1;
         play.alpha=1;
        //title.layer.transform = CATransform3DMakeRotation(.6, -0.5, 0.0, 0.0);
    }];
    
}


-(void)helpAction{
    
    cancel=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancel.frame=CGRectMake(320,15,100,40);
    cancel.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    cancel.layer.cornerRadius=7.0f;
    [cancel setTitle:@"Back" forState:UIControlStateNormal];
    cancel.layer.shadowColor=[UIColor whiteColor].CGColor;
    //[play setBackgroundImage:[UIImage imageNamed:@"login_button2.png"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancelHelpView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancel];
    
    
    helpView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 60,320,self.view.bounds.size.height-60)];
    helpView.contentSize = CGSizeMake(320,800);
    helpView.delegate = self;
    //helpView.backgroundColor=[UIColor whiteColor];
    
    
    //helpView.motionEffects=UIPageViewControll
    [self.view addSubview:helpView];
    
    
    [self.view addSubview:helpView];
    helpView.accessibilityActivationPoint = CGPointMake(100, 100);
    
    
    UITextView *instruction=[[UITextView alloc]initWithFrame:CGRectMake(10,0, 300, self.view.bounds.size.height-60)];
    instruction.editable=NO;
    instruction.text=@"";
    instruction.backgroundColor=[UIColor whiteColor];
    instruction.font=[UIFont systemFontOfSize:20.0f];
    [helpView addSubview:instruction];
    
    
    
    cancel.frame=CGRectMake(10,15,100,40);
    [UIView transitionFromView:header
                        toView:helpView
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    completion:^(BOOL finished){
                        [UIView animateWithDuration:1.5 animations:^{
                            
                            cancel.frame=CGRectMake(10,15,100,40);
                            
                        }];
                    }];
}




-(void)cancelHelpView{
    
    
    cancel.frame=CGRectMake(320,15,100,40);
    
    
    [UIView transitionFromView:helpView
                        toView:header
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    completion:^(BOOL finished){
                        
                    }];
    
}



-(void)PlayAction{
    
    
    mainLevel *levelPlay=[[mainLevel alloc]initWithNibName:@"Levels" bundle:nil];
    //mainLevel *levelPlay=[[mainLevel alloc]init];
   // [SingletonClass sharedSingleton].Score=0;
   // [SingletonClass sharedSingleton].life=5;
    levelPlay.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
                           [self presentViewController:levelPlay animated:YES completion:nil];
    
    
    
    
    
    
    
    
}


- (void) runSpinAnimationOnView:(UIView*)view {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * .1 * .1 ];
    rotationAnimation.duration = .1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 20;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
   // [self run:view];
    //CABasicAnimation* rotationAnimation;
   
=======
        backImg.image=[UIImage imageNamed:@"Login5_bg.png"];
    }

    
    
    
    [UIView animateWithDuration:1.5 animations:^{
         play.alpha=1;
        
    }];
    
}
#pragma mark-
#pragma buttons method




-(void)PlayAction{
    
    Levels *levelPlay=[[Levels alloc]initWithNibName:@"Levels" bundle:nil];
    [SingletonClass sharedSingleton].Score=0;
    [SingletonClass sharedSingleton].life=3;
    levelPlay.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
                           [self presentViewController:levelPlay animated:YES completion:nil];
    

    
    
}


#pragma mark-
#pragma internet check
- (BOOL) connectedToInternet
{
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
    return ( URLString != NULL ) ? YES : NO;
}



#pragma mark Sqlite DB and Retrive--
/*

 //not used methodes
 
 - (void) runSpinAnimationOnView:(UIView*)view {
 CABasicAnimation* rotationAnimation;
 rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
 rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation * .1 * .1 ];
rotationAnimation.duration = .1;
rotationAnimation.cumulative = YES;
rotationAnimation.repeatCount = 20;

[view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];


>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
}
-(void)run:(UIView*)view{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
<<<<<<< HEAD
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * -.1 * .5 ];
=======
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation * -.1 * .5 ];
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
    rotationAnimation.duration = .5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 20;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}




- (UIImage*) captureBlur:(UIView*)vW {
    //Get a UIImage from the UIView
    NSLog(@"blur capture");
    UIGraphicsBeginImageContext(vW.bounds.size);
    [vW.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Blur the UIImage
    CIImage *imageToBlur = [CIImage imageWithCGImage:viewImage.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat: 10] forKey: @"inputRadius"]; //change number to increase/decrease blur
    CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
    
    //create UIImage from filtered image
    UIImage *blurrredImage = [[UIImage alloc] initWithCIImage:resultImage];
    
    return blurrredImage;
<<<<<<< HEAD
    //Place the UIImage in a UIImageView
    //UIImageView *newView = [[UIImageView alloc] initWithFrame:CGRectMake(100,100, 200, 200)];
    // newView.image = blurrredImage;
    //newView.alpha=.1;
    //[self.view addSubview:newView];
    //insert blur UIImageView below transparent view inside the blur image container
    //[self.view insertSubview:newView belowSubview:transparentView];
=======
>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
}






<<<<<<< HEAD
=======


-(void)saveinSqlite
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSLog(@"%@",paths);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"GameScoreDb.sqlite"];
    
    // Open the database and store the handle as a data member
    if (sqlite3_open([databasePath UTF8String], &_databaseHandle) == SQLITE_OK)
    {
        // Create the database if it doesn't yet exists in the file system
        
        
        // Create the PERSON table
        const char *sqlStatement = "CREATE TABLE  GameScoreFinal (ID INTEGER PRIMARY KEY AUTOINCREMENT, Game TEXT, Score TEXT,PlayerFbId TEXT)";
        NSString *insert=[NSString stringWithFormat:@"insert into person(id,firsrtname) VALUES(\"%@\",\"%@\")",1,"hunny"];
          const char *insert="INSERT INTO PERSON (FIRSTNAME, LASTNAME, BIRTHDAY) VALUES ('""1'""'hunny'""'singh'""'1992-08-14')";
        char *error;
        if (sqlite3_exec(_databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
        {
            NSLog(@"table created");
            
            
            NSLog(@"Database and tables created.");
        }
        else
        {
            NSLog(@"````Error: %s", error);
        }
    }
    
    
}
 
 
 
 
 
 -(void)retriveFromSQL
 {
 //localData=[[NSMutableArray alloc]init];
 
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 
 NSLog(@"%@",paths);
 NSString *documentsDirectory = [paths objectAtIndex:0];
 NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"GameScoreDb.sqlite"];
 NSLog(@"Connected fb user id %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"fbID"]);
 
 // Check to see if the database file already exists
 NSString * connectedFBid=[[NSUserDefaults standardUserDefaults] objectForKey:@"fbID"];
 NSString *query = [NSString stringWithFormat:@"select * from GameScoreFinal where PlayerFbId = \"%@\" ORDER BY Game Desc",connectedFBid];
 sqlite3_stmt *stmt=nil;
 if(sqlite3_open([databasePath UTF8String], &_databaseHandle)!=SQLITE_OK)
 NSLog(@"error to open");
 
 if (sqlite3_prepare_v2(_databaseHandle, [query UTF8String], -1, &stmt, NULL)== SQLITE_OK)
 {
 NSLog(@"prepared");
 }
 else
 NSLog(@"error");
 // sqlite3_step(stmt);
 @try
 {
 while(sqlite3_step(stmt)==SQLITE_ROW)
 {
 
 char *level = (char *) sqlite3_column_text(stmt,1);
 char *score = (char *) sqlite3_column_text(stmt,2);
 char *playerFbid = (char *) sqlite3_column_text(stmt,3);
 NSString *strLevel= [NSString  stringWithUTF8String:level];
 
 NSString *strScore  = [NSString stringWithUTF8String:score];
 NSString *playerFBid  = [NSString stringWithUTF8String:playerFbid];
 NSLog(@"player FB ID %@",playerFBid);
 if([playerFBid isEqualToString:@"Master"])
 {
 //master=TRUE;
 }
 NSLog(@"Level %@ and Score %@ ",strLevel,strScore);
 NSString * keyLevel=strLevel;
 NSString * keyScore=strScore;
 NSMutableDictionary * temp=[[NSMutableDictionary alloc]init];
 [temp setObject:keyLevel forKey:@"Level"];
 [temp setObject:keyScore forKey:@"Score"];
 [temp setObject:playerFBid forKey:@"PlayerFbID"];
 //[localData addObject:temp];
 }
 }
 @catch(NSException *e)
 {
 NSLog(@"%@",e);
 }
 
 
 }

 

*/



>>>>>>> 6ff3866329b927c0d61b0b16efdb62cb5c83236f
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
