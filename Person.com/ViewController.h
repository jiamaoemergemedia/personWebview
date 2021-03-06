//
//  ViewController.h
//  Person.com
//
//  Created by Jiamao Zheng on 10/23/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonInternetConnection.h"
#import "PersonAPIVersion.h"
#import "GAI+ScreenName.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *pleaseUpdate;
@property (weak, nonatomic) IBOutlet UILabel *inOrderTo;
@property (weak, nonatomic) IBOutlet UIButton *updateNowButton;
@property (strong, nonatomic) PersonAPIVersion *apiVersion;

- (IBAction)updateNow:(UIButton *)sender;

@end

