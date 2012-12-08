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

    if (nil == self.viewA) {
        ViewControllerA *a = [[ViewControllerA alloc] initWithNibName:@"ViewControllerA" bundle:nil];
        [a setDelegate:self];
        self.viewA = a;
        [a release];
    }

    if (nil == self.viewB ) {
        ViewControllerB *b = [[ViewControllerB alloc] init];
        [b setDelegate:self];
        self.viewB = b;
        [b release];
    }
    
    //没加载任何视图，则加载A视图
    if ([self.viewA.view superview] == nil && [self.viewB.view superview] == nil) {
        [self.view addSubview:self.viewB.view];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(switchToA:)
                                                 name:@"switchToA"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(switchToB:)
                                                 name:@"switchToB"
                                               object:nil];
}

-(void)switchToA:(id)sender
{
    [self.view addSubview:self.viewA.view];
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationTransitionFlipFromRight
                     animations:^{
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                                                forView:self.view
                                                  cache:NO];
                     }
                     completion:^(BOOL finished) {
                         [self.viewB.view removeFromSuperview];
                     }];

}

- (void)switchToB:(id)sender
{
    [self.view addSubview:self.viewB.view];
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationTransitionFlipFromLeft
                     animations:^{
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                                                forView:self.view
                                                  cache:NO];
                     }
                     completion:^(BOOL finished) {
                         [self.viewA.view removeFromSuperview];
                         
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switch
{
    if( [self.viewA.view superview] != nil ) //切换到B
    {
        [self switchToB:nil];
    }
    else  //切换到A
    {
        [self switchToA:nil];
    }
}

-(void)dealloc
{
    [_viewA release];
    _viewA = nil;
    
    [_viewB release];
    _viewB = nil;
    
    [super dealloc];
}

@end
