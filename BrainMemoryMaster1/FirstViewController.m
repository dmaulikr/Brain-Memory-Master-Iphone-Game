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
    height1=screenRect.size.height;
    width1=screenRect.size.width;
    
    UIImageView *backImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,width1 ,height1)];
        backImg.alpha=1;
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
    [play setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
      play.layer.shadowOffset=CGSizeMake(5, 3);
    play.titleLabel.font=[UIFont boldSystemFontOfSize:22.0];
    play.titleLabel.shadowOffset=CGSizeMake(2, 1);
    play.titleLabel.textColor=[UIColor whiteColor];
    play.layer.shadowOpacity=2.0;
   play.alpha=0;
    [play addTarget:self action:@selector(PlayAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:play];
    
    
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
   
}
-(void)run:(UIView*)view{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * -.1 * .5 ];
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
    //Place the UIImage in a UIImageView
    //UIImageView *newView = [[UIImageView alloc] initWithFrame:CGRectMake(100,100, 200, 200)];
    // newView.image = blurrredImage;
    //newView.alpha=.1;
    //[self.view addSubview:newView];
    //insert blur UIImageView below transparent view inside the blur image container
    //[self.view insertSubview:newView belowSubview:transparentView];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
