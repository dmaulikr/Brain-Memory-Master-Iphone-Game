//
//  game2.m
//  BrainMemoryMaster1
//
//  Created by GLB-163 on 7/30/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "game2.h"
#import "SDWebImage/UIImageView+WebCache.h"


@interface game2 (){
    CGRect screenRect;
    int height1;
    int width1;
    int x,y,z;
    PFObject *gameScore;
    int local,rscore4,intfirst;
    NSString *fbid;
    NSUserDefaults *sq;
    NSString *sqlitedatas;
    GADBannerView *bannerView;


}


@end

@implementation game2

- (void)viewDidLoad {
    [super viewDidLoad];
    bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    
    // Specify the ad's "unit identifier". This is your publisher ID.
    bannerView.adUnitID = bannerId;
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView.rootViewController = self;
    //    [self.view addSubview:bannerView];
    //
    //    // Initiate a generic request to load it with an ad.
    [bannerView loadRequest:[GADRequest request]];
    
    bannerView.delegate=self;

    local=0;
    screenRect = [[UIScreen mainScreen] bounds];
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width1, height1)];
    //not requird
    //*******
    
    if((width1==320)&&(height1==480)){
        backImg.image=[UIImage imageNamed:@"Login_bg1.png"];
    }
    
    else if((width1==320)&&(height1==568)){
        backImg.image=[UIImage imageNamed:@"Login_bg1.png"];
    }
    else if((width1==375)&&(height1=667)){
        backImg.image=[UIImage imageNamed:@"Login_bg1.png"];
    }
    else if((width1>=414 && height1>=736)){
        backImg.image=[UIImage imageNamed:@"Login_bg6+.png"];
    }
    else if((width1>800)&&(height1>1700)){
        backImg.image=[UIImage imageNamed:@"Login_bg.png"];
    }
    //*******
    
   
    [self.view addSubview:backImg];
    
    
    
    
    UIButton *beginner=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(height1==568&&width1==320)
        beginner.frame=CGRectMake(width1/4-20,height1/4+40+height1/10+height1/10,width1/2+40, height1/10);
    else if(height1==480&&width1==320)
        beginner.frame=CGRectMake(width1/4-20,height1/4+40+height1/10+height1/10+15,width1/2+40, height1/10);
    else if (width1==375&&height1==667){
    beginner.frame=CGRectMake(width1/4-20,height1/4+40+height1/10+height1/10+15,width1/2+40, height1/10);
       
    }else if(width1>=414 && height1>=736){
            beginner.frame=CGRectMake(width1/2-110,height1-320,200, height1/10);
        }
    
    beginner.backgroundColor=[UIColor clearColor];
    beginner.layer.cornerRadius=7.0f;
    
    beginner.layer.shadowColor=[UIColor blackColor].CGColor;
    
    [beginner.layer setShadowOpacity:0.8];
    [beginner.layer setShadowOffset:CGSizeMake(2.0, 1.0)];
    
    
    
    
    
    
    
    
    
    [beginner setBackgroundImage:[UIImage imageNamed:@"play_btn.png"] forState:UIControlStateNormal];
    [beginner addTarget:self action:@selector(beginnersAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginner];
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width1==320){
        back.frame=CGRectMake(10*width1/320, (width1/15)+12,34*width1/320,20*height1/480);
    }
    else{
        back.frame=CGRectMake(10*width1/320, (width1/15),34*width1/320,20*height1/480);
    }
    back.backgroundColor=[UIColor clearColor];
    back.titleLabel.font=[UIFont systemFontOfSize:width1/20];
    [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    
    back.titleLabel.textAlignment=NSTextAlignmentLeft;
    [back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    UIImageView *imageHolder=[[UIImageView alloc]init];
    if(width1==320&&height1==480){
        imageHolder.frame=CGRectMake(width1/2-40, width1/2+175,34*width1/320,20*height1/480);
        
    }
    else if(width1==320&&height1==568){
        imageHolder.frame=CGRectMake(width1/2-40, width1/2+210,34*width1/320,20*height1/480);
    }
    else if(width1==375&&height1==667){
        imageHolder.frame=CGRectMake(width1/2-40, width1/2+250,60,60);
    }
    else if(width1>=414&&height1>=736){
        imageHolder.frame=CGRectMake(width1/2-80, height1-235,135,135);
    }


    if(width1>=414 && height1>=736){
        
        if([SingletonClass sharedSingleton].level==1){
            imageHolder.image=[UIImage imageNamed:@"identity_sequence6+.png"];
        }
        else if ([SingletonClass sharedSingleton].level==2){
            imageHolder.image=[UIImage imageNamed:@"color_identity6+.png"];
            
        }
        else if ([SingletonClass sharedSingleton].level==3){
            imageHolder.image=[UIImage imageNamed:@"face_identity6+.png"];
            
        }
        else if ([SingletonClass sharedSingleton].level==4){
            imageHolder.image=[UIImage imageNamed:@"slightly_different_cell6+.png"];
            
        }
        else if ([SingletonClass sharedSingleton].level==5){
            imageHolder.image=[UIImage imageNamed:@"letter_missing6+.png"];
            
        }
        else if ([SingletonClass sharedSingleton].level==6){
            imageHolder.image=[UIImage imageNamed:@"red_blue_cell6+.png"];
            
        }
        else if ([SingletonClass sharedSingleton].level==7){
            imageHolder.image=[UIImage imageNamed:@"identity_sequence6+.png"];
            
        }
        else if ([SingletonClass sharedSingleton].level==8){
            imageHolder.image=[UIImage imageNamed:@"diffrent_smily6+.png"];
            
        }
        else if ([SingletonClass sharedSingleton].level==9){
            imageHolder.image=[UIImage imageNamed:@"color_pair6+.png"];
            
        }
        
    }
    else{
    
    if([SingletonClass sharedSingleton].level==1){
    imageHolder.image=[UIImage imageNamed:@"identity_sequenceabc.png"];
    }
    else if([SingletonClass sharedSingleton].level==2){
        imageHolder.image=[UIImage imageNamed:@"color_identity.png"];
    }
    else if([SingletonClass sharedSingleton].level==3){
        imageHolder.image=[UIImage imageNamed:@"face_identity.png"];
    }
    
    else if([SingletonClass sharedSingleton].level==4){
        imageHolder.image=[UIImage imageNamed:@"slightly_different_cell.png"];
    }
    
    else if([SingletonClass sharedSingleton].level==5){
        imageHolder.image=[UIImage imageNamed:@"letter_missing.png"];
    }
    
    else if([SingletonClass sharedSingleton].level==6){
        imageHolder.image=[UIImage imageNamed:@"red_blue_cell.png"];
    }
    
    else if([SingletonClass sharedSingleton].level==7){
        imageHolder.image=[UIImage imageNamed:@"identity_sequence copy 3.png"];
    }
    else if([SingletonClass sharedSingleton].level==8){
        imageHolder.image=[UIImage imageNamed:@"diffrent_smily.png"];
    }
    else if([SingletonClass sharedSingleton].level==9){
        imageHolder.image=[UIImage imageNamed:@"color_pair.png"];
    }

    
  }
    
    
    [imageHolder setContentMode:UIViewContentModeScaleAspectFit];
    
    if(!(width1>=414&&height1>=736)){
    [imageHolder sizeToFit];
    }
    
    [self.view addSubview:imageHolder];
    
    
    
    
    fbid =[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookid"];
    
    NSString* checkfirsttym=[[NSUserDefaults standardUserDefaults]objectForKey:@"firsttimeuser"];
    
    
    intfirst=[checkfirsttym intValue];
    
    if(fbid!=nil && intfirst!=1){
        [self sync];
        
        [self deletedatabase];
        
    }

    [self playerrank];
    
    

    

    // Do any additional setup after loading the view.
}
- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
    //[UIView beginAnimations:@"BannerSlide" context:nil];
    if(width1>=375&&height1>=667){
        bannerView.frame = CGRectMake(0,
                                      self.view.frame.size.height -
                                      bannerView.frame.size.height,
                                      width1,
                                      60);
        
        
    }
    else{
        
        bannerView.frame = CGRectMake(0,
                                      self.view.frame.size.height -
                                      bannerView.frame.size.height,
                                      bannerView.frame.size.width,
                                      bannerView.frame.size.height);
        
    }
    // [UIView commitAnimations];
    [self.view addSubview:bannerView];
    NSLog(@"called====");
}
- (void)adView:(GADBannerView *)bannerView
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError:%@", [error localizedDescription]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)beginnersAction{
    
    
    
    if([SingletonClass sharedSingleton].level==1){
    PlayGame *play1=[[PlayGame alloc]init];
    play1.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:play1 animated:YES completion:nil];
    }
    else if([SingletonClass sharedSingleton].level==2){
    PlayGamelevel2 *play2=[[PlayGamelevel2 alloc]init];
        play2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play2 animated:YES completion:nil];
    }
    else if([SingletonClass sharedSingleton].level==3){
        PlayGameLevel3 *play3=[[PlayGameLevel3 alloc]init];
        play3.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play3 animated:YES completion:nil];
    }

    else if([SingletonClass sharedSingleton].level==4){
        PlayGameLevel4 *play4=[[PlayGameLevel4 alloc]init];
        play4.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play4 animated:YES completion:nil];
    }

    else if([SingletonClass sharedSingleton].level==5){
        PlayGameLevel5 *play5=[[PlayGameLevel5 alloc]init];
        play5.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play5 animated:YES completion:nil];
    }

    else if([SingletonClass sharedSingleton].level==6){
        PlayGameLevel6 *play6=[[PlayGameLevel6 alloc]init];
        play6.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play6 animated:YES completion:nil];
    }

    else if([SingletonClass sharedSingleton].level==7){
        PlayGameLevel7 *play7=[[PlayGameLevel7 alloc]init];
        play7.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play7 animated:YES completion:nil];
    }

    else if([SingletonClass sharedSingleton].level==8){
        PlayLevel8 *play8=[[PlayLevel8 alloc]init];
        play8.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play8 animated:YES completion:nil];
    }
    else if([SingletonClass sharedSingleton].level==9){
        Level9 *play9=[[Level9 alloc]init];
        play9.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:play9 animated:YES completion:nil];
    }


    
    
}
-(void)back{
    Levels *l=[[Levels alloc]init];
    l.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    //----------------------------------------------------
    //-----------------------------------------------------
    [self presentViewController:l animated:YES completion:nil];
    
    
    
    
}



