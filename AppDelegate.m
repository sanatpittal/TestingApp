//
//  AppDelegate.m
//  PostEmail
//
//  Created by Mobikasa_Jan2013 on 22/10/13.
//  Copyright (c) 2013 Mobikasa_Jan2013. All rights reserved.
//

#import "AppDelegate.h"
#import  "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation AppDelegate
@synthesize navController=_navController;
@synthesize listVC=_listVC;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    _listVC=[[ListViewController alloc]initWithNibName:@"ListViewController" bundle:nil];
    _navController=[[UINavigationController alloc]initWithRootViewController:_listVC];
    
    // Override point for customization after application launch.
    
    
////    NSString *timeStamp=[NSString stringWithFormat:@"User=hwipad&Password=br8mApe5&SenderAddress=%@&SendToAddress=%@&ClientFirstname=sh&ClientLastName=ph&ClientPrefix=r&StockNumbers=rtrff&EmailSubject=dsfds&ClientPhone=097&ClientAddress=dff&SalesPersonFirstName=fg&SalesPersonLastName=ds&EmailSignature=rtgdg&EmailBody=dsfd&CCAddresses=df&Attachments=%@",@"adam@harrywinstone.com",@"sanat@mobikasa.com",[[NSBundle mainBundle] pathForResource:@"HarryWinston.pdf" ofType:nil]];
  
  
    NSString *postString = nil;
    postString = @"https://api.megaport.com/secure/textdocument/WEB_TERMS";
    NSURL *url = [NSURL URLWithString:postString];

    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
  
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/json"];
    [httpClient setDefaultHeader:@"Accept" value:@"application/json"];
//    [httpClient setParameterEncoding:AFFormURLParameterEncoding];
   // [httpClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [httpClient setAllowsInvalidSSLCertificate:FALSE];
    [httpClient getPath:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        
        NSDictionary *jsons = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"response: %@",jsons);
        
        
//////        NSDictionary *dict = (NSDictionary*)responseObject;
//////        
//////        NSString *status = [dict objectForKey:@"Status"];
//////        
//////        NSLog(@"status:%@",status);
//////        
//////        if([status integerValue] == 0) {
//////            
//////            searchTableView.hidden = YES;
//////            notFoundIcon.hidden = NO;
//////            [searchButton setEnabled:YES];
//////            
//////            [activityIndicator removeFromSuperview];
//////            [activityIndicator stopAnimating];
//////            
//////            return ;
//////        }
//////        else {
//////            searchTableView.hidden = NO;
//////            notFoundIcon.hidden = YES;
//////        }
//////        
//////        NSArray *arraySearchs = [dict objectForKey:@"Data"];
//////        
//////        noOfResultsLabel.text = [NSString stringWithFormat:@"%@ RESULTS",[dict objectForKey:@"Extra"]] ;
//////        
//////        dispatch_queue_t zipQueue = dispatch_queue_create("zipQueue",NULL);
//////        dispatch_async(zipQueue, ^{
//////          
//////            for (NSDictionary *dict in arraySearchs) {
//////                
//////                [arraySearchResults addObject:dict];
//////            }
//////            
//////            dispatch_async(dispatch_get_main_queue(), ^ {
//////                
//////                [searchTableView reloadData];
//////                [searchButton setEnabled:YES];
//////                [activityIndicator removeFromSuperview];
//////                [activityIndicator stopAnimating];
//////                
        
        
     
       
////        NSLog(@"Request Successful, response '%@'", responseObject);
////
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      
//        [searchButton setEnabled:YES];
//        [activityIndicator removeFromSuperview];
//        [activityIndicator stopAnimating];
      NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
  }];

//NSData *imageToUpload = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HarryWinston.pdf" ofType:nil]];//(uploadedImgView.image);
//
//    if ([[NSBundle mainBundle] pathForResource:@"HarryWinston.pdf" ofType:nil]) {
//        NSLog(@"found");
//    }
//    
//    if (imageToUpload)
//    {
//        NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"adam@HARRYWINSTON.com",@"SenderAddress",@"sanat@mobikasa.com",@"SendToAddress",@"sanat",@"ClientFirstname",@"pittal",@"ClientLastName",@"Mr.",@"ClientPrefix",@"204945",@"StockNumbers",@"Harry Winston Salon Visit",@"EmailSubject",@"",@"ClientPhone",@"",@"ClientAddress",@"Adam",@"SalesPersonFirstName",@"Young",@"SalesPersonLastName",@"",@"EmailSignature",@"Thank you for visiting",@"EmailBody",@"",@"CCAddresses",nil];
//        
//        AFHTTPClient *client= [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:postString]];
//        
//        [client setAuthorizationHeaderWithUsername:@"hwipad" password:@"br8mApe5"];
//        [client setDefaultHeader:@"Content-Type" value:@"application/json"];
//        [client setDefaultHeader:@"Accept" value:@"application/json"];
//        [client setParameterEncoding:AFFormURLParameterEncoding];
//        [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
//        [client setAllowsInvalidSSLCertificate:TRUE];
//
//        NSMutableURLRequest *request = [client multipartFormRequestWithMethod:@"POST" path:@"/Default.aspx" parameters:parameters constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
//            [formData appendPartWithFileData: imageToUpload name:@"Attachments" fileName:@"HarryWinston.pdf" mimeType:@"file/pdf"];
//            
//        }];
//        
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//        
//        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
//         {
//             NSDictionary *jsons = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
//             NSLog(@"response: %@",jsons);
//             
//         }
//        failure:^(AFHTTPRequestOperation *operation, NSError *error)
//         {
//             if([operation.response statusCode] == 403)
//             {
//                 NSLog(@"Upload Failed");
//                 return;
//             }
//             NSLog(@"error: %@", [operation error]);
//             
//         }];
//        
//        [operation start];
//    }
    
   // [self playselectedsong];
    
