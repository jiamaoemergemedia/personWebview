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

-(void)loadUIWebView{
    [self.webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString: @"http://google.com"]]];
    self.webView.hidden = NO;
    self.loading.hidden = YES;
    self.loader.hidden = YES; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
