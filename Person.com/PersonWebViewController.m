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
    
    [self.loading setFont:[UIFont fontWithName:@"OpenSans-Bold" size:18]];
    [self.loading setText:@"LOADING"];
    self.loading.textColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
