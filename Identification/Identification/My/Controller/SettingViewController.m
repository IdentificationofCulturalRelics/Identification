//
//  SettingViewController.m
//  Collection
//
//  Created by wl on 16/1/8.
//  Copyright © 2016年 wl. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _SettingTableView.delegate = self;
    _SettingTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%li)行数",(long)section);
    return 3;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    static NSString *SettingTableIdentifier = @"SettingTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SettingTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier: SettingTableIdentifier];
        
        switch (indexPath.row) {
            case 0:
                 [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
                cell.textLabel.text = @"清除缓存";
                break;
            case 1:
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                cell.textLabel.text = @"推荐给好友";
                break;
            case 2:
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                cell.textLabel.text = @"关于";
                break;
            default:
                 [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                cell.textLabel.text = @"1111";
                break;
        }

        //设定附加视图
//        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        //        UITableViewCellAccessoryNone,                   // 没有标示
        //        UITableViewCellAccessoryDisclosureIndicator,    // 下一层标示
        //        UITableViewCellAccessoryDetailDisclosureButton, // 详情button
        //        UITableViewCellAccessoryCheckmark               // 勾选标记
        
        //设定选中cell时的cell的背影颜色
        cell.selectionStyle=UITableViewCellSelectionStyleBlue;     //选中时蓝色效果
        //        cell.selectionStyle=UITableViewCellSelectionStyleNone; //选中时没有颜色效果
        //        cell.selectionStyle=UITableViewCellSelectionStyleGray;  //选中时灰色效果
        //
        //        //自定义选中cell时的背景颜色
        //        UIView *selectedView = [[UIView alloc] initWithFrame:cell.contentView.frame];
        //        selectedView.backgroundColor = [UIColor orangeColor];
        //        cell.selectedBackgroundView = selectedView;
        //        [selectedView release];
        
        
        //        cell.selectionStyle=UITableViewCellAccessoryNone; //行不能被选中
        
    }
    
    //这是设置没选中之前的背景颜色
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.imageView.image=[UIImage imageNamed:@"1001.jpg"];//未选cell时的图片
    //    cell.imageView.highlightedImage=[UIImage imageNamed:@"1002.jpg"];//选中cell后的图片
    //    cell.textLabel.text=[[self.myDic objectForKey:[[self.myDic allKeys]objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 72*KScaleHeight;
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
