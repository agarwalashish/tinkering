//
//  ViewController.h
//  AudioRecordAndPlay
//
//  Created by Ashish Agarwal 
//  Copyright (c) 2013 Ashish Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController{
    NSURL *audioFileURL;
}

@property(strong, nonatomic)AVAudioRecorder *audioRecorder;
@property(strong, nonatomic)AVAudioPlayer *audioPlayer;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UIProgressView *audioProgress;

- (IBAction)audioRecord:(id)sender;
- (IBAction)audioStop:(id)sender;
- (IBAction)audioPlay:(id)sender;

@end
