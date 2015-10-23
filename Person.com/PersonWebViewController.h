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

@interface PersonWebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@property (weak, nonatomic) IBOutlet UILabel *loading;

@property (weak, nonatomic) IBOutlet FLAnimatedImageView *loader;

@end
