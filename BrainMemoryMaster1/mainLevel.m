//
//  mainLevel.m
//  BrainMemoryMaster1
//
//  Created by GBS-ios on 1/17/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "mainLevel.h"



@interface mainLevel (){
    CGRect screenRect;
    int height1;
    int width1;
    Timer *t2;
    NSUserDefaults * firstTest;
    NSString * str;
UIButton *loginButton,*logoutbutton;
    NSUserDefaults *def1,*fbtoken;
    NSUserDefaults *def2,*def3,*def4,*def5,*tagfriendsname,*tagfriendsid,*tagfriendspic;
    NSMutableArray *friendids,*taggablefriendidlist,*taggablefriendnamelist,*taggablefriendpiclist;
    NSMutableArray *friendnames;
    UILabel *label;
}

@end

@implementation mainLevel

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
    
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width1, height1)];
  //not requird
    //*******
    if((width1==320)&&(height1==480)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1==320)&&(height1>480)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1==375)&&(height1=667)){
        backImg.image=[UIImage imageNamed:@"Login_bg1.png"];
    }
    
    else if((width1>=414 && height1>=736)){
        backImg.image=[UIImage imageNamed:@"Login_bg6+.png"];
    }
    else if((width1>400)&&(height1<1150)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1>600)&&(height1>1150)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    else if((width1>800)&&(height1>1700)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    //*******
    
    //backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    [self.view addSubview:backImg];

     self.view.backgroundColor=[UIColor blackColor];
    // Do any additional setup after loading the view from its nib.
    

    //---------facebook button------------
    
    
    
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width1==320 && height1==480){
    loginButton.frame=CGRectMake(73, 320, 180, 30);
         [loginButton setBackgroundImage:[UIImage imageNamed:@"f_login.png"] forState:UIControlStateNormal];
    }
    else if(width1==320 && height1==568)
    {
        loginButton.frame=CGRectMake(88, 380, 150, 30);
         [loginButton setBackgroundImage:[UIImage imageNamed:@"f_login.png"] forState:UIControlStateNormal];
    }
    else if(width1==375 && height1==667){
        loginButton.frame=CGRectMake(88, 420, 200, 40);
         [loginButton setBackgroundImage:[UIImage imageNamed:@"f_login copy1.png"] forState:UIControlStateNormal];
        
    }
    else if(width1>=414 && height1>=736){
        loginButton.frame=CGRectMake(88, height1-240, 235, 50);
        [loginButton setBackgroundImage:[UIImage imageNamed:@"f_login6+.png"] forState:UIControlStateNormal];
        
    }

    //[loginButton setTitle:@"facebook" forState:UIControlStateNormal];
    loginButton.backgroundColor=[UIColor clearColor];
    loginButton.layer.cornerRadius=7.0f;
    
    loginButton.layer.shadowColor=[UIColor blackColor].CGColor;
    
    [loginButton.layer setShadowOpacity:0.8];
    [loginButton.layer setShadowOffset:CGSizeMake(2.0, 1.0)];
   
    
    [self.view addSubview:loginButton];
    loginButton.hidden=YES;
    [loginButton addTarget:self action:@selector(login1) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    logoutbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width1==320 && height1==480){
        logoutbutton.frame=CGRectMake(73, 320, 180, 30);
        [logoutbutton setBackgroundImage:[UIImage imageNamed:@"f_logout.png"] forState:UIControlStateNormal];

    }
    else if(width1==320 && height1==568)
    {
        logoutbutton.frame=CGRectMake(88, 380, 150, 30);
        [logoutbutton setBackgroundImage:[UIImage imageNamed:@"f_logout.png"] forState:UIControlStateNormal];

    }
    else if(width1==375 && height1==667){
        logoutbutton.frame=CGRectMake(88, 420, 200, 40);
        [logoutbutton setBackgroundImage:[UIImage imageNamed:@"f_logout copy1.png"] forState:UIControlStateNormal];

        
    }
    else if(width1>=414 && height1>=667){
        logoutbutton.frame=CGRectMake(88, height1-240, 235, 50);
        [logoutbutton setBackgroundImage:[UIImage imageNamed:@"f_logout6+"] forState:UIControlStateNormal];
        
        
    }


    //[logoutbutton setTitle:@"logout" forState:UIControlStateNormal];
   // [logoutbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    logoutbutton.backgroundColor=[UIColor clearColor];
    logoutbutton.layer.cornerRadius=7.0f;
    
    logoutbutton.layer.shadowColor=[UIColor blackColor].CGColor;
    
    [logoutbutton.layer setShadowOpacity:0.8];
    [logoutbutton.layer setShadowOffset:CGSizeMake(2.0, 1.0)];
   
    [self.view addSubview:logoutbutton];
    logoutbutton.hidden=YES;
    [logoutbutton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    
    
    
   NSString *buttonstatus=[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookid"];
    if(buttonstatus==nil){
        
        logoutbutton.hidden=YES;
        loginButton.hidden=NO;
        

    }
    else{
        logoutbutton.hidden=NO;
        loginButton.hidden=YES;

    }
    
    
    
    //-------------------------------------
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //-------------------------------
    
    
    NSString *bck =[[NSUserDefaults standardUserDefaults] valueForKey:@"backkey"];
    NSLog(@"received time==%@",bck);
   // [SingletonClass sharedSingleton].Score= -1;
    
      //-------------------------------
    
  /*  NSLog(@"firstlife--------->%d",[SingletonClass sharedSingleton].firstlife);
    str=[[NSUserDefaults standardUserDefaults]objectForKey:@"timekey"];
if(!str){
    [SingletonClass sharedSingleton].firstlife=0;
        firstTest= [NSUserDefaults standardUserDefaults];
        [SingletonClass sharedSingleton].life=5;
    
    [firstTest setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"timekey"];
       [firstTest synchronize];
     NSLog( @"%d",[firstTest synchronize]);
       str=[[NSUserDefaults standardUserDefaults] valueForKey:@"timeKey"];
      NSLog( @"first value===%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"timeKey"]);

        
  }
else if([SingletonClass sharedSingleton].firstlife==1 ){
    [SingletonClass sharedSingleton].firstlife=0;
   NSString *lf =[[NSUserDefaults standardUserDefaults]valueForKey:@"lastlife"];
    int lif=[lf intValue];
    [SingletonClass sharedSingleton].life=lif;
}   */
    //-------------------------------

    // [self createUI];
    
}




-(void)createUI{
    
   
    
    UIButton *beginner=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width1>=414 && height1>=667){
         beginner.frame=CGRectMake(width1/4-20,height1-325,width1/2+40, height1/10);
    }
    else{
    beginner.frame=CGRectMake(width1/4-20,height1/4+40+height1/10+height1/10,width1/2+40, height1/10);
    }
   // .frame=CGRectMake(width1/4-20,-height1/10,width1/2+40, height1/10);
    // beginner.frame=CGRectMake(width1/4-20,height1/2,width1/2+40, height1/10);
    //beginner.frame=CGRectMake(width1/4-20, height1/2+height1/10,width1/2+40, height1/10);

    //beginner.backgroundColor=[UIColor colorWithRed:(CGFloat)255/255 green:(CGFloat)160/255 blue:(CGFloat)122/255 alpha:.3];
    beginner.backgroundColor=[UIColor clearColor];
    beginner.layer.cornerRadius=7.0f;
   
    beginner.layer.shadowColor=[UIColor blackColor].CGColor;
    
    [beginner.layer setShadowOpacity:0.8];
    [beginner.layer setShadowOffset:CGSizeMake(2.0, 1.0)];
    [beginner setBackgroundImage:[UIImage imageNamed:@"play_btn.png"] forState:UIControlStateNormal];
       [beginner addTarget:self action:@selector(beginnersAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginner];
    

    
    UIButton *intermediate=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    intermediate.frame=CGRectMake(width1/4-20,-height1/10,width1/2+40, height1/10);
    intermediate.backgroundColor=[UIColor clearColor];
    intermediate.layer.cornerRadius=7.0f;
    [intermediate.layer setShadowOpacity:0.8];
    [intermediate.layer setShadowOffset:CGSizeMake(2.0, 1.0)];
    
    [intermediate setBackgroundImage:[UIImage imageNamed:@"intermediate_btn.png"] forState:UIControlStateNormal];
    
    [intermediate addTarget:self action:@selector(intermediateAcion) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:intermediate];
    
    
    UIButton *hard=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    hard.frame=CGRectMake(width1/4-20,-height1/10,width1/2+40, height1/10);
    hard.backgroundColor=[UIColor clearColor];
    hard.layer.cornerRadius=7.0f;
    [hard.layer setShadowOpacity:0.8];
    [hard.layer setShadowOffset:CGSizeMake(0., 1.)];
    [hard setBackgroundImage:[UIImage imageNamed:@"hard_btn.png"] forState:UIControlStateNormal];

    hard.layer.shadowColor=[UIColor whiteColor].CGColor;
    [hard addTarget:self action:@selector(hardAction) forControlEvents:UIControlEventTouchUpInside];
    //hard.enabled=NO;
   // [self.view addSubview:hard];
    
    
    UIButton *expert=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    expert.frame=CGRectMake(width1/4-20,-height1/10,width1/2+40, height1/10);
    expert.backgroundColor=[UIColor clearColor];
    expert.layer.cornerRadius=7.0f;
    [expert.layer setShadowOpacity:0.8];
    [expert.layer setShadowOffset:CGSizeMake(0., 1.)];
    [expert setBackgroundImage:[UIImage imageNamed:@"expert_btn.png"] forState:UIControlStateNormal];
    expert.layer.shadowColor=[UIColor whiteColor].CGColor;
    [expert addTarget:self action:@selector(expertAction) forControlEvents:UIControlEventTouchUpInside];
    //expert.enabled=NO;
  //  [self.view addSubview:expert];
    //****************************************
    
   /* UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame=CGRectMake(-80, -280, 200, 50);
    [btn1 setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn1.layer.cornerRadius=10.0f;
    btn1.backgroundColor=[UIColor whiteColor];
    [btn1 addTarget:self action:@selector(push1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];*/

    //****************************************
    
    
    
    
  
//    [UIView animateWithDuration: 0.4
//                          delay:0
//                        options: UIViewAnimationOptionCurveEaseOut
//                     animations: ^{
//                         beginner.frame=CGRectMake(width1/4-20,height1/4+40+height1/10+height1/10,width1/2+40, height1/10);
//                         //intermediate.frame=CGRectMake(width1/4-20,height1/4+20+height1/10,width1/2+40, height1/10);
//                         //hard.frame=CGRectMake(width1/4-20,height1/4+40+height1/10+height1/10,width1/2+40, height1/10);
//                         //expert.frame=CGRectMake(width1/4-20,height1/4+60+height1/10+height1/10+height1/10,width1/2+40, //height1/10);
//                       
//                     } completion: ^(BOOL finished) {
//                         
//                     }
//     ];
//
//    
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
   [self createUI];
}
//-----------------------------------------------------------------
-(void)login1{
    
    
   
    
    
     label  =[[UILabel alloc]init];
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    BOOL netWorkConnection;
    if(status == NotReachable)
    {
        netWorkConnection=NO;
    }
    else if (status == ReachableViaWiFi){
        netWorkConnection=YES;
    }else if (status==ReachableViaWWAN){
        netWorkConnection=YES;
        
    }else{
        netWorkConnection=NO;
    }
    
    [[NSUserDefaults standardUserDefaults] setBool:netWorkConnection forKey:@"ConnectionAvilable"];
    
    
    BOOL networkConnection=[[NSUserDefaults standardUserDefaults] boolForKey:@"ConnectionAvilable"];
    
    NSLog(@">>>>>>>>>>internet%d",networkConnection);
    if (networkConnection==1) {
        

    NSArray *  permissions = [NSArray arrayWithObjects:@"user_friends", nil];
    FBSDKLoginManager * manager =[[FBSDKLoginManager alloc]init];
    
    
    
    //----------------------publish permission------------------------
    
        [manager logInWithReadPermissions:permissions handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
        if (error) {
            NSLog(@"Error %@",error);
        }
        else{
            if ([FBSDKAccessToken currentAccessToken])
                
            {
                //[self accesstokendisplay];
                
                
                
                FBSDKGraphRequest * request =[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{ @"fields" : @"id,name,picture,friends"}];
                [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                    
                    
                    
                    
                    
                    
                   [self publishaction];
                    
               
                    
                    
                    
                    
                    //[loginButton setTitle:@"LOGGED IN" forState:UIControlStateNormal];
                    //loginButton.hidden=YES;
                    logoutbutton.hidden=NO;
                    loginButton.hidden=YES;
                    
                    NSLog(@"result %@", result);
        
                    NSString *str1=[result objectForKey:@"id"];
                    NSLog(@"facebook id-%@",str1);
                    
                    def1= [NSUserDefaults standardUserDefaults];
                    [def1 setObject:str1 forKey:@"facebookid"];
                    [def1 synchronize];
                    NSLog(@"----%d",[def1 synchronize]);
                    
                    
                    
                    
                   PFInstallation *currentInstallation = [PFInstallation currentInstallation];
                    
                                      [currentInstallation setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookid"] forKey:@"facebookId"];
                                       [currentInstallation saveInBackground];

                    
                    
        //-----------------------------Taggable friends--------------------------------------------------------
                
                    
                    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                                  initWithGraphPath:@"/me/taggable_friends"
                                                  parameters:@{ @"fields" : @"id,name,picture"}
                                                  HTTPMethod:@"GET"];
                    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                                          id result,
                                                          NSError *error) {
                        NSLog(@"results=========>%@",result);
                        NSArray *frienddata=[result objectForKey:@"data"];
                        NSLog(@"frienddata id-%@",frienddata);
                        
                        NSLog(@"no of taggable datas is------->%lu",(unsigned long)frienddata.count);
                        
                       /* NSString *friendname=[frienddata objectForKey:@"name"];
                        NSLog(@"friends name----->%@",friendname);*/
                         taggablefriendidlist=[[NSMutableArray alloc]init];
                        taggablefriendnamelist=[[NSMutableArray alloc]init];
                        taggablefriendpiclist=[[NSMutableArray alloc]init];

                        for(int i=0;i<frienddata.count;i++)
                        {
                            
                            NSDictionary *tagfriendinfo=[frienddata objectAtIndexedSubscript:i];
                           
                            
                            
                            NSString *taggablefriendid=[tagfriendinfo objectForKey:@"id"];
                           // NSLog(@"taggable friend id======%@",taggablefriendid);
                            [taggablefriendidlist setObject:taggablefriendid atIndexedSubscript:i];
                            
                            
                            NSString *taggablefriendname=[tagfriendinfo objectForKey:@"name"];
                            // NSLog(@"taggable friend name===%@",taggablefriendname);
                            [taggablefriendnamelist setObject:taggablefriendname atIndexedSubscript:i];
                            
                            
                            
                            NSDictionary *taggablefriendpic=[tagfriendinfo objectForKey:@"picture"];
                            NSDictionary *taggablefrienddata=[taggablefriendpic objectForKey:@"data"];
                            NSString *taggablefriendprofilepic=[taggablefrienddata objectForKey:@"url"];
                           // NSLog(@"taggable friends profile photo==%@",taggablefriendprofilepic);
                                                        [taggablefriendpiclist setObject:taggablefriendprofilepic atIndexedSubscript:i];
                            
                                   }
                        
                                                
                        NSLog(@"tagfriendid list=======%@",taggablefriendidlist);
                        NSLog(@"tagfriendname list=======%@",taggablefriendnamelist);
                        
                        NSLog(@"tagfriendpic list=======%@",taggablefriendpiclist);
                        
                        
                        
                        
                        tagfriendsid= [NSUserDefaults standardUserDefaults];
                        [tagfriendsid setObject:taggablefriendidlist forKey:@"facebooktagfriendsids"];
                        [tagfriendsid synchronize];
                        NSLog(@"----%d",[tagfriendsid synchronize]);
                        
                        
                        tagfriendsname= [NSUserDefaults standardUserDefaults];
                        [tagfriendsname setObject:taggablefriendnamelist forKey:@"facebooktagfriendsnames"];
                        [tagfriendsname synchronize];
                        NSLog(@"----%d",[tagfriendsname synchronize]);
                        
                        
                        tagfriendspic= [NSUserDefaults standardUserDefaults];
                        [tagfriendspic setObject:taggablefriendpiclist forKey:@"facebooktagfriendspics"];
                        [tagfriendspic synchronize];
                        NSLog(@"----%d",[tagfriendspic synchronize]);


                        
                        

                                         }];
                    
                    
                    
                    

                    
     //---------------------------------------------------------------------------------------------------------
                    
                    

                    
                    
                    NSString *str2=[result objectForKey:@"name"];
                    NSLog(@"facebook name-%@",str2);
                    def2= [NSUserDefaults standardUserDefaults];
                    [def2 setObject:str2 forKey:@"facebookname"];
                    [def2 synchronize];
                    NSLog(@"----%d",[def2 synchronize]);
                    
                    
                    
                    
                    NSString *name=[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookname"];
                    if (width1==375 && height1==667) {
                        label.frame=CGRectMake(0,470,screenRect.size.width, 20);
                    }
                else    if(width1==320&& height1==480){
                        label.frame=CGRectMake(0,410,screenRect.size.width, 20);
                    }
                    else{
                    label.frame=CGRectMake(0,470,screenRect.size.width, 20);
                    }
                    
                   label.textAlignment=NSTextAlignmentCenter;
                    label.text=[NSString stringWithFormat:@"%@ Logged In",[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookname"]];
                    label.textColor=[UIColor blackColor];
                    label.backgroundColor=[UIColor grayColor];
                    // label.backgroundColor.layer.cornerRadius=6;
                    label.font=[UIFont systemFontOfSize:14];
                    
                    [self.view addSubview:label];
                    [self performSelector:@selector(cancelLabel)  withObject:nil afterDelay:2];
                    

                    
                    
                    
                    
                    
                    
                    NSDictionary *str3=[result objectForKey:@"friends"];
                    NSLog(@"facebook friends-%@",str3);
                NSArray *data=[str3 objectForKey:@"data"];
                    //  NSLog(@"facebook datas-%@",data);
                    
                    friendids=[[NSMutableArray alloc]init];
                    friendnames=[[NSMutableArray alloc]init];
                    
                    for(int i=0;i<data.count;i++)
                    {
                    
                        NSDictionary *friendlist=[data objectAtIndex:i];
                        //NSLog(@"friends list id and name:%@",friendlist);
                        
                    
                        NSString *ids=[friendlist objectForKey:@"id"];
                        NSLog(@"friendids======%@",ids);
                        
                        [friendids setObject:ids atIndexedSubscript:i];
                        
                        NSString *names=[friendlist objectForKey:@"name"];
                        NSLog(@"friendsnames======%@",names);
                        
                        [friendnames setObject:names atIndexedSubscript:i];
                        
                        
                        
                    }
                    
                    def5= [NSUserDefaults standardUserDefaults];
                    [def5 setObject:friendids forKey:@"fbfriendids"];
                    [def5 synchronize];
                    NSLog(@"----%d",[def5 synchronize]);

                    
                    [friendids addObject:str1];
                    
                   NSLog(@"friends list ids:%@",friendids);
                    
                    def3= [NSUserDefaults standardUserDefaults];
                    [def3 setObject:friendids forKey:@"facebookfriendsid"];
                    [def3 synchronize];
                    NSLog(@"----%d",[def3 synchronize]);
                    
                    
                    NSLog(@"friends list id and name:%@",friendnames);
                    def4= [NSUserDefaults standardUserDefaults];
                    [def4 setObject:friendnames forKey:@"facebookfriendsname"];
                    [def4 synchronize];
                    NSLog(@"----%d",[def4 synchronize]);
                    
                    
                   
           //----------------------------------------------------------------------
                }];
                
            }
            
            else NSLog(@"dsdgfsdG");
        }
        
    }];
    
    
    }
    else{
       
       
        label.text=@"  Check Network Status..";
        label.textColor=[UIColor blackColor];
        label.backgroundColor=[UIColor grayColor];
        // label.backgroundColor.layer.cornerRadius=6;
        
        [self.view addSubview:label];
        [self performSelector:@selector(cancelLabel)  withObject:nil afterDelay:2];
        

        
    }
         //logoutbutton.hidden=NO;
    
    
}
-(void)cancelLabel{
    
    [label removeFromSuperview];
}


