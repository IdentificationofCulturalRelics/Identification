//
//  OnlineContentViewController.m
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "OnlineContentViewController.h"
#import "OnlineIdentifyModel.h"
#import "OnlineIdentifyTableViewCell.h"

@interface OnlineContentViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_identifyHistoryCells;
    NSMutableArray *_compareIdentifyModels;
}


@end

@implementation OnlineContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _OnlineTableView.delegate = self;
    _OnlineTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 加载数据
-(void)initData{
    _identifyHistoryCells=[[NSMutableArray alloc]init];
    _compareIdentifyModels=[[NSMutableArray alloc]init];
    //    [_identifyHistoryCells addObject:nil];
    
    for (int i = 0; i<3; i++) {
        OnlineIdentifyTableViewCell *cell = [[OnlineIdentifyTableViewCell alloc] init];
        [_identifyHistoryCells addObject:cell];
    }
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    OnlineIdentifyTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[OnlineIdentifyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置微博，以便重新布局
    OnlineIdentifyModel *status=_compareIdentifyModels[indexPath.row];
    cell.status=status;
    return cell;
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //KCStatusTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    OnlineIdentifyTableViewCell *cell= _identifyHistoryCells[indexPath.row];
    cell.status=_identifyHistoryCells[indexPath.row];
   // return cell.height;
    
    return 138*KScaleHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8*KScaleHeight;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
