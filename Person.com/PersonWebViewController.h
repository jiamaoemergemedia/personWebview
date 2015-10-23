//
//  PersonWebViewController.h
//  Person.com
//
//  Created by Jiamao Zheng on 10/23/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//- See more at: http://vikrambahl.com/animated-gifs-ios-xcode-storyboards/#sthash.NX3CMnMk.dpuf


#import <UIKit/UIKit.h>
#import "FLAnimatedImage.h" 
#import "FLAnimatedImageView.h" 
#import "PersonSharedNetworking.h"
#import "PersonInternetConnection.h"

@interface PersonWebViewController : UIViewController <UIWebViewDelegate> 

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIView *loaderView;

@property (weak, nonatomic) IBOutlet UILabel *loading;

@property (weak, nonatomic) IBOutlet FLAnimatedImageView *loader;

@end
