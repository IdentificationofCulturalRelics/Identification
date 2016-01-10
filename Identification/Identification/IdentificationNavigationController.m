//
//  IdentificationNavigationController.m
//  Identification
//
//  Created by 朴文一 on 16/1/8.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "IdentificationNavigationController.h"

@interface IdentificationNavigationController ()

@end

@implementation IdentificationNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationBar.translucent = NO;
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:103/255.0 green:144/255.0 blue:171/255.0 alpha:1]];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;
    
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
