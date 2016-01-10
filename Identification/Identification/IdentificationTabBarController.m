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
#import "TrainRootViewController.h"
#import "IdentificationRootViewController.h"
#import "DealRootViewController.h"
#import "MeViewController.h"

@interface IdentificationTabBarController ()<UITabBarControllerDelegate>

@end

@implementation IdentificationTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HomeRootViewController *homeVc =[[HomeRootViewController alloc]init];
    IdentificationNavigationController *home = [[IdentificationNavigationController alloc]initWithRootViewController:homeVc];
    home.title = @"首页";
    homeVc.tabBarItem.image = [UIImage imageNamed:@"ic_mainpage"];
    homeVc.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_mainpage_c"];
    
    IdentificationRootViewController *identificationVC = [[IdentificationRootViewController alloc]init];
    IdentificationNavigationController *identification = [[IdentificationNavigationController alloc]initWithRootViewController:identificationVC];
    identificationVC.title = @"鉴定";
    identificationVC.tabBarItem.image = [UIImage imageNamed:@"ic_new"];
    identificationVC.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_new_c"];

    TrainRootViewController *trainVc = [[TrainRootViewController alloc]init];
    IdentificationNavigationController *train = [[IdentificationNavigationController alloc]initWithRootViewController:trainVc];
    trainVc.title = @"培训";
    trainVc.tabBarItem.image = [UIImage imageNamed:@"ic_hot"];
    trainVc.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_hot_c"];

    DealRootViewController *dealVc = [[DealRootViewController alloc]init];
    IdentificationNavigationController *deal = [[IdentificationNavigationController alloc]initWithRootViewController:dealVc];
    dealVc.title = @"交易";
    dealVc.tabBarItem.image = [UIImage imageNamed:@"ic_theme"];
    dealVc.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_theme_c"];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MeViewController *MeVC = [story instantiateViewControllerWithIdentifier:@"MeVC"];
    IdentificationNavigationController *me = [[IdentificationNavigationController alloc]initWithRootViewController:MeVC];
    me.title = @"我的";
    me.navigationBarHidden = YES;
    me.tabBarItem.image = [UIImage imageNamed:@"ic_mine"];
    me.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_mine_c"];

    self.viewControllers = @[home, identification, train, deal,me];
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
