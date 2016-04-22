//
//  FirstAppDelegate.m
//  BrainMemoryMaster1
//
//  Created by GBS-ios on 1/16/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "FirstAppDelegate.h"
#import "Reachability.m"

@implementation FirstAppDelegate{
    NSMutableArray *taggedFriendsidlist;
      int backtimeint,share;
    NSDate *backgroundDate,*foreground,*terminate;
    NSString *high;
    NSString *game;
    NSUserDefaults *savedate,*timerAgain,*status,*default1;
    NSString *strDate11;
}



- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    
//    [[NSUserDefaults standardUserDefaults]setObject:deviceToken forKey:@"deviceToken"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
    //[currentInstallation addUniqueObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookid"]  forKey:@"facebookId"];
    //currentInstallation.channels = @[ @"global" ];
    [currentInstallation saveInBackground];
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [SingletonClass sharedSingleton].subLevel=0;
    
     strDate11 =[[NSUserDefaults standardUserDefaults] valueForKey:@"terminatetime"];
    
    
    
    NSDate *currentDate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    NSString *strCurrentDate = [formatter stringFromDate:currentDate];
    currentDate=[formatter dateFromString:strCurrentDate];

    
    //-------------------------------------------------------
    
        int timertoterminate=[[[NSUserDefaults standardUserDefaults]objectForKey:@"timercheck"] intValue];
    if(timertoterminate==1)
    {
        
        
        NSDateFormatter *formatter1 = [[NSDateFormatter alloc]init];
        [formatter1 setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
        NSDate *oldDate = [formatter1 dateFromString:strDate11];
        unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSSecondCalendarUnit;
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDateComponents *conversionInfo = [cal components:unitFlags fromDate:oldDate  toDate:currentDate  options:0];
        
        //int months = (int)[conversionInfo month];
        int days = (int)[conversionInfo day];
        int hours = (int)[conversionInfo hour];
        int minutes = (int)[conversionInfo minute];
        int seconds = (int)[conversionInfo second];
        
        
        NSLog(@"Active again-------------------");
        NSLog(@"%d days %d hours %d min %d sec", days, hours, minutes, seconds);
        
        
        
        int timeInSec=hours*3600+minutes*60+seconds;
        NSLog(@"time in sec--------->%d",timeInSec);
        
        int liffe=[[[NSUserDefaults standardUserDefaults]objectForKey:@"lastlife"] intValue];
        if(timeInSec>=100)
        {
                           [SingletonClass sharedSingleton].life=5
;
            
            [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"startkey"];
            [[NSUserDefaults standardUserDefaults]synchronize];
           

        }
       
        else if(timeInSec>=80){
                   if(liffe==4)
                      [SingletonClass sharedSingleton].life=5;
                   else if (liffe==3)
                      [SingletonClass sharedSingleton].life=5;
                   else if (liffe==2)
                       [SingletonClass sharedSingleton].life=5;
                   else if (liffe==1)
                       [SingletonClass sharedSingleton].life=5;
                   else if (liffe==0)
                       [SingletonClass sharedSingleton].life=4;
            [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"startkey"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            

            
        }
        else if(timeInSec>=60){
            if(liffe==4)
                [SingletonClass sharedSingleton].life=5;
            else if (liffe==3)
                [SingletonClass sharedSingleton].life=5;
            else if (liffe==2)
                [SingletonClass sharedSingleton].life=5;
            else if (liffe==1)
                [SingletonClass sharedSingleton].life=4;
            else if (liffe==0)
                [SingletonClass sharedSingleton].life=3;
            
            [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"startkey"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            

        }
        else if(timeInSec>=40){
            
       
            if(liffe==4)
                [SingletonClass sharedSingleton].life=5;
            else if (liffe==3)
                [SingletonClass sharedSingleton].life=5;
            else if (liffe==2)
                [SingletonClass sharedSingleton].life=4;
            else if (liffe==1)
                [SingletonClass sharedSingleton].life=3;
            else if (liffe==0)
                [SingletonClass sharedSingleton].life=2;
            
            
            [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"startkey"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            

        }
        else if(timeInSec>=20){
            if(liffe==4)
                [SingletonClass sharedSingleton].life=5;
            else if (liffe==3)
                [SingletonClass sharedSingleton].life=4;
            else if (liffe==2)
                [SingletonClass sharedSingleton].life=3;
            else if (liffe==1)
                [SingletonClass sharedSingleton].life=2;
            else if (liffe==0)
                [SingletonClass sharedSingleton].life=1;
            
            
            [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"startkey"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            

        }
        
        
        
        
        
        NSLog(@"launching........");
        
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"timeRem"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:0]  forKey:@"timercheck"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        

        
        NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
        [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
        [str synchronize];
        
       // [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
        
        
    }
    
    
    
    
    
    
    

    
   NSUserDefaults *firsttime= [NSUserDefaults standardUserDefaults];
    [firsttime setInteger:1 forKey:@"firsttimeuser"];
    [firsttime synchronize];
    NSLog( @"%d",[firsttime synchronize]);
    
    
    
    
    
    [self checkNetWorkConnection];
    
    BOOL networkConnection=[[NSUserDefaults standardUserDefaults] boolForKey:@"ConnectionAvilable"];

    NSLog(@">>>>>>>>>>internet%d",networkConnection);
    
   [Flurry setCrashReportingEnabled:YES];
    [Flurry startSession:@"5KJ3WF454FQP2KTY3RDP"];
    
    
    [Parse enableLocalDatastore];
    [Parse setApplicationId:@"l8JQd17CmSRBWwcqqZP6GxRw8iDFj213c4lY1Vpo" clientKey:@"Y8mcOoyDhpKv6hZPedtqTOQXEBrDh2dTGsR9WDjo"];
    
    
    
//    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
//                                                    UIUserNotificationTypeBadge |
//                                                    UIUserNotificationTypeSound);
//    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
//                                                                             categories:nil];
//    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//   // [application registerForRemoteNotifications];
//    
//    [[UIApplication sharedApplication] registerForRemoteNotifications];
//    
//    // [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
   
        //This code will work in iOS 8.0 xcode 6.0 or later
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        {
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
            
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        }
        else
        {
            [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeNewsstandContentAvailability| UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
        }
        
    
   mainLevel *mainlevel=[[mainLevel alloc ]init];

   
    
   self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   [self.window setRootViewController: mainlevel];
    
    
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];

    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application





{
    
    [[SingletonClass sharedSingleton].timer invalidate];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];

    
    [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"backgroundd"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    status= [NSUserDefaults standardUserDefaults];
    [status setInteger:2 forKey:@"checkStatus"];
    NSLog(@"status:%d",[status synchronize]) ;
    
    
    NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
    [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
    [str synchronize];
    NSLog( @"%d",[str synchronize]);
    
    
    int timerchk=[[[NSUserDefaults standardUserDefaults]objectForKey:@"timercheck"] intValue];
   
    if(timerchk==1){
        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:1]  forKey:@"fromtimertobackgnd"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
      //------------------------------------------------
    NSString *backtime =[[NSUserDefaults standardUserDefaults]objectForKey:@"timeRem"];
    //------------------------------------------------
    backtimeint=[backtime intValue];
    NSLog(@"background time---------->%d",backtimeint);
    
    
    
    backgroundDate = [[NSDate alloc] init];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    NSString *date=[df stringFromDate:backgroundDate];
    NSLog(@"bACKdate>>>>>%@",date);
    
    backgroundDate=[df dateFromString:date];
    
    

    
    
    NSLog(@"background time------->%@",backgroundDate);
    
    
    
 
    
    
    
    
    
    
    
    NSLog(@"application in background");
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    
    
    
   
    
    
    
    foreground = [[NSDate alloc] init];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString *date=[df stringFromDate:foreground];
    NSLog(@"foregrnddate>>>>>%@",date);
    
    df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"hh:mm:ss"];
    date=[df stringFromDate:foreground];
    NSLog(@"foregrnddate/time>>>>>%@",date);
    

    
    
    NSLog(@"again lunched.....");
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBSDKAppEvents activateApp];
    
    
    
    
    
    
 
        
       [[NSNotificationCenter defaultCenter]postNotificationName:@"timeForLife" object:nil];
        

        
        
      }







- (void)applicationWillTerminate:(UIApplication *)application
{
    
    
    
    
     [[SingletonClass sharedSingleton].timer invalidate];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"timeForLife" object:nil];
    
    
    
    
    [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"backgroundd"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    


    
    int timerchk=[[[NSUserDefaults standardUserDefaults]objectForKey:@"timercheck"] intValue];
    
    if(timerchk==1){
        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:1]  forKey:@"fromtimertobackgnd"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
    

    
    NSString *backtime =[[NSUserDefaults standardUserDefaults]objectForKey:@"timeRem"];
    //------------------------------------------------
    backtimeint=[backtime intValue];
    NSLog(@"background time---------->%d",backtimeint);
    
    
    
    
    
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:1]  forKey:@"nowTerminated"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    
    
    
   
    NSUserDefaults *str= [NSUserDefaults standardUserDefaults];
    [str setObject: [ NSNumber numberWithInt:[SingletonClass sharedSingleton].life ] forKey:@"lastlife"];
    [str synchronize];
    
    NSLog( @"terminated life synccccc  ====>>%d",[str synchronize]);


    terminate = [[NSDate alloc] init];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
    NSString *date=[df stringFromDate:terminate];
    NSLog(@"TERMINATEdate>>>>>%@",date);
    
    
    
    savedate= [NSUserDefaults standardUserDefaults];
    [savedate setObject:date forKey:@"terminatetime"];

    
    
    
   
    
    
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
    
}
-(void)checkNetWorkConnection{
    
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
    
}

-(void)poostObjectGraph
{
    
    high=[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookhighscore"];
    game=[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookhighscoregame"];
    NSURL *imageURL = [NSURL URLWithString:@"https://bmm.globusgames.com/assets/image/bmm_icon.png"];
    FBSDKSharePhoto *photo = [FBSDKSharePhoto photoWithImageURL:imageURL userGenerated:NO];
    
    NSDictionary *properties = @{
                                                                 @"og:type": @"brainmemorymaster:highscore",
                                                                 @"og:title": [NSString stringWithFormat:@"New High Score %@",high],
                                                                  @"og:description": [NSString stringWithFormat:@"My new highscore in game %@ is %@. Flex your brain muscles! Brain Memory Master is a superb collection of games which will test your mental skills in line of cognitive psychological principles. The kind of game you would want to play to increase your agility.",game,high],
                                                                
                                                                 @"og:image": @[photo]
                                                                  };
    FBSDKShareOpenGraphObject *object = [FBSDKShareOpenGraphObject objectWithProperties:properties];
    
    FBSDKShareOpenGraphAction *action = [[FBSDKShareOpenGraphAction alloc] init];
    action.actionType = @"brainmemorymaster:get";
    [action setString: @"true" forKey: @"fb:explicitly_shared"];
    [action setObject:object forKey:@"brainmemorymaster:highscore"];
    
    FBSDKShareOpenGraphContent *content = [[FBSDKShareOpenGraphContent alloc] init];
    content.action = action;
    content.previewPropertyName = @"brainmemorymaster:highscore";
    
    
    
    [FBSDKShareAPI shareWithContent:content delegate:nil];
    
    

    
//    NSURL *imageURL = [NSURL URLWithString:@"https://bmm.globusgames.com/assets/image/bmm_icon.png"];
//    FBSDKSharePhoto *photo = [FBSDKSharePhoto photoWithImageURL:imageURL userGenerated:NO];
//    NSDictionary *properties = @{
//                                 @"og:type": @"brainmemorymaster:highscore",
//                                 @"og:title": [NSString stringWithFormat:@"New High Score %@",high],
//                                 @"og:description": [NSString stringWithFormat:@"My new highscore in game %@ is %@. Flex your brain muscles! Brain Memory Master is a superb collection of games which will test your mental skills in line of cognitive psychological principles. The kind of game you would want to play to increase your agility.",game,high],
//                                 /*@"og:url": @"http://samples.ogp.me/1432641320370005",*/
//                                 @"og:image": @[photo]
//                                 };
//    //[NSString stringWithFormat:@"Game:%d",[SingletonClass sharedSingleton].level];
//    FBSDKShareOpenGraphObject *object = [FBSDKShareOpenGraphObject objectWithProperties:properties];
//    FBSDKShareAPI *shareAPI = [[FBSDKShareAPI alloc] init];
//    [shareAPI createOpenGraphObject:object];
//    
//    
//    FBSDKShareOpenGraphAction *action = [[FBSDKShareOpenGraphAction alloc] init];
//    action.actionType = @"brainmemorymaster:get";
//    [action setString: @"true" forKey: @"fb:explicitly_shared"];
//
//    //[action setString:@"http://samples.ogp.me/1432641320370005" forKey:@"highscore"];
//    
//    FBSDKShareOpenGraphContent *content = [[FBSDKShareOpenGraphContent alloc] init];
//    content.action = action;
//    content.previewPropertyName = @"highscore";
//      shareAPI.shareContent = content;
//    [shareAPI share];
//    
//    //  FBSDKShareAPI *shareAPI = [[FBSDKShareAPI alloc] init];
//    // optionally set the delegate
//    // shareAPI.delegate = self;
        NSLog(@"entering................");
  
}
-(void)beatFriend{
    
    high=[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookhighscore"];
    game=[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookhighscoregame"];
   NSString*retriveBeatFriends=[[NSUserDefaults standardUserDefaults]objectForKey:@"tagbeatfriends"];
    
    
  NSString *retriveFdFbID=[[NSUserDefaults standardUserDefaults]objectForKey:@"friendsFId"];
    
    
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"facebookId"equalTo:retriveFdFbID];
    
    
    NSDictionary *data = @{
                           @"alert" : [NSString stringWithFormat:@"%@ beat you on game %@ with Score %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookname"],game,high],
                           @"sounds" : @"cheering.caf"
                           };
    
    
    PFPush *push = [[PFPush alloc] init];
    [push setQuery:pushQuery]; // Set our Installation query
    //[push setMessage:[NSString stringWithFormat:@"%@ beat you on game %@ with Score %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookname"],game,high]];
    [push setData:data];
    [push sendPushInBackground];

    
    
    NSURL *imageURL = [NSURL URLWithString:@"https://bmm.globusgames.com/assets/image/bmm_icon.png"];
    FBSDKSharePhoto *photo = [FBSDKSharePhoto photoWithImageURL:imageURL userGenerated:NO];
    
    NSDictionary *properties = @{
                                 @"og:type": @"brainmemorymaster:friend",
                                 @"og:title": @"Brain Memory Master",
                                 @"og:description": [NSString stringWithFormat:@"I Beat %@ at game %@ and scored %@ Flex your brain muscles! Brain Memory Master is a superb collection of games which will test your mental skills in line of cognitive psychological principles. The kind of game you would want to play to increase your agility.",retriveBeatFriends,game,high],
                                 //@"og:url": @"http://samples.ogp.me/1432586650375472",
                                 @"og:image": @[photo]
                                 };
    FBSDKShareOpenGraphObject *object = [FBSDKShareOpenGraphObject objectWithProperties:properties];
    
    FBSDKShareOpenGraphAction *action = [[FBSDKShareOpenGraphAction alloc] init];
    action.actionType = @"brainmemorymaster:beat";
    [action setString: @"true" forKey: @"fb:explicitly_shared"];
    [action setObject:object forKey:@"brainmemorymaster:friend"];
    
    FBSDKShareOpenGraphContent *content = [[FBSDKShareOpenGraphContent alloc] init];
    content.action = action;
    content.previewPropertyName = @"brainmemorymaster:friend";
    
    
    
    [FBSDKShareAPI shareWithContent:content delegate:nil];
    
    
  //  PFQuery *userQuery = [PFUser query];
  //  [userQuery whereKey:@"facebookId" equalTo:retriveBeatFriends];
//    
    // Find devices associated with these users
    
   
}
-(void)requestLife{
   
      /* NSURL *imageURL = [NSURL URLWithString:@"https://bmm.globusgames.com/assets/image/bmm_icon.png"];
    FBSDKSharePhoto *photo = [FBSDKSharePhoto photoWithImageURL:imageURL userGenerated:NO];
    NSDictionary *properties = @{
                                 @"og:type": @"brainmemorymaster:life",
                                 @"og:title": @"Request for a life",
                                 @"og:description": @"Hi friends, Please help me to clear this game with a life. Join it and give me a life please.",
                                 
                                 @"og:image": @[photo]
                                 };
    FBSDKShareOpenGraphObject *object = [FBSDKShareOpenGraphObject objectWithProperties:properties];
    FBSDKShareAPI *shareAPI = [[FBSDKShareAPI alloc] init];
    [shareAPI createOpenGraphObject:object];
    
    
    FBSDKShareOpenGraphAction *action = [[FBSDKShareOpenGraphAction alloc] init];
    action.actionType = @"brainmemorymaster:request";
    [action setString:@"http://samples.ogp.me/1463263410641129" forKey:@"life"];
    [action setString: @"true" forKey: @"fb:explicitly_shared"];

    FBSDKShareOpenGraphContent *content = [[FBSDKShareOpenGraphContent alloc] init];
    
    
    
    
    //shareAPI.shareContent = content;
  //  [shareAPI share];
    taggedFriendsidlist=[[NSMutableArray alloc]init];
    taggedFriendsidlist =[[NSUserDefaults standardUserDefaults]objectForKey:@"tagfriends"];
    NSLog(@"received friendsid list===>%@",taggedFriendsidlist);
    content.peopleIDs = @[@"AaKJHV6ngHAQ1-wZVE3EK3RWAmTv--Or3Q2xVV34mQIoOJRNiXT7cAGnvTJ8lD5kp21_LQ5NtwKJ83P9SeRcHAfR9DcfW0yce1zm6cZ13x1_8Q"];//[taggedFriendsidlist copy];
    
    content.previewPropertyName = @"life";
    content.action = action;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     shareAPI.shareContent = content;
    
    
    

     // optionally set the delegate
    
    
    

     //share=0;
    shareAPI.delegate = self;
   
      [shareAPI share];*/
    NSURL *imageURL = [NSURL URLWithString:@"https://bmm.globusgames.com/assets/image/bmm_icon.png"];
    FBSDKSharePhoto *photo = [FBSDKSharePhoto photoWithImageURL:imageURL userGenerated:NO];

    NSDictionary *properties = @{
                                 @"og:type": @"brainmemorymaster:life",
                                 @"og:title": @"Request for a life",
                                 @"og:description":@"Hi friends, Please help me to clear this game with a life. Join it and give me a life please.",
                                @"og:image": @[photo]
                                 };
    FBSDKShareOpenGraphObject *object = [FBSDKShareOpenGraphObject objectWithProperties:properties];
    
    FBSDKShareOpenGraphAction *action = [[FBSDKShareOpenGraphAction alloc] init];
    action.actionType = @"brainmemorymaster:request";
    [action setString: @"true" forKey: @"fb:explicitly_shared"];
    [action setObject:object forKey:@"brainmemorymaster:life"];
    
    FBSDKShareOpenGraphContent *content = [[FBSDKShareOpenGraphContent alloc] init];
    content.action = action;
    content.previewPropertyName = @"brainmemorymaster:life";
    
    
    taggedFriendsidlist=[[NSMutableArray alloc]init];
    taggedFriendsidlist =[[NSUserDefaults standardUserDefaults]objectForKey:@"tagfriends"];
    NSLog(@"received friendsid list===>%@",taggedFriendsidlist);
    
    NSArray *arr=[[NSArray alloc]initWithArray:taggedFriendsidlist];
    
    content.peopleIDs = arr ;
    
   // content.peopleIDs=@[@"AaJWA_bxidFtBcxh-mbbZ2k4LVvoNDYuCxWSUa7sL5K1IJ4nE8VWp0GVSLtMD4h6TPwFfl-gR5djmesejm9uE3ki-SZa79Jnl9D8fw437LUCBw"];
   
    [FBSDKShareAPI shareWithContent:content delegate:self];
    
    
}
- (void)sharer:(id)sharer didFailWithError:(NSError *)error{
    
    if(error){
        NSLog(@"error------------>%@",error);
       // share=1;
        [SingletonClass sharedSingleton].tag=1;
    }
}
- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results{
    
    NSLog(@"result---->%@",results);
    if([SingletonClass sharedSingleton].tag!=1){
        
        
        int life=(int)taggedFriendsidlist.count/5;
        if(life>25){
            [SingletonClass sharedSingleton].life=5;
        }
        else{
        
            int a=[SingletonClass sharedSingleton].life+life;
            if(a<5){
                [SingletonClass sharedSingleton].life=a;
            }
            else{
                [SingletonClass sharedSingleton].life=5;
            }
            NSLog(@"life n=now after request------>%d",[SingletonClass sharedSingleton].life);
        }
        
        
    }
    else{
        
        NSLog(@"Error while tagged........");
    }
    

}

-(void)pushNotification{
    
    
}


@end
