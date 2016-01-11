//
//  HomeAllCategoryListViewController.m
//  Identification
//
//  Created by 朴文一 on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "HomeAllCategoryListViewController.h"
#import "DIYButton.h"
#import "HomeCategoryModel.h"
#import "IdentificationCompareViewController.h"

@interface HomeAllCategoryListViewController ()

@property (nonatomic, strong) DIYButton *diyButton;
@property (nonatomic, strong) UIImageView *bannerImageView;

@end

@implementation HomeAllCategoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.isOnline) {
        self.category_list = [NSMutableArray array];
        self.title = @"在线鉴定";
        self.bannerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 110*KScaleHeight)];
        self.bannerImageView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_bannerImageView];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://api.kalande.lingdianqi.com/index/index"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSMutableDictionary  *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"网络连接成功");
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
            NSMutableDictionary *contentDic = [dic objectForKey:@"content"];

            for (NSMutableDictionary *Dic in [contentDic objectForKey:@"category_list"]) {
                HomeCategoryModel *model = [[HomeCategoryModel alloc]init];
                [model setValuesForKeysWithDictionary:Dic];
                [self.category_list addObject:model];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSInteger buttonTag = 0;
                for (int i = 0; i<self.category_list.count/4; i++) {
                    for (int j = 0; j<4; j++) {
                        self.diyButton = [[DIYButton alloc]initWithFrame:CGRectMake(16*KScaleWidth +34*KScaleWidth*j+60*KScaleWidth*j, 45*KScaleHeight+(16+80)*KScaleHeight*i+110*KScaleHeight+18*KScaleHeight*2, 60*KScaleWidth, 80*KScaleHeight)];
                        self.diyButton.tag = buttonTag;
                        if (self.diyButton.tag<16) {
                            self.diyButton.textLabel.text = [self.category_list[buttonTag] name];
                            [self.diyButton.iconImageView sd_setImageWithURL:[NSURL URLWithString:[self.category_list[buttonTag] icon_url]]];
                            [self.diyButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                            [self.view addSubview:_diyButton];
                        }
                        
                        buttonTag++;
                    }
                }

            });
            
        }] resume];


    }else{
        self.title = @"全部分类";
        NSInteger buttonTag = 0;
        for (int i = 0; i<self.category_list.count/4; i++) {
            for (int j = 0; j<4; j++) {
                self.diyButton = [[DIYButton alloc]initWithFrame:CGRectMake(16*KScaleWidth +34*KScaleWidth*j+60*KScaleWidth*j, 64+45*KScaleHeight+(16+80)*KScaleHeight*i, 60*KScaleWidth, 80*KScaleHeight)];
                self.diyButton.tag = buttonTag;
                if (self.diyButton.tag<16) {
                    self.diyButton.textLabel.text = [self.category_list[buttonTag] name];
                    [self.diyButton.iconImageView sd_setImageWithURL:[NSURL URLWithString:[self.category_list[buttonTag] icon_url]]];
                    [self.diyButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                    [self.view addSubview:_diyButton];
                }
                
                buttonTag++;
            }
        }

    }
    //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    back.frame = CGRectMake(0, 0, 12.5*KScaleWidth*2 , 21*KScaleHeight*2);
    [back setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];//向左移动
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = left;
    
    
    
}
- (void)buttonAction:(UIButton *)button{
    if (self.isOnline) {
        IdentificationCompareViewController *compareVc = [[IdentificationCompareViewController alloc]init];
        compareVc.isOnline = YES;
        HomeCategoryModel *model = self.category_list[button.tag];
        compareVc.model = model;
        [self.navigationController pushViewController:compareVc animated:NO];
    }
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
