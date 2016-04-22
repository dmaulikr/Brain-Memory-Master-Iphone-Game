//
//  GameRequestView.h
//  BrainMemoryMaster1
//
//  Created by GLB-163 on 8/11/15.
//  Copyright (c) 2015 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstAppDelegate.h"
#import "mainLevel.h"
#import "Timer.h"


@interface GameRequestView : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    UICollectionViewCell *cell;
    int noOfCell;

}
@property(nonatomic, strong)UICollectionView *collectionView;
@end
