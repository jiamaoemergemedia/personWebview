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
    
    [GAI defaultTrackerSendScreenName:@"PersonWebViewController.h"];
    
    //Network checking
    if (![PersonInternetConnection isNetworkAvailable]) {
        return;
    }
    
    [self initMainScreen];
    [self animateLoader];
    [self loadUIWebView];
    
    NSUserDefaults *location = [NSUserDefaults standardUserDefaults];
    self.update = [location objectForKey:@"update"];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)viewDidLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    
    //manage rotation
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        UIView *view = [[UIView alloc]init];
        if (UIInterfaceOrientationIsPortrait(orientation)) {
            for (UIView *subview in [self.view subviews]) {
                if (subview.tag == 9) {
                    [subview removeFromSuperview];
                }
            }
            view.tag = 8;
            view.frame = CGRectMake(0, 0,self.view.bounds.size.width, 20);
            view.backgroundColor=[UIColor blackColor];
            [self.view addSubview:view];
             self.webView.scrollView.contentInset = UIEdgeInsetsMake (20, 0,0, 0);
        }
        if (UIInterfaceOrientationIsLandscape(orientation)) {
            for (UIView *subview in [self.view subviews]) {
                if (subview.tag == 8) {
                    [subview removeFromSuperview];
                }
            }
            view.tag = 9;
            self.webView.scrollView.contentInset = UIEdgeInsetsMake (20, 0,0, 0);
        }
       
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width, 20)];
        view.backgroundColor=[UIColor blackColor];
        [self.view addSubview:view];
         self.webView.scrollView.contentInset = UIEdgeInsetsMake (20, 0,0, 0);
    }
}


-(void)initMainScreen{
    self.webView.delegate=self;
    self.webView.scrollView.showsHorizontalScrollIndicator = NO;
    self.webView.scrollView.showsVerticalScrollIndicator = NO;
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
    self.view.backgroundColor = [UIColor whiteColor];
    
}

//-(BOOL)prefersStatusBarHidden { return YES; }

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self animateLoader];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideLoader];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideLoader];
    self.webView.scrollView.contentOffset = CGPointMake(0, -20);
    [self.webView.scrollView setContentSize: CGSizeMake(self.webView.frame.size.width, self.webView.scrollView.contentSize.height)];

}

-(void)loadUIWebView{
    [[PersonSharedNetworking sharedSharedNetWorking] getFeedForURL:nil
                                                     success:^(NSDictionary *dictionary, NSError *error){
                                                         
                                                        //Use dispatch_async to update the table on the main thread
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             NSLog(@"Success with Data");
                                                            
                                                             if (![self.update isEqualToString:@"update"]) {
                                                             [self.webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString: @"https://beta.person.com"]]];
                                                             } else {
                                                                 NSString *iTunesLink = @"https://itunes.apple.com/us/app/person.com/id407206338?mt=8";
                                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
                                                                 [self hideLoader];
                                                             }
                                                             });
                                                     }failure:^{
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             NSLog(@"Problem with Data");
                                                            
                                                         });
                                                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
