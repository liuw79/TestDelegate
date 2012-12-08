//
//  ViewControllerA.h
//  TestDelegate
//
//  Created by liuwei on 12-12-5.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "switchProtocal.h"

@interface ViewControllerA : UIViewController<switchProtocal, UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UIButton *buttonA;
@property (nonatomic, assign) id <switchProtocal> delegate;
@property (retain, nonatomic) IBOutlet UITextField *TextA;

- (IBAction)switchToB:(id)sender;

- (void) registerForKeyBoardNotifications;
- (void) keyBoardWasShown: (NSNotification *)aNotification;
- (void) keyBoardWillBeHidden: (NSNotification *)aNotification;

@end
