//
//  GameRequestView.m
//  BrainMemoryMaster1
//
//  Created by GLB-163 on 8/11/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import "GameRequestView.h"

@interface GameRequestView ()
{
    CGRect screenRect;
    int height;
    int width;
    int i,x,y,countt,test;
    NSMutableArray *taggedFriendsidlist,*taggedFriendsnamelist,*selectedfriends,*duplicate,*finalTaggedList;
    UIView *requestView;
    NSUserDefaults *tag;
    UIImageView *right,*plus;
    UILabel *text;
    
}
@end

@implementation GameRequestView

- (void)viewDidLoad {
    [super viewDidLoad];
    i=0;
    x=0;y=0;
    selectedfriends=[[NSMutableArray alloc]init];
 
    screenRect = [[UIScreen mainScreen] bounds];
    height=screenRect.size.height;
    width=screenRect.size.width;
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    //not requird
    //*******
       if((width==320)&&(height==480)){
        backImg.image=[UIImage imageNamed:@"ask_extra_lives.png"];
    }
    else if((width==320)&&(height==480)){
        backImg.image=[UIImage imageNamed:@"ask_extra_lives.png"];    }
    else if((width==320)&&(height==568)){
         backImg.image=[UIImage imageNamed:@"ask_extra_lives.png"];
    }
    else if((width==375)&&(height==667)){
        backImg.image=[UIImage imageNamed:@"ask_extra_lives copy1.png"];
    }
    else if((width>=414)&&(height>=736)){
        backImg.image=[UIImage imageNamed:@"ask_extra_lives6+.png"];
    }
    else if((width>800)&&(height>1700)){
        backImg.image=[UIImage imageNamed:@"ask_extra_lives.png"];
    }
    //*******
   
    [self.view addSubview:backImg];
    
    self.view.backgroundColor=[UIColor clearColor];
    

    
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(width==320){
        back.frame=CGRectMake(10*width/320, (width/15)+12,34*width/320,20*height/480);
    }
    else{
        back.frame=CGRectMake(10*width/320, (width/15),34*width/320,20*height/480);
    }
    back.backgroundColor=[UIColor clearColor];
    back.titleLabel.font=[UIFont systemFontOfSize:width/20];
    [back setBackgroundImage:[UIImage imageNamed:@"back_btn.png"] forState:UIControlStateNormal];
    
    
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    
    
    
    
    
    
    
    UIButton *send=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    send.frame=CGRectMake(width/2-40,height/9, 80,height/10);

//    UIImageView *sendbtn=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
//    sendbtn.image=[UIImage imageNamed:@"send_btn.png"];
   
   
    [send setBackgroundImage:[UIImage imageNamed:@"send_btn.png"] forState:UIControlStateNormal];
    
    [send addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send];
    
    [self retriveTaggableFriendInfo];
    
    [ self collectionview];
    
    UILabel *inst=[[UILabel alloc]initWithFrame:CGRectMake(25, screenRect.size.height-70, screenRect.size.width-50, 55)];
    
    inst.text=@"Note:You will get 1 life for every five friends.So tag as many as you  want,you can earn maximum 5 lives.";
    
    if(width>=414&&height>=736){
        inst.font=[UIFont systemFontOfSize:12];

    }
    else{
    inst.font=[UIFont systemFontOfSize:10];
    }
    inst.numberOfLines=2;
    inst.textColor=[UIColor blackColor];
    //inst.backgroundColor=[UIColor grayColor];
    [self.view addSubview:inst];

    
    
    

    
    // Do any additional setup after loading the view.
}
-(void)back{
    
     //[[SingletonClass sharedSingleton].timer invalidate];
    
    [tag setObject:nil forKey:@"tagfriends"];
    [tag synchronize];
    NSLog(@"----%d",[tag synchronize]);
    
    [selectedfriends removeAllObjects];
    
    
    
    
    if([SingletonClass sharedSingleton].life>0){
        
               [[SingletonClass sharedSingleton].timer invalidate];
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"startkey"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
    

    
    
    mainLevel *main=[[mainLevel alloc]init];
    main.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    //----------------------------------------------------
    //-----------------------------------------------------
    [self presentViewController:main animated:YES completion:nil];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
 
    
    // Dispose of any resources that can be recreated.
}
-(void)collectionview{
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing =5;
    layout.minimumLineSpacing=15;
    
    if(width==320&&height==480){
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width/11, height/5, width-2*width/11,height-166) collectionViewLayout:layout];
    }
    else if(width==320&&height==568){
         _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width/11, height/5, width-2*width/11,height-190) collectionViewLayout:layout];
    }
    else if(width==375&&height==667){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width/11, height/5, width-2*width/11,height-230) collectionViewLayout:layout];
    }
    else if(width>=414&&height==736){
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(width/11, height/5, width-2*width/11,height-247) collectionViewLayout:layout];
    }
    

    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    
    
   requestView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    requestView.backgroundColor=[UIColor redColor];
    

    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    
    
    
    [self.view addSubview:_collectionView];
    text=[[UILabel alloc]init];
    if(width==320&&height==480){
        text.frame=CGRectMake(73, screenRect.size.height-84, screenRect.size.width-50, 40);
        text.font=[UIFont systemFontOfSize:13];
        
    }
    else if(width==320&&height==568){
        text.frame=CGRectMake(60, screenRect.size.height-90, screenRect.size.width-50, 40);
        text.font=[UIFont systemFontOfSize:14];
    }
   else if(width==375&&height==667){
        text.frame=CGRectMake(86, screenRect.size.height-105, screenRect.size.width-50, 40);
       text.font=[UIFont systemFontOfSize:15];
       
    }
   else if(width>=414&&height>=736)
      {
        text.frame=CGRectMake(90, screenRect.size.height-113, screenRect.size.width-50, 40);
        text.font=[UIFont systemFontOfSize:15];
        

    }
    //NSString *ltext=[NSString stringWithFormat:@"You have selected %lu friends",(unsigned long)duplicate.count];
    NSString *ltext=[NSString stringWithFormat:@"You have selected %lu friends",(unsigned long)taggedFriendsidlist.count];
    text.text=ltext;
    text.textColor=[UIColor blackColor];
   
    [self.view insertSubview:text aboveSubview:_collectionView];
    

    
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [taggedFriendsnamelist count];
}




- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(110,40);//
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    //cell.backgroundColor=[UIColor clearColor];
    
    
    //NSString *selectedids=[duplicate objectAtIndex:indexPath.row];
    
    //NSLog(@"items no---->%d",indexPath.row);
    NSLog(@"items no------->%ld",(long)indexPath.row);
    
    NSMutableDictionary *tempdict=[[NSMutableDictionary alloc]init];
    
    [tempdict setObject:[taggedFriendsnamelist objectAtIndex:indexPath.row] forKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
    // requestView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    requestView.backgroundColor=[UIColor redColor];
    
    
    UIImageView *rotateView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,107,35)];
    plus=[[UIImageView alloc]initWithFrame:CGRectMake(77,0,30,30)];
    
    
    
    NSLog(@"=====count=%lu",(unsigned long)taggedFriendsnamelist.count);
    
    
   
    
    rotateView.image=[UIImage imageNamed:@"name_fb1.png"];
   //-------
    
    if (![duplicate containsObject:[taggedFriendsidlist objectAtIndex:indexPath.row]]) {
        
       // [duplicate addObject:[taggedFriendsidlist objectAtIndex:indexPath.row]];
        plus.image=[UIImage imageNamed:@"right.png"];
    }
    else{
        
        //[duplicate removeObjectAtIndex:indexPath.row];
        rotateView.image=[UIImage imageNamed:@"name_fb1.png"];
        plus.image=[UIImage imageNamed:@"plus.png"];
    }
    
    //------
    
    
    
    
    
    UILabel  *name=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 60, 30)];
    
    name.text=[tempdict objectForKey:[NSString  stringWithFormat:@"%ld",(long)indexPath.row]];
    name.font=[UIFont systemFontOfSize:12];
    name.numberOfLines=2;
    name.textColor=[UIColor blackColor];
    [cell addSubview:rotateView];
    [rotateView addSubview:name];
    [cell addSubview:plus];
