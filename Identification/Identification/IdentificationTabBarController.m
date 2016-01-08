//
//  IdentificationTabBarController.m
//  Identification
//
//  Created by 朴文一 on 16/1/8.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "IdentificationTabBarController.h"
#import "IdentificationNavigationController.h"
#import "HomeRootViewController.h"
#import "IdentificationRootViewController.h"

@interface IdentificationTabBarController ()<UITabBarControllerDelegate>

@end

@implementation IdentificationTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    IdentificationNavigationController *home = [[IdentificationNavigationController alloc]initWithRootViewController:[[HomeRootViewController alloc]init]];
    home.title = @"主页";
    home.tabBarItem.image = [UIImage imageNamed:@"ic_mainpage"];
    home.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_mainpage_c"];
    
    IdentificationRootViewController *IdentificationVC = [[IdentificationRootViewController alloc]init];
    IdentificationNavigationController *Identification = [[IdentificationNavigationController alloc]initWithRootViewController:IdentificationVC];
    Identification.title = @"鉴定";
    Identification.tabBarItem.image = [UIImage imageNamed:@"ic_new"];
    Identification.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_new_c"];
//
//    NewRootViewController *newVC2 = [[NewRootViewController alloc]init];
//    
//    IdentificationNavigationController *hot = [[IdentificationNavigationController alloc]initWithRootViewController:newVC2];
//    newVC2.title = @"最热";
//    hot.tabBarItem.image = [UIImage imageNamed:@"ic_hot"];
//    hot.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_hot_c"];
//    
//    IdentificationNavigationController *theme = [[IdentificationNavigationController alloc]initWithRootViewController:[[ThemeRootViewController alloc]init]];
//    theme.title = @"主题";
//    theme.tabBarItem.image = [UIImage imageNamed:@"ic_theme"];
//    theme.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_theme_c"];
//    
//    IdentificationNavigationController *my = [[IdentificationNavigationController alloc]initWithRootViewController:[[MyRootViewController alloc]init]];
//    my.title = @"我的";
//    my.tabBarItem.image = [UIImage imageNamed:@"ic_mine"];
//    my.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_mine_c"];
//    
    self.viewControllers = @[home,Identification];
    
    self.delegate = self;

}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    UIViewController *tbSelectedController = tabBarController.selectedViewController;
    if ([tbSelectedController isEqual:viewController]) {
        return NO;
    }
    return YES;
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
