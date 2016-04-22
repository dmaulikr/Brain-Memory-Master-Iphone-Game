//
//  ScoreViewController.m
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "ScoreViewController.h"
#import <Bolts/Bolts.h>

@interface ScoreViewController (){
    CGRect screenRect;
    int height1;
    int width1;
    PFObject *gameScore,*gameScore1;
    int update,sqliteupdate;
     int scr;
    NSString *fbid;
    NSString *fbname;
    NSMutableArray *bfriendlist;
    NSUserDefaults *highscoredefault;
    NSUserDefaults *highscoregame;
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
    
    //--------------------
    
    if([SingletonClass sharedSingleton].Score!=0)
    [self facebukshare];
    //---------------------
    
    
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
    
    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 120, 140)];
    [self.view addSubview:logo];
    self.view.backgroundColor=[UIColor blackColor];
    
    
    
    
    
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
    NSString *levelStr=[NSString stringWithFormat:@"level: %d",(int)[SingletonClass sharedSingleton].level];
    levelLabel.text=levelStr;
    
    
    
    
    
    
    
    UILabel *ResultLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,330*height1/480,width1,30*height1/480)];
    ResultLabel.backgroundColor=[UIColor clearColor];
    ResultLabel.textColor=[UIColor blackColor];
    ResultLabel.textAlignment=NSTextAlignmentCenter;
    ResultLabel.layer.shadowColor=[UIColor whiteColor].CGColor;
    ResultLabel.font=[UIFont boldSystemFontOfSize:width1/16];
    ResultLabel.layer.shadowOffset=CGSizeMake(6, 3);
    ResultLabel.layer.shadowOpacity=2.0f;
    [self.view addSubview:ResultLabel];
    // ResultLabel.text=@"Level Failed";
    if([SingletonClass sharedSingleton].Score<30){
         ResultLabel.text=@"Level Failed";
    }
    else{
        if([SingletonClass sharedSingleton].level==9){
            
        ResultLabel.text=@"successfully completed all levels";
        }
        else{
            ResultLabel.text=@"Level Successfully Completed";
        }
        
    }
    
    
    UIButton *menu=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    menu.frame=CGRectMake(20*width1/320, 380*height1/480,120*width1/320, 35*height1/480);
    menu.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
    menu.layer.cornerRadius=7.0f;
    [menu setTitle:@"Menu" forState:UIControlStateNormal];
    menu.layer.shadowColor=[UIColor blackColor].CGColor;
    [menu setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    menu.layer.shadowOffset=CGSizeMake(5, 3);
    menu.titleLabel.font=[UIFont boldSystemFontOfSize:width1/18];
    menu.titleLabel.shadowOffset=CGSizeMake(2, 1);
    menu.titleLabel.textColor=[UIColor blackColor];
    menu.layer.shadowOpacity=2.0;
    menu.layer.shadowColor=[UIColor blackColor].CGColor;
    [menu addTarget:self action:@selector(menuAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menu];
    

   
    
    
    
    
    
    //self.view.backgroundColor=[UIColor blackColor];
    UIButton *retry=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    retry.frame=CGRectMake(180*width1/320, 380*height1/480,120*width1/320, 35*height1/480);
    retry.backgroundColor=[UIColor colorWithRed:(CGFloat)50/255 green:(CGFloat)50/255 blue:(CGFloat)50/255 alpha:1];
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
    if([SingletonClass sharedSingleton].Score<30){
        [retry setTitle:@"Retry" forState:UIControlStateNormal];
    }
    else{
        if([SingletonClass sharedSingleton].level==9){
            retry.hidden=YES;
            menu.frame=CGRectMake(100*width1/320, 380*height1/480,120*width1/320, 35*height1/480);

        }
        else{
            [retry setTitle:@"Next Level" forState:UIControlStateNormal];
        }
        
    }
    
    
    
    
    NSString *levelScore=[NSString stringWithFormat:@"levelScore%d%d",[SingletonClass sharedSingleton].mainLevel,[SingletonClass sharedSingleton].level];
    
    NSInteger currentScore = [[NSUserDefaults standardUserDefaults] integerForKey:levelScore];
    if([SingletonClass sharedSingleton].Score>currentScore){
        [[NSUserDefaults standardUserDefaults] setInteger:[SingletonClass sharedSingleton].Score forKey:levelScore];
    }
    
    
   
 
    
}



-(void)viewDidAppear:(BOOL)animated{
    
    UIImageView *star=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    star.backgroundColor=[UIColor brownColor];
    star.frame=CGRectMake(50, 100, 50, 50);
    //[self.view addSubview:star];
    
    
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
   
    mainLevel *levelPlay=[[mainLevel alloc]initWithNibName:@"mainLevel" bundle:nil];
    [self presentViewController:levelPlay animated:YES completion:nil];
  
    
}






-(void)PlayAction1:(id)sender{
    if([SingletonClass sharedSingleton].Score<30){
        [SingletonClass sharedSingleton].level--;
    }

   
        [SingletonClass sharedSingleton].level++;
        [SingletonClass sharedSingleton].Score=0;
        [SingletonClass sharedSingleton].levelScore=0;
        //[SingletonClass sharedSingleton].life=3;
    
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

  


-(void)facebukshare{
     update=0;
    sqliteupdate=0;
    
    
    NSUserDefaults *firsttimeagn= [NSUserDefaults standardUserDefaults];
    [firsttimeagn setInteger:2 forKey:@"firsttimeuser"];
    [firsttimeagn synchronize];
    NSLog( @"%d",[firsttimeagn synchronize]);
    

    
    
    
    
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPaths[0];
    NSString *datapath=[[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"brain2.sqlite"]];
    NSLog(@">>>>>>>>>>>>%@",datapath);
    
    NSFileManager *filemgr=[NSFileManager defaultManager];
    if([filemgr fileExistsAtPath:datapath]==NO)
    {
        const char *dbpath=[datapath UTF8String];//converting from nsstring type to c type
        if(sqlite3_open(dbpath, &DB)==SQLITE_OK){
            char *errorMessage;
            const char *sql_statment="CREATE TABLE IF NOT EXISTS users( ID INTEGER PRIMARY KEY AUTOINCREMENT, Game INTEGER, Score TEXT,PlayerFacebookID TEXT,Username TEXT )";
            if(sqlite3_exec(DB, sql_statment, NULL, NULL, &errorMessage)!=SQLITE_OK)
            {
                NSLog(@"Error!!");
            }
        }
        
        NSLog(@"%s",sqlite3_errmsg(DB));
        sqlite3_close(DB);
        
        
    }
    
    
    
    
    
     gameScore = [PFObject objectWithClassName:parseClass];
    
 fbid =[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookid"];
    NSLog(@"idfacebook==%@",fbid);
 fbname=[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookname"];
    NSLog(@"namefacebook==%@",fbname);
    NSLog(@"level====%d",[SingletonClass sharedSingleton].level);
     NSLog(@"score====%d",[SingletonClass sharedSingleton].Score);
    
   BOOL  connection=[[NSUserDefaults standardUserDefaults]objectForKey:@"ConnectionAvilable"];
    NSLog(@"connection net===%d",connection);
    
    
    if(fbid==nil||connection==NO){
        
        
        
        
        
        //storing in local data base
        
        
        NSString *docsDir1;
        NSArray *dirPaths1;
        sqlite3_stmt *statement;
        dirPaths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docsDir1=dirPaths[0];
        NSString *datapath1=[[NSString alloc]initWithString:[docsDir1 stringByAppendingPathComponent:@"brain2.sqlite"]];
        NSLog(@"%@",datapath1);
        const char *dbpath1=[datapath1 UTF8String];
        
        
        
        //TO SELECT AND THEN UPDATE
        if(sqlite3_open(dbpath1,&DB)==SQLITE_OK)
        {
            NSString *selectSQL=[NSString stringWithFormat:@"SELECT Score from users WHERE Game=\"%d\"", [SingletonClass sharedSingleton].level];
            const char *select_statement=[selectSQL UTF8String];
            sqlite3_prepare_v2(DB, select_statement, -1, &statement, NULL);
            
            
            if(sqlite3_step(statement)==SQLITE_ROW)
            {
                
                
                
                
                  NSString *retrivedscore=[[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(statement, 0)];
                
                int rscore=[retrivedscore intValue];
               
                
                NSLog(@"integer format===== %d",rscore);
                if( [SingletonClass sharedSingleton].Score>rscore)
                    
                {
                    NSLog(@"update");
                    sqliteupdate=1;
                }
                else{
                    NSLog(@"donnot update");
                    sqliteupdate=2;
                }
                

                
                sqlite3_close(DB);
                sqlite3_finalize(statement);
                
            }
            else{
                NSLog(@"empty.........");
                
                sqlite3_close(DB);
                sqlite3_finalize(statement);
            }
            
        }
        else
        {
              NSLog(@"%s",sqlite3_errmsg(DB));
            sqlite3_close(DB);
            
            }
    
    
        
//-------------update---------------
        
        

        if(sqliteupdate==1){
            NSString *docsDir2;
            NSArray *dirPaths2;
            //sqlite3_stmt *statement1;
            dirPaths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            docsDir2=dirPaths[0];
            NSString *datapath2=[[NSString alloc]initWithString:[docsDir2 stringByAppendingPathComponent:@"brain2.sqlite"]];
            NSLog(@"%@",datapath2);
            const char *dbpath2=[datapath2 UTF8String];

            
            
            char *err;
            //const char *dbpath2=[datapath1 UTF8String];
            
            if(sqlite3_open(dbpath2,&DB)==SQLITE_OK){
                NSString *updateSQL=[NSString stringWithFormat:@"UPDATE  users set Score=\"%d\" WHERE Game=\"%d\"",[SingletonClass sharedSingleton].Score,[SingletonClass sharedSingleton].level];
                const char *update_statement=[updateSQL UTF8String];
                if(sqlite3_exec(DB, update_statement, NULL, NULL, &err)==SQLITE_OK)
                    
                    NSLog(@"updatedddd.............");
                
                else{
                    
                    NSLog(@"%s",sqlite3_errmsg(DB));
                   
                }
                sqlite3_close(DB);
                
            }
            

            
            
        }
        
        
        if(sqliteupdate==0){
        
        
        NSString *docsDir3;
        NSArray *dirPaths3;
        //sqlite3_stmt *statement;
        dirPaths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docsDir3=dirPaths[0];
        NSString *datapath3=[[NSString alloc]initWithString:[docsDir1 stringByAppendingPathComponent:@"brain2.sqlite"]];
        NSLog(@"%@",datapath3);
        const char *dbpath3=[datapath3 UTF8String];

      
        
          sqlite3_stmt *stat;
        if(sqlite3_open(dbpath3, &DB)==SQLITE_OK)
        {
            NSString *insertSQL=[NSString stringWithFormat:@"INSERT INTO users (Game,Score,PlayerFacebookID,Username) VALUES (\"%d\",\"%d\",\"%s\",\"%s\")",[SingletonClass sharedSingleton].level,[SingletonClass sharedSingleton].Score,"master","master"];
            
            
            const char *insert_statement=[insertSQL UTF8String];
            sqlite3_prepare_v2(DB,insert_statement ,-1, &stat, NULL);
                        if(sqlite3_step(stat)==SQLITE_DONE)
            {
                NSLog(@"Inserted....  ");
                
            }
            else
            {
                NSLog(@"%s",sqlite3_errmsg(DB));
            }
            
            
            
            sqlite3_finalize(stat);
            sqlite3_close(DB);
            
            
            
    }
        }
        
    

        
        
        
        
            NSLog(@"Not logged in with facebook");
}
    else{
       
        
        PFQuery *query = [PFQuery queryWithClassName:parseClass];
        //check if already present
        [query whereKey:playerFbId equalTo:fbid];
        [query whereKey:gameLevel equalTo:@([SingletonClass sharedSingleton].level)];
       [query orderByDescending:playerScore];
        
        
        
        
        
        //-----------------fetch datas from local data base---------------------------
        
        
        
        
        
        
        
        
        
        
        
        

      
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
                if(objects.count==0){
                    
                    
                    
                    
                    
                    
                    
                    
                    
                  //if([SingletonClass sharedSingleton].Score!=0){
                       gameScore[playerFbId] = fbid;
                    gameScore[playerName] = fbname;
                    gameScore[gameLevel] =@([SingletonClass sharedSingleton].level);
                    gameScore[playerScore]=@([SingletonClass sharedSingleton].Score);
                //}
                    //[gameScore saveEventually];
                   // NSLog(@"saved");
                   [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if (succeeded) {
                            NSLog(@"saved");
                            [self retrievePlayerInfo];
                            [self checkHighScore];
                            [self checkBeatFriends];
                            
                            // The object has been saved.
                        } else {
                            // There was a problem, check error.description
                        }
                    }];

                    
                    
                    
                    
                    
                                    }
                

                
                // Do something with the found objects
                else{
                for (PFObject *object in objects) {
                    
                    int old=[object[playerScore] intValue];
                    NSLog(@"integer %d",old);

                    
                    
                    NSLog(@"level==%@",object[gameLevel]);
                    
                    NSLog(@"score==%@",object[playerScore]);
                    NSLog(@"no of object==%@", object.objectId);
                    NSLog(@"now score==%d",[SingletonClass sharedSingleton].Score);
                    
                   
                    

                    
                    if([SingletonClass sharedSingleton].Score> old)
                        
                    {
                        PFQuery *query1 = [PFQuery queryWithClassName:parseClass];
                        
                        [query1 getObjectInBackgroundWithId:object.objectId
                                                     block:^(PFObject *gameScore, NSError *error) {
                     gameScore[playerScore]=@([SingletonClass sharedSingleton].Score);
                        [gameScore saveInBackground];
                                                         
                                                         [self retrievePlayerInfo];
                                                         [self checkHighScore];
                                                         [self checkBeatFriends];
                                                         
                                                         
                                                         
                        NSLog(@"changedscore==%@",object[playerScore]);
                                                     }];
                    }
                }
                }
            }
            
                
             else   {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
                    }
                
        }];
        
         
         
         
         
        
        
        
         
         
    }

}

-(void)retrievePlayerInfo{
    PFQuery *query1 = [PFQuery queryWithClassName:parseClass];
    //check if already present
    [query1 whereKey:playerFbId equalTo:fbid];
    [query1 whereKey:gameLevel equalTo:@([SingletonClass sharedSingleton].level)];
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            if(objects.count==0){
                
                
                
                
                /*NSLog(@"my score in poarese====%@",object[@"userscore"]);
                NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
                [defaults setObject:object[@"userscore"] forKey:@"myscoreparse"];
                [defaults synchronize];
                NSLog( @"%d",[defaults synchronize]);
                */
                
                
                
                
                
                
                
                
            }
            
            
            
            // Do something with the found objects
            else{
                for (PFObject *object in objects) {
                    NSLog(@"enteringggg");
                   
                    //int myscore=[object[@"userscore"] intValue];
                   
                    NSLog(@"my score in poarese====%@",object[playerScore]);
                  
                    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
                    [defaults setObject:object[playerScore] forKey:@"myscoreparse"];
                    [defaults synchronize];
                    NSLog( @"%d",[defaults synchronize]);
                    

                    
                    
                                  }
        }
        }
        
        
        else   {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
    
     
    }];
    
    
    
    
    
    
    
    
    
    






}




