//
//  ViewController.m
//  Person.com
//
//  Created by Jiamao Zheng on 10/23/15.
//  Copyright (c) 2015 Emerge Media. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Network checking
    if (![PersonInternetConnection isNetworkAvailable]) {
        return;
    }
    
    [self webView];
    
    self.apiVersion = [[PersonAPIVersion alloc]init];
    [self.apiVersion getAppVersion: ^(NSDictionary *dictionary){
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([[dictionary objectForKey:@"current_ios_version"] isEqualToNumber:@2]) {
                NSLog(@"current version = 2");
              [self performSegueWithIdentifier:@"show" sender:self];
            } else {
                NSLog(@"current version > 2");
                [self updateAlert];
            }
        });
    }];
}

-(void) webView{
    self.pleaseUpdate.hidden = YES;
    self.inOrderTo.hidden = YES;
    self.updateNowButton.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:0.0f/255.0f
                                                green:149.0f/255.0f
                                                 blue:255.0f/255.0f
                                                alpha:1.0f];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateAlert{
    self.view.backgroundColor = [UIColor colorWithRed:0.0f/255.0f
                                                green:149.0f/255.0f
                                                 blue:255.0f/255.0f
                                                alpha:1.0f];
    [self.pleaseUpdate setFont:[UIFont fontWithName:@"OpenSans-Bold" size:24]];
    [self.pleaseUpdate setText:@"PLEASE UPDATE"];
    self.pleaseUpdate.textColor = [UIColor whiteColor];
    self.pleaseUpdate.backgroundColor = [UIColor colorWithRed:0.0f/255.0f
                                                        green:149.0f/255.0f
                                                         blue:255.0f/255.0f
                                                        alpha:1.0f];
    
    [self.inOrderTo setFont:[UIFont fontWithName:@"OpenSans" size:18]];
    [self.inOrderTo setText:@"In order to user the latest features, you must update this app."];
    self.inOrderTo.textColor = [UIColor whiteColor];
    self.inOrderTo.backgroundColor = [UIColor colorWithRed:0.0f/255.0f
                                                     green:149.0f/255.0f
                                                      blue:255.0f/255.0f
                                                     alpha:1.0f];
    
    
    [self.updateNowButton setTitle:@"UPDATE NOW" forState:UIControlStateNormal];
    [self.updateNowButton setTitleColor:[UIColor colorWithRed:0.0f/255.0f
                                                        green:149.0f/255.0f
                                                         blue:255.0f/255.0f
                                                        alpha:1.0f] forState:UIControlStateNormal];
    self.updateNowButton.titleLabel.font = [UIFont fontWithName:@"OpenSans-Bold" size:18];
    self.updateNowButton.backgroundColor = [UIColor whiteColor];
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
        }
        if (UIInterfaceOrientationIsLandscape(orientation)) {
            for (UIView *subview in [self.view subviews]) {
                if (subview.tag == 8) {
                    [subview removeFromSuperview];
                }
            }
            view.tag = 9;
        }
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width, 20)];
        view.backgroundColor=[UIColor blackColor];
        [self.view addSubview:view];
    }
}

- (IBAction)updateNow:(UIButton *)sender {
    
    //Network checking
    if (![PersonInternetConnection isNetworkAvailable]) {
        return;
    }
    
}
@end