//    NSDictionary * jsonDic;
//    __block NSString *responsebody = @"";
    
   // NSLog(@"%@",request);
    self.window.rootViewController=_navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
//- (NSString *)hmacsha1:(NSString *)data secret:(NSString *)key {
//    
//    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
//    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
//    
//    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
//    
//    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
//    
//    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
//    
//    NSString *hash = [QSStrings encodeBase64WithData:HMAC];
//    
//    NSLog(@"Hash: %@", hash);  
//    
//    return hash;
//}
//
//- (NSString *)urlEncodeValue:(NSString *)str
//{
//    NSMutableString * output = [NSMutableString string];
//    const unsigned char * source = (const unsigned char *)[str UTF8String];
//    int sourceLen = strlen((const char *)source);
//    for (int i = 0; i < sourceLen; ++i) {
//        const unsigned char thisChar = source[i];
//        if (thisChar == ' '){
//            [output appendString:@"+"];
//        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
//                   (thisChar >= 'a' && thisChar <= 'z') ||
//                   (thisChar >= 'A' && thisChar <= 'Z') ||
//                   (thisChar >= '0' && thisChar <= '9')) {
//            [output appendFormat:@"%c", thisChar];
//        } else {
//            [output appendFormat:@"%%%02X", thisChar];
//        }
//    }
//    return output;   
//    
//}
//
//-(NSString *) genRandString {
//    //fixing length of 4 chars
//    
//    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
//
//    NSMutableString *randomString = [NSMutableString stringWithCapacity: 4];
//    
//    for (int i=0; i<4; i++) {
//        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
//    }
//    
//    return randomString;
//}
-(void)playselectedsong{
    
    NSLog(@"Playing");
    
    NSURL *url = [NSURL URLWithString:@"http://stream.svc.7digital.net/stream/catalogue?country=US&formatId=26&oauth_consumer_key=7drs698e2e4s&oauth_nonce=444843431&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1382942704&oauth_version=1.0&trackId=29554720&oauth_signature=CO7X7KbXKpfaH0b10d%2FZqTULTKo%3D"];
    
    
//    NSData *soundData = [NSData dataWithContentsOfURL:url];
    audioPlayer=[[AVPlayer alloc]initWithURL:url];
//     audioPlayer = [[AVPlayer alloc] initWithData:soundData  error:NULL];
//    audioPlayer.delegate = self;
//    [audioPlayer prepareToPlay];
   
    
    [audioPlayer play];
    
    
    
//    NSURL *theURL = [NSURL URLWithString:@"http://yourdomain.com/yourmediafile.mp3"];
//    
//    MPMoviePlayerController* yourPlayerController = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    [yourPlayerController.view setFrame:CGRectMake(0.0f,-40.0f,self.window.bounds.size.width, self.window.bounds.size.height+40.0f)];
//
//    [yourPlayerController setScalingMode:MPMovieScalingModeAspectFit];
//    [yourPlayerController setFullscreen:YES animated:YES];
//    [yourPlayerController setControlStyle:MPMovieControlStyleNone];
//    [yourPlayerController.view setBackgroundColor:[UIColor redColor]];
//    [yourPlayerController prepareToPlay];
//    [yourPlayerController setShouldAutoplay:YES];
//    [yourPlayerController play];
//    [self.window addSubview:yourPlayerController.view];
    
}
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    
//    if (object == songPlayer && [keyPath isEqualToString:@"status"]) {
//        if (songPlayer.status == AVPlayerStatusFailed) {
//            NSLog(@"AVPlayer Failed");
//            
//        } else if (songPlayer.status == AVPlayerStatusReadyToPlay) {
//            NSLog(@"AVPlayerStatusReadyToPlay");
//            
//            
//        } else if (songPlayer.status == AVPlayerItemStatusUnknown) {
//            NSLog(@"AVPlayer Unknown");
//            
//        }
//    }
//}
//
//- (void)playerItemDidReachEnd:(NSNotification *)notification {
//    
//    //  code here to play next sound file
//    
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
