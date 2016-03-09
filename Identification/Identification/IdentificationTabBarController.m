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
    homeVc.tabBarItem.image = [UIImage imageNamed:@"tabbar_home@3x.png"];
    homeVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_pressed@3x.png"];
    
    IdentificationRootViewController *identificationVC = [[IdentificationRootViewController alloc]init];
    IdentificationNavigationController *identification = [[IdentificationNavigationController alloc]initWithRootViewController:identificationVC];
    identificationVC.title = @"鉴定";
    identificationVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_evaluate@3x.png"];
    identificationVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_evaluate_pressed@3x.png"];

    TrainRootViewController *trainVc = [[TrainRootViewController alloc]init];
    IdentificationNavigationController *train = [[IdentificationNavigationController alloc]initWithRootViewController:trainVc];
    trainVc.title = @"培训";
    trainVc.tabBarItem.image = [UIImage imageNamed:@"tabbar_train@3x.png"];
    trainVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_train_pressed@3x.png"];

    DealRootViewController *dealVc = [[DealRootViewController alloc]init];
    IdentificationNavigationController *deal = [[IdentificationNavigationController alloc]initWithRootViewController:dealVc];
    dealVc.title = @"交易";
    dealVc.tabBarItem.image = [UIImage imageNamed:@"tabbar_deal@3x.png"];
    dealVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_deal_pressed@3x.png"];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MeViewController *MeVC = [story instantiateViewControllerWithIdentifier:@"MeVC"];
    IdentificationNavigationController *me = [[IdentificationNavigationController alloc]initWithRootViewController:MeVC];
    me.title = @"我的";
    me.navigationBarHidden = YES;
    me.tabBarItem.image = [UIImage imageNamed:@"tabbar_my@3x.png"];
    me.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_my_pressed@3x.png"];

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
