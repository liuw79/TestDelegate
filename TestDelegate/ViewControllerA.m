//
//  ViewControllerA.m
//  TestDelegate
//
//  Created by liuwei on 12-12-5.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.buttonA addTarget:self
                     action:@selector(switch)
           forControlEvents:UIControlEventTouchUpInside];
    
    float yValue = [UIScreen mainScreen].applicationFrame.size.height - 50;
    float hValue = self.TextA.frame.size.height;
    CGRect frameTextA  = CGRectMake(20, yValue, 260, hValue);
    [self.TextA setFrame:frameTextA];
    NSLog(@"did load: %f,%f,%f,%f",  self.TextA.frame.origin.x, self.TextA.frame.origin.y, self.TextA.frame.size.height, self.TextA.frame.size.width);
    
    [self registerForKeyBoardNotifications];
    // Do any additional setup after loading the view from its nib.
    [self.TextA setDelegate:self];
}

- (void)registerForKeyBoardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyBoardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyBoardWillBeHidden:)
                                                 name:UIKeyboardDidHideNotification object:nil];
}

- (void)keyBoardWasShown:(NSNotification *)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    
    CGRect kbFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    float yValue = kbFrame.origin.y - 60;
    float hValue = self.TextA.frame.size.height;
    CGRect frameTextA  = CGRectMake(20, yValue, 260, hValue);
    [self.TextA setFrame:frameTextA];
}

- (void)keyBoardWillBeHidden:(NSNotification *)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    
    CGRect kbFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    float yValue = kbFrame.origin.y - 60;
    float hValue = self.TextA.frame.size.height;
    CGRect frameTextA  = CGRectMake(20, yValue, 260, hValue);
    [self.TextA setFrame:frameTextA];
}

-  (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.TextA resignFirstResponder];
    return YES;
    // Dispose of any resources that can be recreated.
}

-(void)switchToB:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"switchToB" object:nil];
}

- (void)switch
{
    [self.delegate switch];
}

- (void)dealloc {
    [_buttonA release];
    [_TextA release];
    [super dealloc];
}
@end
