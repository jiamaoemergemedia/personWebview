//
//  PersonWebViewController.m
//  Person.com
//
//  Created by Jiamao Zheng on 10/23/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "PersonWebViewController.h"

@interface PersonWebViewController ()

@end

@implementation PersonWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Network checking
    if (![PersonInternetConnection isNetworkAvailable]) {
        return;
    }
    [self initMainScreen];
    [self animateLoader];
    [self loadUIWebView];
}

-(void)initMainScreen{
    self.webView.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:0.0f/255.0f
                                                green:149.0f/255.0f
                                                 blue:255.0f/255.0f
                                                alpha:1.0f];
}

-(void)animateLoader{
    [self.loading setFont:[UIFont fontWithName:@"OpenSans-Bold" size:18]];
    [self.loading setText:@"LOADING"];
    self.loading.textColor = [UIColor whiteColor];
    FLAnimatedImage *loaderAnimation = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loader" ofType:@"gif"]]];
    self.loader.animatedImage = loaderAnimation;
}

-(void)hideLoader{
    self.webView.hidden = NO;
    self.loading.hidden = YES;
    self.loader.hidden = YES;
}

-(void)loadUIWebView{
    [[PersonSharedNetworking sharedSharedNetWorking] getFeedForURL:nil
                                                     success:^(NSDictionary *dictionary, NSError *error){
                                                         
                                                        //Use dispatch_async to update the table on the main thread
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             NSLog(@"Success with Data");
                                                            
                                                             [self.webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString: @"https://beta.person.com"]]];
                                                             
                                                                 [NSTimer scheduledTimerWithTimeInterval:1.5
                                                                                                  target:self
                                                                                                selector:@selector(hideLoader)
                                                                                                userInfo:nil
                                                                                                 repeats:YES];
                                                             
                                                         
                                                         });
                                                     }failure:^{
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             NSLog(@"Problem with Data");
                                                             [self animateLoader];
                                                         });
                                                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
