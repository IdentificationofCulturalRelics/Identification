//
//  HomeTaobaoViewController.m
//  Identification
//
//  Created by 朴文一 on 16/1/10.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "HomeTaobaoViewController.h"

@interface HomeTaobaoViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation HomeTaobaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    back.frame = CGRectMake(0, 0, 12.5*KScaleWidth*2 , 21*KScaleHeight*2);
    [back setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];//向左移动
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = left;
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight+64)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    [self.view addSubview:_webView];
}
//返回上一页
- (void)back{
    
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:NO];
    
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
