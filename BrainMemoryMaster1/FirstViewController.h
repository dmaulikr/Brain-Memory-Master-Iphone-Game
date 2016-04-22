//
//  FirstViewController.h
//  BrainMemoryMaster
//
//  Created by GBS-ios on 1/12/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayGame.h"
#import "SingletonClass.h"
#import "Levels.h"
#import "mainLevel.h"
@interface FirstViewController : UIViewController<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>{
    UIButton *cancel;
    UIScrollView *helpView;
    UIView *header;
}

@end
