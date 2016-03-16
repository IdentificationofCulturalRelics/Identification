//
//  ContentViewController.m
//  Identification
//
//  Created by wl on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "ContentViewController.h"
#import "CompareIdentifyTableViewCell.h"
#import "CompareIdentifyModel.h"

@interface ContentViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_identifyHistoryCells;
    NSMutableArray *_compareIdentifyModels;
}

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _HistoryTableView.delegate = self;
    _HistoryTableView.dataSource = self;
    
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
        CompareIdentifyTableViewCell *cell = [[CompareIdentifyTableViewCell alloc] init];
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
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:str,@"identifyClassName",@"2016.1.10",@"identifyDate",@"",@"imgLeft",@"",@"imgMiddle",@"",@"imgRight", nil];
        CompareIdentifyModel *model = [CompareIdentifyModel statusWithDictionary:dic];
        [_compareIdentifyModels addObject:model];
    }
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"%d",_compareIdentifyModels.count);
    return _compareIdentifyModels.count;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    CompareIdentifyTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[CompareIdentifyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(del:) forControlEvents:UIControlEventTouchUpInside];
        [cell setDeleteButton:btn];
        btn.tag = indexPath.section;
    }
    //在此设置微博，以便重新布局
    CompareIdentifyModel *status=_compareIdentifyModels[indexPath.row];
    cell.status=status;
    return cell;
}

-(void)del:(UIButton*)button{
    NSLog(@"del click");
    [_compareIdentifyModels removeObjectAtIndex:button.tag];
    [self.HistoryTableView reloadData];
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //KCStatusTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    CompareIdentifyTableViewCell *cell= _identifyHistoryCells[indexPath.row];
    cell.status=_compareIdentifyModels[indexPath.row];
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
