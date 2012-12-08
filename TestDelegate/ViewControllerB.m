//
//  ViewControllerB.m
//  TestDelegate
//
//  Created by liuwei on 12-12-5.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

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
    
    [self.buttonB addTarget:self
                     action:@selector(switch)
           forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

- (void)playVideo:(id)sender
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *videoURL =  [bundle URLForResource:@"IMG_6106" withExtension:@"m4v"];
    NSLog(@"%@", videoURL);
    
//    MPMoviePlayerController *mpc = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
//    mpc.scalingMode = MPMovieScalingModeAspectFill;
//    mpc.controlStyle = MPMovieControlStyleFullscreen;
//    
//    [mpc play];
    
    MPMoviePlayerViewController *mpv = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
    self.moviePlayerController = mpv;
    [mpv release];
    
    [self.view addSubview:self.moviePlayerController.view];
    MPMoviePlayerController *mpc = [self.moviePlayerController moviePlayer];
    mpc.scalingMode = MPMovieScalingModeAspectFit;
    mpc.controlStyle = MPMovieControlStyleDefault;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(MPMovieFinishedPlayback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:mpc];
    [mpc play];
}

- (void)MPMovieFinishedPlayback:(NSNotification *)aNotification
{
    MPMoviePlayerController *theMovie = [aNotification object];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification object:theMovie];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"状态" message:@"播放完毕！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    [self.moviePlayerController.view removeFromSuperview];
    [self.view.superview bringSubviewToFront:self.view];
}

-(void)switchToA:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"switchToA" object:nil];
}



- (void)switch
{
    [self.delegate switch];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_buttonB release];
    
//    [_moviePlayerController release];
//    _moviePlayerController = nil;
//    
    [super dealloc];
}
@end
