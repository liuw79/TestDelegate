//
//  ViewControllerB.h
//  TestDelegate
//
//  Created by liuwei on 12-12-5.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "switchProtocal.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewControllerB : UIViewController<switchProtocal, UIAlertViewDelegate>

@property (retain, nonatomic) IBOutlet UIButton *buttonB;
@property (retain, nonatomic) MPMoviePlayerViewController *moviePlayerController;

@property (nonatomic, assign) id <switchProtocal> delegate;

- (IBAction)switchToA:(id)sender;
- (IBAction)playVideo:(id)sender;

- (void) MPMovieFinishedPlayback: (NSNotification *)aNotification;

@end