//    test=0;
//    
//    for(int j=0;j<taggedFriendsidlist.count;j++)
//    {
//        NSString *check=[taggedFriendsidlist objectAtIndex:j];
//        if([selectedids isEqualToString:check])
//        {
//            test=1;
////            //@@ plus.image=[UIImage imageNamed:@"right.png"];
////            plus.image=[UIImage imageNamed:@"plus.png"];
////            //@
//        }
//        
//        
//    }
//    if(test==0){
//         plus.image=[UIImage imageNamed:@"plus.png"];
//    }
//    
    [cell addSubview:plus];
    
    NSLog(@">>>>>%ld",(long)indexPath.row);
    
    //[_collectionView addSubview:requestView];
    
    [cell.contentView addSubview:requestView];
    cell.layer.cornerRadius=45.0f;
    
    
    
    return cell;
    
    
    
    
}


-(void)retriveTaggableFriendInfo{
    
    taggedFriendsidlist=[[NSMutableArray alloc]init];
  taggedFriendsnamelist=[[NSMutableArray alloc]init];
//    taggedFriendspiclist= [[NSMutableArray alloc]init];
     duplicate=[[NSMutableArray alloc]init];
    finalTaggedList=[[NSMutableArray alloc]init];
    
    taggedFriendsidlist =[[NSUserDefaults standardUserDefaults]objectForKey:@"facebooktagfriendsids"];
    NSLog(@"received friendsid list===>%@",taggedFriendsidlist);
    
    taggedFriendsnamelist =[[NSUserDefaults standardUserDefaults]objectForKey:@"facebooktagfriendsnames"];
    NSLog(@"received friendsname list===>%@",taggedFriendsnamelist);
    
    
   
    
   // duplicate=[taggedFriendsidlist copy];
   // duplicate = [NSMutableArray arrayWithArray:taggedFriendsidlist];
 //   NSLog(@"duplicate array-------->%@  count--%d",duplicate,duplicate.count);
    
    
    
   
    
    
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [text removeFromSuperview];
    
    
    if (![duplicate containsObject:[taggedFriendsidlist objectAtIndex:indexPath.row]]) {
        
        [duplicate addObject:[taggedFriendsidlist objectAtIndex:indexPath.row]];
    }
    else{
        NSString * str = [taggedFriendsidlist objectAtIndex:indexPath.row];
        for (int k = 0; k<duplicate.count; k++) {
            if ([[duplicate objectAtIndex:k] isEqualToString:str]) {
                 [duplicate removeObjectAtIndex:k];
                break;
            }
        }
    }
    
    [_collectionView reloadData];
  
    if(width==320&&height==480){
        text.frame=CGRectMake(73, screenRect.size.height-84, screenRect.size.width-50, 40);
        text.font=[UIFont systemFontOfSize:13];
        
    }
    else if(width==320&&height==568){
        text.frame=CGRectMake(60, screenRect.size.height-90, screenRect.size.width-50, 40);
        text.font=[UIFont systemFontOfSize:14];
    }


    else if(width>=375&&height>=667){
        text.frame=CGRectMake(86, screenRect.size.height-105, screenRect.size.width-50, 40);
        text.font=[UIFont systemFontOfSize:15];
    }
    else if(width>=414&&height>=736)
    {
        text.frame=CGRectMake(90, screenRect.size.height-113, screenRect.size.width-50, 40);
        text.font=[UIFont systemFontOfSize:15];
        
        
    }
    

    NSString *ltext=[NSString stringWithFormat:@"You have selected %lu friends",(unsigned long)taggedFriendsidlist.count-(unsigned long)duplicate.count];
    text.text=ltext;
    text.textColor=[UIColor blackColor];
  
    
    [self.view addSubview:text ];
    NSLog(@"duplicate array----->%@",duplicate);
    
    
   

    
    
    
  /*  NSString *selectedidstext=[duplicate objectAtIndex:indexPath.row];
    NSLog(@"selected ids=====>%@",selectedidstext);
    countt=0;
    
    
    
    NSLog(@"total array------------->%@",taggedFriendsidlist);
    
    
    NSLog(@"clicked index===================%ld",(long)indexPath.row);
    
    
    
    NSLog(@"tagged frienfs------->%@",taggedFriendsidlist);
    
    for(int j=0;j<taggedFriendsidlist.count;j++)
    {
        
        NSString *check= [taggedFriendsidlist objectAtIndex:j];
        NSLog(@"checked====%@",check);
        
     if([selectedidstext isEqualToString:check])
      //  if ([taggedFriendsidlist containsObject:check])
        {
            [taggedFriendsidlist removeObjectAtIndex:j];
            cell = [collectionView cellForItemAtIndexPath:indexPath];
            
            right=[[UIImageView alloc]initWithFrame:CGRectMake(77,0,30,30)];
            //@@ right.image=[UIImage imageNamed:@"right.png"];
            right.image=[UIImage imageNamed:@"plus.png"];
            
            //@
            [cell  addSubview:right];
            countt=1;
            
        }
        
        
        
        
        
    }
    
    
    NSLog(@"removed ids=====>%@",taggedFriendsidlist);
    
    
    
    
    if(countt==0){
        
        [taggedFriendsidlist addObject:selectedidstext];
        
        cell = [collectionView cellForItemAtIndexPath:indexPath];
        
        right=[[UIImageView alloc]initWithFrame:CGRectMake(77,0,30,30)];
        //@@ right.image=[UIImage imageNamed:@"right.png"];
        right.image=[UIImage imageNamed:@"right.png"];
        
        //@
        [cell  addSubview:right];
        NSLog(@"again added array is----->%@",taggedFriendsidlist);
        
        
    }
    
    
    text=[[UILabel alloc]initWithFrame:CGRectMake(50, screenRect.size.height-50, screenRect.size.width-50, 40)];
    NSString *ltext=[NSString stringWithFormat:@"You have selected %lu friends",(unsigned long)taggedFriendsidlist.count];
    text.text=ltext;
    text.textColor=[UIColor blackColor];
    text.font=[UIFont systemFontOfSize:15];
    
    [self.view addSubview:text ];
    
    
    
    */
   
    
    }
