//
//  ViewController.m
//  AudioRecordAndPlay
//
//  Created by Ashish Agarwal
//  Copyright (c) 2013 Ashish Agarwal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{

    //Create a file in the Documents directory of the application
    NSArray *dirPaths;
    NSString *documentsDirectory;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [dirPaths objectAtIndex:0];
    
    NSString *audioFilePath = [documentsDirectory stringByAppendingPathComponent:@"audioRecording.m4a"];
    audioFileURL = [NSURL fileURLWithPath:audioFilePath];
    
    //Create a dictionary for all the settings for recording the audio
    /**
     AVSampleRateKey: sample rate key. 44100 is the rate for DVDs
     AVFormatIDKey: lossless compression
     AVNumberOfChannelsKey: 1 is for mono recording
     AVEncoderAudioQualityKey: Medium is chosen to optimize quality and bandwidth
     */
    NSDictionary *audioSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithFloat:44100],AVSampleRateKey,
                                   [NSNumber numberWithInt: kAudioFormatAppleLossless],AVFormatIDKey,
                                   [NSNumber numberWithInt: 1],AVNumberOfChannelsKey,
                                   [NSNumber numberWithInt:AVAudioQualityHigh],AVEncoderAudioQualityKey,nil];
    
    // Initialize the audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:audioFileURL settings:audioSettings error:nil];
    
    [super viewDidLoad];
    [self.audioProgress setHidden:YES];
    
}

-(IBAction)audioRecord:(id)sender{
    
    [self.timer invalidate];
    [self.audioProgress setHidden:YES];
    
    //Start the recording
    [self.audioRecorder record];
}

-(IBAction)audioStop:(id)sender{
    
    //Stop the audio player and the audio recorder
    [self.audioPlayer stop];
    [self.audioRecorder stop];
    
    //Load the audio player file with the audio recording
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileURL error:nil];
}

- (IBAction)audioPlay:(id)sender {
    
    //Start the playback
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileURL error:nil];
    [self.audioPlayer play];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25
                                                  target:self
                                                selector:@selector(updateProgress)
                                                userInfo:nil
                                                 repeats:YES];
    [self.audioProgress setHidden:NO];
}

- (void)updateProgress {
    float timeLeft = self.audioPlayer.currentTime/self.audioPlayer.duration;
    
    // upate the Progress bar
    self.audioProgress.progress= timeLeft;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
