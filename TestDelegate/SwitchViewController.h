//
//  SwitchViewController.h
//  TestDelegate
//
//  Created by liuwei on 12-12-5.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "ViewControllerAProtocal.h"
#import "ViewControllerBProtocal.h"

@interface SwitchViewController : UIViewController<ViewControllerAProtocal, ViewControllerBProtocal>

@property (nonatomic, retain) ViewControllerA * viewA;
@property (nonatomic, retain) ViewControllerB * viewB;

@end
