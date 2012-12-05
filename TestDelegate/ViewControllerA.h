//
//  ViewControllerA.h
//  TestDelegate
//
//  Created by liuwei on 12-12-5.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerAProtocal.h"

@interface ViewControllerA : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *buttonA;
@property (nonatomic, assign) id <ViewControllerAProtocal> delegate;

@end
