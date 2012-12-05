//
//  SwitchViewController.m
//  TestDelegate
//
//  Created by liuwei on 12-12-5.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "SwitchViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

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
    
    ViewControllerA *a = [[ViewControllerA alloc] initWithNibName:@"ViewControllerA" bundle:nil];
    [a setDelegate:self];
    self.viewA = a;
    [self.view addSubview:self.viewA.view];
    for (UIView *view in self.view.subviews)
    {
        NSLog(@"%@", view);
    }
    [a release];

	// Do any additional setup after loading the view.
    ViewControllerB *b = [[ViewControllerB alloc] init];
    [b setDelegate:self];
    self.viewB = b;
    [b release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchToA
{
    //[self.view removeFromSuperview];
    [self.view addSubview:self.viewA.view];
}

- (void)switchToB
{
    NSLog(@"switch to B");
    [self.view addSubview:self.viewB.view];
}

@end
