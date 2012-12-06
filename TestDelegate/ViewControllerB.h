//
//  ViewControllerB.h
//  TestDelegate
//
//  Created by liuwei on 12-12-5.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "switchProtocal.h"

@interface ViewControllerB : UIViewController<switchProtocal>

@property (retain, nonatomic) IBOutlet UIButton *buttonB;

@property (nonatomic, assign) id <switchProtocal> delegate;

@end