-(void)send{
    
    
    
    for (int k=0; k<taggedFriendsidlist.count; k++)
    {
        
        NSString *check=[taggedFriendsidlist objectAtIndex:k];
        if([duplicate containsObject:check])
        {
            
        }
        else{
             [finalTaggedList addObject:check];
          
        }
        
    }
      NSLog(@"final tagged friends array is-------------%@",finalTaggedList);

    
    
    
    tag= [NSUserDefaults standardUserDefaults];
    [tag setObject:finalTaggedList forKey:@"tagfriends"];
    [tag synchronize];
    NSLog(@"----%d",[tag synchronize]);
    
    
    
    
    
     if([finalTaggedList count]!=0){
    
    
    
    FirstAppDelegate *appdelegate=[UIApplication sharedApplication].delegate;
    [appdelegate requestLife ];
    
    }
    
    
    
//    
//           if([SingletonClass sharedSingleton].tag==1){
//            UIView *view=[[UIView alloc]init];
//            if (width==375 && height==667) {
//                view.frame=CGRectMake(64,470,width-128, 30);
//            }
//            else    if(width==320&& height==480){
//                view.frame=CGRectMake(64,410,width-128, 30);
//            }
//            else{
//                view.frame=CGRectMake(55,400,width-128, 30);
//            }
//            
//            
//            view.backgroundColor=[UIColor lightGrayColor];
//            // label.backgroundColor.layer.cornerRadius=6;
//            
//            [self.view addSubview:view];
//            
//        }
    
               mainLevel *mainlevel=[[mainLevel alloc]init];
               mainlevel.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
               [self presentViewController:mainlevel animated:YES completion:nil];
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
