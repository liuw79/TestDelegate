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
#import "switchProtocal.h"

@interface SwitchViewController : UIViewController<switchProtocal>

@property (nonatomic, retain) ViewControllerA * viewA;
@property (nonatomic, retain) ViewControllerB * viewB;

- (IBAction)switchToA:(id)sender;
- (IBAction)switchToB:(id)sender;

@end
