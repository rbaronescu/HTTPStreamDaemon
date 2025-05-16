#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

static AVPlayer *player;

void handleAudioInterruption(NSNotification *notification) {
    NSDictionary *info = [notification userInfo];
    NSInteger type = [info[AVAudioSessionInterruptionTypeKey] integerValue];

    if (type == AVAudioSessionInterruptionTypeBegan) {
        NSLog(@"[stream_daemon] Audio interruption began.");
    } else if (type == AVAudioSessionInterruptionTypeEnded) {
        NSLog(@"[stream_daemon] Audio interruption ended.");
        
        // Reactivate session and resume playback
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
        [player play];
        NSLog(@"[stream_daemon] Resumed playback after interruption.");
    }
}

int main(int argc, char *argv[]) {
    @autoreleasepool {
        NSLog(@"[stream_daemon] Starting streaming daemon...");

        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        [session setActive:YES error:nil];

        // Register for interruptions
        [[NSNotificationCenter defaultCenter] addObserverForName:AVAudioSessionInterruptionNotification
                                                          object:nil
                                                           queue:[NSOperationQueue mainQueue]
                                                      usingBlock:^(NSNotification *note) {
            handleAudioInterruption(note);
        }];

        // Start streaming. URL hardcoded for now
        NSURL *url = [NSURL URLWithString:@"http://your_web_radio_url"];
        player = [AVPlayer playerWithURL:url];
        [player play];
        NSLog(@"[stream_daemon] Streaming started.");

        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
