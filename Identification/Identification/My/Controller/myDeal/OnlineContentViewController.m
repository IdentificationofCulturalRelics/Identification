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
    
    [self initData];
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
    
    NSString *str;
    for (int i = 0; i<4; i++) {
        OnlineIdentifyTableViewCell *cell = [[OnlineIdentifyTableViewCell alloc] init];
        [_identifyHistoryCells addObject:cell];
        switch (i) {
            case 0:
                str = @"微信将开发一个新的形态";
                break;
            case 1:
                str = @"外界认为，微信已经有了一种OS（操作系统）的感觉。“应用号”以一款轻量级应用的姿态可能成为连接一切";
                break;
            case 2:
                str = @"1月11日微信公开课PRO版活动上，腾讯公司高级执行副总裁、微信事业群总裁张小龙首次公开演讲。";
                break;
            default:
                str = @"1月11日微信公开课PRO版活动上，腾讯公司高级执行副总裁、微信事业群总裁张小龙首次公开演讲。并透露微信将开发一个新的形态，叫做应用号。外界认为，微信已经有了一种OS（操作系统）的感觉。“应用号”以一款轻量级应用的姿态可能成为连接一切的底层。";
                break;
        }

        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:str,@"referenceComments",@"2016.1.10",@"identifyDate",@"",@"imgLeft",@"",@"imgMiddle",@"",@"imgRight",@"真品",@"commentResult", nil];
        OnlineIdentifyModel *model = [OnlineIdentifyModel statusWithDictionary:dic];
        [_compareIdentifyModels addObject:model];
    }
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _compareIdentifyModels.count;
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
    OnlineIdentifyModel *status=_compareIdentifyModels[indexPath.section];
    cell.status=status;
    return cell;
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //KCStatusTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    OnlineIdentifyTableViewCell *cell= _identifyHistoryCells[indexPath.row];
    cell.status=_compareIdentifyModels[indexPath.section];
   // return cell.height;
    
    return cell.height;
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