/*-(void)accesstokendisplay{
    if ([FBSDKAccessToken currentAccessToken]){
        FirstAppDelegate *appdelegate=[UIApplication sharedApplication].delegate;
        [appdelegate beatFriend ];

        
    }
    
        
    
    
}*/

-(void)logout{
    logoutbutton.hidden=YES;
    loginButton.hidden=NO;
    
    [FBSDKAccessToken setCurrentAccessToken:nil];
    def1= [NSUserDefaults standardUserDefaults];
    [def1 removeObjectForKey:@"facebookid" ] ;
    [def1 synchronize];
    NSLog(@"----%d",[def1 synchronize]);

    NSLog(@"logout");
    NSLog(@"AccessToken ==p-=-=-=-=-= %@",[FBSDKAccessToken currentAccessToken].tokenString);
    
    NSString *name=[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookname"];
    if (width1==375 && height1==667) {
        label.frame=CGRectMake(0,470,screenRect.size.width, 20);
    }
    else    if(width1==320&& height1==480){
        label.frame=CGRectMake(0,410,screenRect.size.width, 20);
    }
    else{
   label.frame=CGRectMake(0,400,screenRect.size.width, 20);
    }
    //label.frame=CGRectMake(55,400,150, 20);
   // label.text=@"Logged Out";
    //label.font=[label adjustsFontSizeToFitWidth];
   label.text=[NSString stringWithFormat:@"%@ Logged Out",[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookname"]];
    label.textColor=[UIColor blackColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor grayColor];
    // label.backgroundColor.layer.cornerRadius=6;
    
    [self.view addSubview:label];
    [self performSelector:@selector(cancelLabel)  withObject:nil afterDelay:2];


}

//--------------------------------------------------

-(void)beginnersAction{
    
    
   
    
  //  NSString *obj=[[NSUserDefaults standardUserDefaults] objectForKey:@"timeRem"];
    
    NSLog(@"firstlife--------->%d",[SingletonClass sharedSingleton].firstlife);
    str=[[NSUserDefaults standardUserDefaults]objectForKey:@"timekey"];
    int backgrd=[[[NSUserDefaults standardUserDefaults]objectForKey:@"backgroundd"] intValue];
    if(!str){
        [SingletonClass sharedSingleton].firstlife=0;
        firstTest= [NSUserDefaults standardUserDefaults];
        [SingletonClass sharedSingleton].life=5;
        
        
        
        
        [firstTest setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"timekey"];
        [firstTest synchronize]; 
        NSLog( @"%d",[firstTest synchronize]);
        str=[[NSUserDefaults standardUserDefaults] valueForKey:@"timeKey"];
        NSLog( @"first value===%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"timeKey"]);
        
        
    }
    else if(backgrd==1){
        NSString *lf =[[NSUserDefaults standardUserDefaults]valueForKey:@"lastlife"];
        int lif=[lf intValue];
        
        [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"backgroundd"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [SingletonClass sharedSingleton].life=lif;
//        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"startkey"];
//        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
    
        Levels *levelPlay=[[Levels alloc]init];
        [SingletonClass sharedSingleton].mainLevel=1;
        levelPlay.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:levelPlay animated:YES completion:nil];

  
}

  
-(void)intermediateAcion{
      //------------------------------------------------
    //if([SingletonClass sharedSingleton].life==0)
    //{
    //    t2=[[Timer alloc]init];
    //[[SingletonClass sharedSingleton].timer invalidate];
        //t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        
       // [self presentViewController:t2 animated:YES completion:nil];
    //}else{
    
    Levels *levelPlay=[[Levels alloc]initWithNibName:@"Levels" bundle:nil];
    [SingletonClass sharedSingleton].mainLevel=2;
   // levelPlay.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    
    UIView* view = levelPlay.view;
    view.frame = self.view.window.bounds;
    [UIView transitionWithView:self.view.window
                      duration:.8
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^(void) {
                        [self.view.window addSubview:view];
                    }
                    completion:^(BOOL finished) {
                        [self.view removeFromSuperview];
                        [self presentViewController:levelPlay animated:YES completion:nil];
                    }];
    
    }
    
//}

-(void)hardAction{
      //------------------------------------------------
  //  if([SingletonClass sharedSingleton].life==0)
  //  {
       // t2=[[Timer alloc]init];
    //[[SingletonClass sharedSingleton].timer invalidate];
     //   t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        
        //[self presentViewController:t2 animated:YES completion:nil];
 //   }else{
    
    Levels *levelPlay=[[Levels alloc]initWithNibName:@"Levels" bundle:nil];
    [SingletonClass sharedSingleton].mainLevel=3;
    levelPlay.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    
    UIView* view = levelPlay.view;
    view.frame = self.view.window.bounds;
    [UIView transitionWithView:self.view.window
                      duration:.8
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^(void) {
                        [self.view.window addSubview:view];
                    }
                    completion:^(BOOL finished) {
                        [self.view removeFromSuperview];
                        [self presentViewController:levelPlay animated:YES completion:nil];
                    }];
    }
    
    
//}

-(void)expertAction{
      //------------------------------------------------
   // if([SingletonClass sharedSingleton].life==0)
   // {
        //t2=[[Timer alloc]init];
        //t2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        
        //[self presentViewController:t2 animated:YES completion:nil];
  //  }else{
    
    Levels *levelPlay=[[Levels alloc]initWithNibName:@"Levels" bundle:nil];
    [SingletonClass sharedSingleton].mainLevel=4;
    levelPlay.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    
    UIView* view = levelPlay.view;
    view.frame = self.view.window.bounds;
    [UIView transitionWithView:self.view.window
                      duration:.3
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^(void) {
                        [self.view.window addSubview:view];
                    }
                    completion:^(BOOL finished) {
                        [self.view removeFromSuperview];
                        [self presentViewController:levelPlay animated:YES completion:nil];
                    }];
    
    }
    
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)publishaction{
    if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"publish_actions"]) {
        // TODO: publish content.
    } else {
        FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
        
        
        
        [loginManager logInWithPublishPermissions:@[@"publish_actions"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error){
            if (error) {
                NSLog(@"Error %@",error);
            }
            else{
                NSLog(@"permission result--------->%@",result);
                NSLog (@"---------->%@",[FBSDKAccessToken currentAccessToken]);
                
            }
            
            
            //TODO: process error or result.
        }];
    }
    
    

}

@end
