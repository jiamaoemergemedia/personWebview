//
//  PersonWebViewController.h
//  Person.com
//
//  Created by Jiamao Zheng on 10/23/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonWebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIImageView *loader;
@property (weak, nonatomic) IBOutlet UILabel *loading;


@end
