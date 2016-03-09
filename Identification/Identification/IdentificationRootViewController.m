//
//  IdentificationRootViewController.m
//  Identification
//
//  Created by 朴文一 on 16/1/8.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "IdentificationRootViewController.h"
#import "DIYButton.h"
#import "HomeTrainTableViewCell.h"
#import "HomeTrainModel.h"
#import "IdentificationCompareViewController.h"
#import "HomeAllCategoryListViewController.h"

#import "ListViewController.h"

static NSString *cellIdentifier = @"cell";

@interface IdentificationRootViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *buttonView;
@property (nonatomic, strong) DIYButton *diyButton;
@property (nonatomic, strong) UITableView *trainTableView;
@property (nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation IdentificationRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.modelArray = [NSMutableArray array];
    self.view.backgroundColor = [UIColor grayColor];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:HOME_URL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSMutableDictionary  *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"网络连接成功");
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSMutableDictionary *contentDic = [dic objectForKey:@"content"];
        
        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"train_list"]) {
            HomeTrainModel *model = [[HomeTrainModel alloc]init];
            [model setValuesForKeysWithDictionary:Dic];
            [self.modelArray addObject:model];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.trainTableView reloadData];
        });
        
    }] resume];
    //搜索按钮
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setImage:[UIImage imageNamed:@"ic_search"] forState:UIControlStateNormal];
    searchButton.frame = CGRectMake(0, 0, 50, 50);
    [searchButton setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, -20)];//向右移动
    [searchButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    
    self.buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 112*KScaleHeight)];
    self.buttonView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_buttonView];
    NSInteger buttonTag = 0;
    for (int j = 0; j<3; j++) {
        self.diyButton = [[DIYButton alloc]initWithFrame:CGRectMake(36*KScaleWidth +62*KScaleWidth*j+60*KScaleWidth*j, 16*KScaleHeight, 60*KScaleWidth, 80*KScaleHeight)];
        self.diyButton.tag = buttonTag++;
        if (self.diyButton.tag == 0) {
            self.diyButton.textLabel.text = @"对比鉴定";
        }else  if (self.diyButton.tag == 1) {
            self.diyButton.textLabel.text = @"在线鉴定";
        }else{
            self.diyButton.textLabel.text = @"鉴定记录";
        }
        [self.diyButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        self.diyButton.iconImageView.backgroundColor = [UIColor redColor];
        [self.buttonView addSubview:_diyButton];
    }
   
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(16*KScaleWidth, self.buttonView.y+self.buttonView.height + 15*KScaleHeight, 4*KScaleWidth, 12*KScaleHeight)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    UILabel *categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(redView.x+redView.width+15*KScaleWidth, redView.y, 56*KScaleWidth, 14*KScaleHeight)];
    categoryLabel.font = [UIFont systemFontOfSize:14*KScaleWidth];
    categoryLabel.text = @"藏品价格参考";
    [categoryLabel sizeToFit];
    [self.view addSubview:categoryLabel];
    
    self.trainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, categoryLabel.y+categoryLabel.height + 15*KScaleHeight, KScreenWidth, KScreenHeight - categoryLabel.y - categoryLabel.height-64)];
    self.trainTableView.dataSource = self;
    self.trainTableView.delegate = self;
    self.trainTableView.rowHeight = (272-10)*KScaleHeight/3;
    self.trainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.trainTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    [self.trainTableView registerClass:[HomeTrainTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:_trainTableView];

}
- (void)search{
    
}
- (void)buttonAction:(DIYButton *)button{
    if (button.tag == 0) {
        IdentificationCompareViewController *compareVc = [[IdentificationCompareViewController alloc]init];
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:compareVc animated:NO];
    }else if(button.tag == 1){
        HomeAllCategoryListViewController *allCategoryListVc = [[HomeAllCategoryListViewController alloc]init];
        allCategoryListVc.isOnline = YES;
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:allCategoryListVc animated:NO];
        
    }
    else if(button.tag == 2){
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //由storyboard根据myView的storyBoardID来获取我们要切换的视图
        ListViewController *SettingView = [story instantiateViewControllerWithIdentifier:@"identityNV"];
        [self presentViewController:SettingView animated:YES completion:nil];
    }

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeTrainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    HomeTrainModel *model = self.modelArray[indexPath.row];
    cell.category_name.text = model.category_name;
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
    cell.price.text = [NSString stringWithFormat:@"¥%.2f",model.price];
    [cell.price sizeToFit];
    cell.timelimit.hidden = YES;
    //    cell.date.text = model.??
    return cell;
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