-(void)checkHighScore{
    
    
   
highscoredefault= [NSUserDefaults standardUserDefaults];
highscoregame= [NSUserDefaults standardUserDefaults];
   
    if([FBSDKAccessToken currentAccessToken])
    {
    
    
    
     PFQuery *query = [PFQuery queryWithClassName:parseClass];
    NSMutableArray *fbid1 =[[NSUserDefaults standardUserDefaults]objectForKey:@"fbfriendids"];
        NSLog(@"ids of friends.....%@",fbid1);
    
    [query whereKey:gameLevel equalTo:@([SingletonClass sharedSingleton].level)];
    
    [query whereKey:playerFbId containedIn:fbid1 ];
    
    [query orderByDescending:playerScore];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                if(objects.count==0){
                
                
                
                
                
                
                
                
                    NSLog(@"no friends play this");
                
                    
                
                
                
                
            }
                
                
                
                // Do something with the found objects
            else{
                for (PFObject *object in objects) {
                    NSString *myparsescore =[[NSUserDefaults standardUserDefaults]objectForKey:@"myscoreparse"];
                    int myscore=[myparsescore intValue];
                    
                    int highscore=[object[playerScore] intValue];
                    NSLog(@"high score among friends is-------integer %d",highscore);
                    
                    NSString *fname=object[playerScore];
                                        NSLog(@"high score among friends name is-------integer %@",fname);
                    if(myscore>=highscore)
                        
                        
                        
                    {
                       
                        
                        
                        [highscoredefault setObject:object[gameLevel] forKey:@"facebookhighscoregame"];
                        [highscoredefault synchronize];

                        
                       
                        [highscoredefault setObject:myparsescore forKey:@"facebookhighscore"];
                        [highscoredefault synchronize];
                        
                        FirstAppDelegate *appdelegate=[UIApplication sharedApplication].delegate;
                        [appdelegate poostObjectGraph ];
                        
                    }
                    
                    
                    
                    
                    break;
                    
                    }
            }
            }
            
            
            else   {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            
        }];
        
        


        
        
        
        
    

    }
    
    
}
-(void)checkBeatFriends{
    
    
    
    
    if([FBSDKAccessToken currentAccessToken])
    
    {
        bfriendlist=[[NSMutableArray alloc]init];
        
        PFQuery *query = [PFQuery queryWithClassName:parseClass];
        NSMutableArray *fbid1 =[[NSUserDefaults standardUserDefaults]objectForKey:@"fbfriendids"];
        NSLog(@"ids of friends.....%@",fbid1);
        
        [query whereKey:gameLevel equalTo:@([SingletonClass sharedSingleton].level)];
        
        [query whereKey:playerFbId containedIn:fbid1 ];
        
        [query orderByDescending:playerScore];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                if(objects.count==0){
                    
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"no friends play this");
                    
                    
                    
                    
                    
                    
                }
                
                
                
                // Do something with the found objects
                else{
                    for (PFObject *object in objects)
                    {
                        NSString *myparsescore =[[NSUserDefaults standardUserDefaults]objectForKey:@"myscoreparse"];
                        int myscore=[myparsescore intValue];
                        
                        //int highscore=[object[@"playerScore"] intValue];
                       // NSLog(@"high score among friends is-------integer %d",highscore);
                        
                        NSString *fname=object[playerScore];
                        int friendscore=[object[playerScore] intValue];
                        
                        NSString *friends=object[playerName];
                        
                        NSString *friendsId=object[playerFbId];
                        

                        
                        NSLog(@"high score among friends name is-------integer %@",fname);
                        if(myscore>friendscore)
                            
                            
                        {
                            
                            
                            [highscoredefault setObject:object[gameLevel] forKey:@"facebookhighscoregame"];
                            [highscoredefault synchronize];
                            
                            
                            
                            [highscoredefault setObject:myparsescore forKey:@"facebookhighscore"];
                            [highscoredefault synchronize];

                            
                            
                            
                            
                           
                            NSLog(@"beat fgriend score======%d",friendscore);
                            NSUserDefaults *defaults1= [NSUserDefaults standardUserDefaults];
                            [defaults1 setObject:friends forKey:@"tagbeatfriends"];
                            [defaults1 synchronize];
                            
                            
                            [[NSUserDefaults standardUserDefaults]setObject:friendsId forKey:@"friendsFId"];
                            [[NSUserDefaults standardUserDefaults]synchronize];
                            
                            NSLog( @"%d",[defaults1 synchronize]);
                            
                            
                            FirstAppDelegate *appdelegate=[UIApplication sharedApplication].delegate;
                            [appdelegate beatFriend ];
                            
                        }
                        
                        
                        
                        
                       
                        
                    }
                }
            }
            
            
            else   {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
                    }
            
        }];
        
        
        
        
        
        
        
    }
    
        
    

    
    
    
    
    
    
}


-(void)didReceiveMemoryWarning
    {
                    [super didReceiveMemoryWarning];
                    // Dispose of any resources that can be recreated.
    }










@end
