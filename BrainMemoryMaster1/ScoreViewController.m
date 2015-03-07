//
//  ScoreViewController.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "ScoreViewController.h"
#import <Parse/Parse.h>

@interface ScoreViewController (){
    CGRect screenRect;
    int height1;
    int width1;
}

@end

@implementation ScoreViewController

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
    
    //previousScore=[SingletonClass sharedSingleton].Score;
    //1653836841510383
    //f0663657f4a2e3254c66c598fa6a1901
    
    
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
    
    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 120, 140)];
    [self.view addSubview:logo];
    self.view.backgroundColor=[UIColor blackColor];
    
    
    
    
    
    
    UILabel *ResultLabel=[[UILabel alloc]initWithFrame:CGRectMake(50,250*height1/480,width1-100,50*height1/480)];
    ResultLabel.backgroundColor=[UIColor clearColor];
    ResultLabel.textColor=[UIColor blackColor];
    ResultLabel.textAlignment=NSTextAlignmentCenter;
    ResultLabel.layer.shadowColor=[UIColor whiteColor].CGColor;
    ResultLabel.font=[UIFont boldSystemFontOfSize:width1/16];
    ResultLabel.layer.shadowOffset=CGSizeMake(6, 3);
    ResultLabel.layer.shadowOpacity=2.0f;
    //[self.view addSubview:ResultLabel];
    UIImageView *upImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 00, width1, height1)];
    if([SingletonClass sharedSingleton].Score<30){
         ResultLabel.text=@"Level Failed";
        upImg.image=[UIImage imageNamed:@"level_failed.png"];
    }
    else{
            ResultLabel.numberOfLines=2;
            ResultLabel.text=@"Level Successfully Completed";
        upImg.image=[UIImage imageNamed:@"level_complete.png"];
    }
    [self.view addSubview:upImg];
    
    
    
    UILabel *scoreLab=[[UILabel alloc]initWithFrame:CGRectMake(200*width1/320,40*height1/480,120*width1/320,40*height1/480)];
    scoreLab.backgroundColor=[UIColor clearColor];
    scoreLab.textColor=[UIColor blackColor];
    scoreLab.font=[UIFont boldSystemFontOfSize:width1/18];
    scoreLab.textAlignment=NSTextAlignmentCenter;
    scoreLab.layer.shadowColor=[UIColor whiteColor].CGColor;
    scoreLab.layer.shadowOffset=CGSizeMake(4, 2);
    scoreLab.layer.shadowOpacity=4.0f;
    
    //scoreLab.font=[UIFont boldSystemFontOfSize:16.0f];
    NSString *score=[NSString stringWithFormat:@"Score: %d",[SingletonClass sharedSingleton].Score];
    scoreLab.text=score;
    [self.view addSubview:scoreLab];
    
    
    UILabel *levelLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,40*height1/480,120*width1/320,40*height1/480)];
    levelLabel.backgroundColor=[UIColor clearColor];
    levelLabel.textColor=[UIColor blackColor];
    levelLabel.font=[UIFont boldSystemFontOfSize:width1/18];
    levelLabel.textAlignment=NSTextAlignmentCenter;
    levelLabel.layer.shadowColor=[UIColor whiteColor].CGColor;
    levelLabel.layer.shadowOffset=CGSizeMake(6, 3);
    levelLabel.layer.shadowOpacity=2.0f;
    
    [self.view addSubview:levelLabel];
    NSString *levelStr=[NSString stringWithFormat:@"Game: %d",(int)[SingletonClass sharedSingleton].level];
    levelLabel.text=levelStr;
    

    
    
    
    UIButton *menu=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    menu.frame=CGRectMake(40*width1/320, 330*height1/480,100*width1/320, 40*width1/320);
    menu.backgroundColor=[UIColor clearColor];
    menu.layer.cornerRadius=7.0f;
    menu.layer.shadowColor=[UIColor blackColor].CGColor;
    [menu setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    menu.layer.shadowOffset=CGSizeMake(5, 3);
    menu.titleLabel.font=[UIFont boldSystemFontOfSize:width1/18];
    menu.titleLabel.shadowOffset=CGSizeMake(2, 1);
    [menu setBackgroundImage:[UIImage imageNamed:@"manu_btn.png"] forState:UIControlStateNormal];
    menu.layer.shadowOpacity=2.0;
    [menu addTarget:self action:@selector(menuAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menu];
    
    
    
    UIButton *share=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    share.frame=CGRectMake(110*width1/320, 280*height1/480,100*width1/320, 40*width1/320);
    share.backgroundColor=[UIColor clearColor];
    share.layer.cornerRadius=7.0f;
    share.layer.shadowColor=[UIColor blackColor].CGColor;
    [share setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    share.layer.shadowOffset=CGSizeMake(5, 3);
    share.titleLabel.font=[UIFont boldSystemFontOfSize:width1/18];
    share.titleLabel.shadowOffset=CGSizeMake(2, 1);
    [share setBackgroundImage:[UIImage imageNamed:@"manu_btn.png"] forState:UIControlStateNormal];
    share.layer.shadowOpacity=2.0;
    [share addTarget:self action:@selector(shareOnFacebook) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:share];
   
    
    
    
    
    UIButton *retry=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    retry.frame=CGRectMake(180*width1/320, 330*height1/480,100*width1/320, 40*width1/320);
    retry.backgroundColor=[UIColor clearColor];
    retry.layer.cornerRadius=7.0f;
    [retry setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    retry.layer.shadowOffset=CGSizeMake(5, 3);
    retry.titleLabel.font=[UIFont boldSystemFontOfSize:width1/18];
    retry.titleLabel.shadowOffset=CGSizeMake(2, 1);
    
    retry.layer.shadowOpacity=2.0;

    retry.layer.shadowColor=[UIColor blackColor].CGColor;
    [retry addTarget:self action:@selector(PlayAction1:) forControlEvents:UIControlEventTouchUpInside];
    retry.titleLabel.textColor=[UIColor blackColor];
    [retry setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:retry];
    //if([SingletonClass sharedSingleton].Score<30){
        [retry setBackgroundImage:[UIImage imageNamed:@"retry_btn.png"] forState:UIControlStateNormal];

    
    
    NSString *levelScore=[NSString stringWithFormat:@"levelScore%d",[SingletonClass sharedSingleton].level];
    
    //NSInteger currentScore = [[NSUserDefaults standardUserDefaults] integerForKey:levelScore];
   
        if([SingletonClass sharedSingleton].fbStatus==1){
        PFQuery *query = [PFQuery queryWithClassName:@"BMMScore2"];
        [query whereKey:@"PlayerFBID" equalTo:[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
           
            PFObject *object = [objects objectAtIndex:0];
            NSLog(@"%@",object[levelScore]);
            int no=[object[levelScore]intValue];
            int no1=[[NSNumber numberWithInteger:[SingletonClass sharedSingleton].Score]intValue];
            //int n=[no intValue];
            //int n1=[no1 intValue ];
            if(no<no1){
             object[levelScore] = [NSNumber numberWithInteger:[SingletonClass sharedSingleton].Score];
            [object saveInBackground];
                [self notificationMethod];
            }
            
        }];
        }
        if([SingletonClass sharedSingleton].fbStatus==1){
            if([[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"]isEqualToString:[[NSUserDefaults standardUserDefaults]objectForKey:@"mainfbID"]]){
                if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:levelScore]){
                    [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:levelScore];
                }

            }
            
            
        }
        else{
            if([SingletonClass sharedSingleton].Score>[[NSUserDefaults standardUserDefaults] integerForKey:levelScore]){
                [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:levelScore];
            }

        }
    
    
//synchronize data
    if([SingletonClass sharedSingleton].networkStatus==true){
       if([[NSUserDefaults standardUserDefaults]integerForKey:@"onceLoggedin"]==1){
            PFQuery *query = [PFQuery queryWithClassName:@"BMMScore2"];
            [query whereKey:@"PlayerFBID" equalTo:[[NSUserDefaults standardUserDefaults]objectForKey:@"mainfbID"]];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                
                PFObject *object = [objects objectAtIndex:0];
                for(int i=1;i<=9;i++){
                    NSString *levelScore1=[NSString stringWithFormat:@"levelScore%d",i];
                    object[levelScore1] = [NSNumber numberWithInteger:[[NSUserDefaults standardUserDefaults]integerForKey:levelScore1]];
                    
                    }
                [object saveInBackground];

                
            }];
            
        }
        
    }
    
}




-(void)viewDidAppear:(BOOL)animated{
    
    UIImageView *star=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    star.backgroundColor=[UIColor brownColor];
    star.frame=CGRectMake(50, 100, 50, 50);
    UIImageView *star1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    star1.frame=CGRectMake(30, 110, 70, 70);
    [self.view addSubview:star1];
    
    [UIView animateWithDuration:.9 animations:^{
        
        star1.frame=CGRectMake(50, 100, 50, 50);
        
    }];

}


-(void)menuAction{
    [SingletonClass sharedSingleton].Score=0;
    [SingletonClass sharedSingleton].levelScore=0;
    [SingletonClass sharedSingleton].life=3;
    Levels *levelPlay=[[Levels alloc]initWithNibName:@"Levels" bundle:nil];
    [self presentViewController:levelPlay animated:YES completion:nil];
  
    
}










-(void)PlayAction1:(id)sender{
    

   
        [SingletonClass sharedSingleton].mainLevel=1;
        [SingletonClass sharedSingleton].Score=0;
        [SingletonClass sharedSingleton].levelScore=0;
        [SingletonClass sharedSingleton].life=5;
    
    if([SingletonClass sharedSingleton].level==2){
        PlayGamelevel2 *play=[[PlayGamelevel2 alloc]initWithNibName:@"PlayGamelevel2" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
    }
    else if([SingletonClass sharedSingleton].level==3){
        
        PlayGameLevel3 *play1=[[PlayGameLevel3 alloc]init];
        [self presentViewController:play1 animated:YES completion:nil];
    }
    else if([SingletonClass sharedSingleton].level==4){
        [SingletonClass sharedSingleton].noOfGame++;
        PlayGameLevel4 *play=[[PlayGameLevel4 alloc]initWithNibName:@"PlayGameLevel4" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
    }
    else if([SingletonClass sharedSingleton].level==5){
        
        [SingletonClass sharedSingleton].noOfGame++;
        PlayGameLevel5 *play=[[PlayGameLevel5 alloc]initWithNibName:@"PlayGameLevel5" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
        
    }
    else if([SingletonClass sharedSingleton].level==6){
        
        [SingletonClass sharedSingleton].noOfGame++;
        PlayGameLevel6 *play=[[PlayGameLevel6 alloc]initWithNibName:@"PlayGameLevel6" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
        
        
    }
    else if([SingletonClass sharedSingleton].level==7){
        
        [SingletonClass sharedSingleton].noOfGame++;
        
        PlayGameLevel7 *play=[[PlayGameLevel7 alloc]initWithNibName:@"PlayGameLevel7" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
        
        
        
    }
    else if([SingletonClass sharedSingleton].level==8){
        
        [SingletonClass sharedSingleton].noOfGame++;
        
        
        PlayLevel8 *play=[[PlayLevel8 alloc]initWithNibName:@"PlayLevel8" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
        
        
    }
    else if([SingletonClass sharedSingleton].level==9){
        
        [SingletonClass sharedSingleton].noOfGame++;
        Level9 *play=[[Level9 alloc]initWithNibName:@"Level9" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
        
        
    }
    
    else if([SingletonClass sharedSingleton].level==1){
        [SingletonClass sharedSingleton].noOfGame++;
        
        PlayGame *play=[[PlayGame alloc]initWithNibName:@"PlayGame" bundle:nil];
        [self presentViewController:play animated:YES completion:nil];
        
    }

  
}
#pragma mark-
#pragma notification methode.

-(void)notificationMethod{
    
    

    for(int i=0;i<[SingletonClass sharedSingleton].friendUsers.count;i++){
  
    NSDictionary *info=[[SingletonClass sharedSingleton].friendUsers objectAtIndex:i];
        NSLog(@"%d",[SingletonClass sharedSingleton].previousScoreOfCurrentPlayer);
        
    NSString *levelScore=[NSString stringWithFormat:@"levelScore%d",[SingletonClass sharedSingleton].level];
        NSLog(@"%@",[info objectForKey:levelScore]);
        if([[info objectForKey:levelScore] intValue]>[SingletonClass sharedSingleton].previousScoreOfCurrentPlayer){
            if([[info objectForKey:levelScore]intValue]<[SingletonClass sharedSingleton].Score){
                [self sendPush:info];
               
            }
            
        }
        
         
    }
    
    
}

-(void)sendPush:(NSDictionary*)info1{
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"FBID" equalTo:[info1 objectForKey:@"PlayerFBID"]];
    NSString *msg=[NSString stringWithFormat:@"%@ beated you in Game%d of Brain Memory Master",[[SingletonClass sharedSingleton].Player objectForKey:@"userName"],[SingletonClass sharedSingleton].level];
    [PFPush sendPushMessageToQueryInBackground:pushQuery
                                   withMessage:msg];
    
}




#pragma mark-
#pragma share methode.


-(void)shareOnFacebook{
    //---------------------------------------
    //NSLog(@"Messaga == %@",strPostMessage);
    NSString *strPostMessage = [NSString stringWithFormat:@"PLease Join me in Brain Memory Master"];
    //UIImage *my=[UIImage imageNamed:@"myImg.png"];
    NSMutableDictionary *params =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     strPostMessage, @"description",
     @"http://www.globussoft.com/", @"link",@"Brain Memory Master",@"name",
     @"http://i.imgur.com/LaDdDX0.png?1",@"picture",
     nil];
    //http://i.imgur.com/LaDdDX0.png?1
       [FBWebDialogs presentFeedDialogModallyWithSession:nil parameters:params handler:^(FBWebDialogResult result, NSURL *resultUrl, NSError *error){
        
        if (error) {
            NSLog(@"Error to post on facebook = %@", [error localizedDescription]);
        }
        else{
            
            NSLog(@"result==%u",result);
            //NSLog(@"Url==%@",resultUrl);
            if (result == FBWebDialogResultDialogNotCompleted) {
                NSLog(@"Error to post on facebook = %@", [error localizedDescription]);
                // NSLog(@"User cancel Request");
            }//End Result Check
            else{
                NSString *sss= [NSString stringWithFormat:@"%@",resultUrl];
                if ([sss rangeOfString:@"post_id"].location == NSNotFound) {
                    // NSLog(@"User Cancel Share");
                }
                else{
                    [self start];
                   NSLog(@"result==%u",result);
                    NSLog(@"posted on wall");
                }
            }
        }
    }];
}


-(void)start{
    
    [FBRequestConnection startForMeWithCompletionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error)
     {
         NSLog(@"facebook result: %@", result);
     }];
    
}







-(void)updateScoreSqlite:(NSInteger)ascore withScore:(NSInteger)alevel
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@",paths);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"GameScoreDb.sqlite"];
    sqlite3_stmt *inset_statement = NULL;
    NSString * keyLevel=[NSString stringWithFormat:@"%d",(int)alevel];
    NSString * keyScore=[NSString stringWithFormat:@"%d",(int)ascore];
    NSString * connectedFBid=[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"];
    
    NSLog(@"Exitsing data, Update Please");
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE GameScoreFinal set  Score = '%@', PlayerFbId = '%@' WHERE Level =%@",keyScore,connectedFBid,keyLevel];
    
    const char *update_stmt = [updateSQL UTF8String];
    if (sqlite3_open([databasePath UTF8String], &_databaseHandle)!=SQLITE_OK) {
        NSLog(@"Error to Open");
        return;
    }
    
    if (sqlite3_prepare_v2(_databaseHandle, update_stmt , -1,&inset_statement, NULL) != SQLITE_OK )
    {
        NSLog(@"%s Prepare failure '%s' (%1d)", __FUNCTION__, sqlite3_errmsg(_databaseHandle), sqlite3_errcode(_databaseHandle));
        NSLog(@"Error to Prepare");
        
    }
    if(sqlite3_step(inset_statement) == SQLITE_DONE) {
        //  UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
        //                                                          message:@"Data update"
        //                                                         delegate:nil
        //                                                cancelButtonTitle:@"OK"
        //                                                otherButtonTitles:nil];
        //  [message show];
        NSLog(@"Success");
    }
    //NSLog(@"%s Prepare failure '%s' (%1d)", __FUNCTION__, sqlite3_errmsg(_databaseHandle), sqlite3_errcode(_databaseHandle));
    sqlite3_finalize(inset_statement);
    sqlite3_close(_databaseHandle);
}


-(void)retriveScoreSqlite:(NSInteger)ascore withLevel:(NSInteger)alevel
{
    
    BOOL check_Update;
    check_Update=FALSE;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSLog(@"%@",paths);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"GameScoreDb.sqlite"];
    NSString * keyLevel=[NSString stringWithFormat:@"%d",(int)alevel];
    // Check to see if the database file already exists
    NSString * connectedFBid=[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"];
    NSString *query = [NSString stringWithFormat:@"select * from GameScoreFinal where PlayerFbId = \"%@\"",connectedFBid];
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
            NSString *strLevel= [NSString  stringWithUTF8String:level];
            
            NSString *strScore  = [NSString stringWithUTF8String:score];
            NSLog(@"Level %@ and Score %@ ",strLevel,strScore);
            if([strLevel isEqualToString:keyLevel])
            {
                check_Update=TRUE;
            }
            
        }
    }
    @catch(NSException *e)
    {
        NSLog(@"%@",e);
    }
    if(check_Update)
    {
        [self updateScoreSqlite:ascore withScore:alevel];
    }
    else
    {
        [self saveScoreSqlite:ascore withScore:alevel];
    }
    
}

-(void)saveScoreSqlite:(NSInteger)ascore withScore:(NSInteger)alevel
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@",paths);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"GameScoreDb.sqlite"];
    sqlite3_stmt *inset_statement = NULL;
    NSString * keyLevel=[NSString stringWithFormat:@"%d",[SingletonClass sharedSingleton].level];
    NSString * keyScore=[NSString stringWithFormat:@"%d",[SingletonClass sharedSingleton].Score];
    NSString * connectedFBid=[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"];
    if([SingletonClass sharedSingleton].fbStatus==0)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"Master" forKey:
         @"fbID"];
    }
    connectedFBid=[[NSUserDefaults standardUserDefaults]objectForKey:@"fbID"];
    NSString *insertSQL = [NSString stringWithFormat:
                           @"INSERT INTO GameScoreFinal (Game, Score,PlayerFbId) VALUES (\"%@\", \"%@\",\"%@\")",
                           keyLevel,
                           keyScore,connectedFBid
                           ];
    
    const char *insert_stmt = [insertSQL UTF8String];
    if (sqlite3_open([databasePath UTF8String], &_databaseHandle)!=SQLITE_OK) {
        NSLog(@"Error to Open");
        return;
    }
    
    if (sqlite3_prepare_v2(_databaseHandle, insert_stmt , -1,&inset_statement, NULL) != SQLITE_OK ) {
        NSLog(@"%s Prepare failure '%s' (%1d)", __FUNCTION__, sqlite3_errmsg(_databaseHandle), sqlite3_errcode(_databaseHandle));
        NSLog(@"Error to Prepare");
        
    }
    
    if(sqlite3_step(inset_statement) == SQLITE_DONE) {
        // UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
        //                                                          message:@"Data Saved"
        //                                                         delegate:nil
        //                                                cancelButtonTitle:@"OK"
        //                                                otherButtonTitles:nil];
        // [message show];
        NSLog(@"Success");
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