-(void)sync{
    
    
    
    
    
    NSString *docsDir4;
    NSArray *dirPaths4;
    sqlite3_stmt *statement4;
    dirPaths4=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir4=dirPaths4[0];
    NSString *datapath4=[[NSString alloc]initWithString:[docsDir4 stringByAppendingPathComponent:@"brain2.sqlite"]];
    NSLog(@"%@",datapath4);
    const char *dbpath4=[datapath4 UTF8String];
    
    
    
    
    if(sqlite3_open(dbpath4,&DB)==SQLITE_OK)
    {
        NSString *selectSQL4=[NSString stringWithFormat:@"SELECT Score from users WHERE Game=\"%d\"", [SingletonClass sharedSingleton].level];
        const char *select_statement4=[selectSQL4 UTF8String];
        sqlite3_prepare_v2(DB, select_statement4, -1, &statement4, NULL);
        
        
        if(sqlite3_step(statement4)==SQLITE_ROW)
        {
            
            local=1;
            
            
            NSString *retrivedscore=[[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(statement4, 0)];
            
            sq=[NSUserDefaults standardUserDefaults];
            [sq setObject:retrivedscore forKey:@"sqlitedata"];
            [sq synchronize];
            NSLog(@"defaultres===%d",[sq synchronize]);

            /*  if(rscore4>[SingletonClass sharedSingleton].Score){
             scr=rscore4;
             }
             else{
             scr=[SingletonClass sharedSingleton].Score;
             }*/
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            sqlite3_close(DB);
            sqlite3_finalize(statement4);
            
            
            
            
            
            
            
            
            
            
        }
        else{
            NSLog(@"empty.........");
            // scr=[SingletonClass sharedSingleton].Score;
            
            sqlite3_close(DB);
            sqlite3_finalize(statement4);
        }
        
    }
    else
    {
        NSLog(@"%s",sqlite3_errmsg(DB));
        sqlite3_close(DB);
        
    }
    
    
    
    
    //----------------------------------------------------------------------------
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if(local==1){
        sqlitedatas=[[NSUserDefaults standardUserDefaults] valueForKey:@"sqlitedata"];
        NSLog(@"=====defaulttttt%@",sqlitedatas);
        rscore4=[sqlitedatas intValue];
        
        
        
        NSLog(@"integer format===== %d",rscore4);
        
        
        
        gameScore = [PFObject objectWithClassName:parseClass];
        NSString *fbname =[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookname"];
        
        NSLog(@"facebookid===%@",fbid);
        PFQuery *query = [PFQuery queryWithClassName:parseClass];
        //check if already present
        [query whereKey:playerFbId equalTo:fbid];
        [query whereKey:gameLevel equalTo:@([SingletonClass sharedSingleton].level)];
        [query orderByDescending:playerScore];
        
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
                if(objects.count==0){
                    
                    
                    
                    
                    gameScore[playerFbId] = fbid;
                    gameScore[playerName] = fbname;
                    gameScore[gameLevel] =@([SingletonClass sharedSingleton].level);
                    gameScore[playerScore]=@(rscore4);
                    // [gameScore saveEventually];
                    [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if (succeeded) {
                            NSLog(@"saved");
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
                        
                        
                        
                        
                        
                        if(rscore4> old)
                            
                        {
                            PFQuery *query1 = [PFQuery queryWithClassName:parseClass];
                            
                            [query1 getObjectInBackgroundWithId:object.objectId
                                                          block:^(PFObject *gameScore, NSError *error) {
                                                              gameScore[playerScore]=@(rscore4);
                                                              [gameScore saveInBackground];
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
    
    //-----------------fetch datas from local data base---------------------------
    
    
    
    
    
    
    
    
    
    
}
-(void)deletedatabase{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"-------%@",paths);
    sqlite3_stmt *stmt=nil;
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"brain2.sqlite"];
    
    NSString *delSQL4=[NSString stringWithFormat:@"DELETE from users WHERE Game=\"%d\"", [SingletonClass sharedSingleton].level];
    const char *sql=[delSQL4 UTF8String];
    
    
    
    if(sqlite3_open([databasePath UTF8String], &DB)!=SQLITE_OK)
        NSLog(@"error to open");
    if(sqlite3_prepare_v2(DB, sql, -1, &stmt, NULL)!=SQLITE_OK)
    {
        NSLog(@"error to prepare");
        // NSLog(@"%s Prepare failure '%s' (%1d)", __FUNCTION__, sqlite3_errmsg(_databaseHandle), sqlite3_errcode(_databaseHandle));
        
        
    }
    if(sqlite3_step(stmt)==SQLITE_DONE)
    {
        NSLog(@"Delete successfully");
    }
    else
    {
        NSLog(@"Delete not successfully");
        
    }
    sqlite3_finalize(stmt);
    sqlite3_close(DB);
    
    
    
    
    
    
}





-(void)playerrank{
    NSString *fbid =[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookid"];
    NSLog(@"facebookid===%@",fbid);
    
    PFQuery *query = [PFQuery queryWithClassName:parseClass];
    if(fbid!=nil){
        
        NSMutableArray *fbid1 =[[NSUserDefaults standardUserDefaults]objectForKey:@"facebookfriendsid"];
        [query whereKey:gameLevel equalTo:@([SingletonClass sharedSingleton].level)];
        
        [query whereKey:playerFbId containedIn:fbid1 ];
        
        [query orderByDescending:playerScore];
        
//        
//    }
//    else{
//        
//
//    
//    
//    
//    
//    [query whereKey:@"userlevel" equalTo:@2];
//    [query orderByDescending:@"userscore"];
//    }
    x=0;
    y=0;
    z=0;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded
            NSLog(@"Successfully retrieved %ld scores.", objects.count);
            // Do something with the found objects
            
            //---------------scrollview---------------------------
            
            UIScrollView* scrollView = [[UIScrollView alloc] init];
            if(width1>=375&&height1>=667){
                
                scrollView.frame=CGRectMake(0, 50,self.view.bounds.size.width, 110);

                           }
            else{
                
                scrollView.frame=CGRectMake(0, 50,self.view.bounds.size.width, 90);
                            }
            
            
            scrollView.backgroundColor = [UIColor clearColor];
            scrollView.scrollEnabled = YES;
            scrollView.pagingEnabled = YES;
            
            scrollView.showsVerticalScrollIndicator = YES;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.contentSize = CGSizeMake(self.view.bounds.size.width+50, scrollView.frame.size.height);
            [self.view addSubview:scrollView];
            
            
            
            //------------------------------------------------------
            int i=0;
            
            for (PFObject *object in objects) {
                if(i<3)
                {
                    i++;
                    NSLog(@"%@", object.objectId);
                NSLog(@"user facebook id-----%@",object[playerFbId]);
                NSLog(@"first-------%@",object[playerScore]);
                
                UILabel *r1=[[UILabel alloc]initWithFrame:CGRectMake(10*width1/320+60+y, 10, 80, 80)];
                    if(width1>=375&&height1>=667){
                        r1.frame=CGRectMake(45*width1/320+60+y, 10, 80, 80);
                        r1.font=[UIFont systemFontOfSize:12];
                        y=y+141;
                    }
                    else{
                        r1.frame=CGRectMake(10*width1/320+60+y, 10, 80, 80);
                        r1.font=[UIFont systemFontOfSize:8];
                        //r1.font=[UIFont systemFontOfSize:8];
                        y=y+110;
                    }

                    
                    
                r1.textColor=[UIColor blackColor];
                //NSString *txt=object[@"userscore"];
                //  NSLog(@"txt %@",txt);
                // int sc=[object[@"userscore"] intValue];
                
                r1.text= [NSString stringWithFormat:@"%@",object[playerScore]];
                
               // [self.view addSubview:r1];
                 [scrollView addSubview:r1];
                
                
                
                
                NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", object[playerFbId]]];
                    
                    
                    UIImageView  *sdpicview=[[UIImageView alloc]init];
                    
                    if(width1>=375&&height1>=667){
                        sdpicview.frame=CGRectMake(25*width1/320+x, 10, 80, 80);
                        x=x+140;
                    }
                    else{
                        sdpicview.frame=CGRectMake(10*width1/320+x,10, 60,60);
                        x=x+110;
                    }
                    
                    
                    // [sdpicview setImage:fbImage];
                    [sdpicview sd_setImageWithURL:pictureURL placeholderImage:[UIImage imageNamed:@""]];
                    
                    [scrollView addSubview:sdpicview];

//                NSData *imageData = [NSData dataWithContentsOfURL:pictureURL];
//                UIImage *fbImage = [UIImage imageWithData:imageData];
                UILabel *r2=[[UILabel alloc]init];
                       r2.text=object[playerName];
                    
                    if(width1>=375&&height1>=667){
                        r2.frame=CGRectMake(30+z, 60, 80, 80);
                        r2.font=[UIFont systemFontOfSize:10];
                        z=z+141;
                    }
                    else{
                        r2.frame=CGRectMake(10*width1/320+z,40, 80, 80);
                        r2.font=[UIFont systemFontOfSize:10];
                          z=z+110;
                    }

                    
                    
                    r2.textColor=[UIColor blackColor];
             
               
               // [self.view addSubview:r2];
                 [scrollView addSubview:r2];
              
                
                                //[self.view addSubview:sdpicview];
                }
                
                
                
                
                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
