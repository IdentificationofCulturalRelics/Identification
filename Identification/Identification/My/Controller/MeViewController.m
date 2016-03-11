//
//  MeViewController.m
//  Collection
//
//  Created by wl on 16/1/8.
//  Copyright © 2016年 wl. All rights reserved.
//

#import "MeViewController.h"
#import "SettingViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _MeTableView.delegate = self;
    _MeTableView.dataSource = self;
    groupCell1 = [NSArray arrayWithObjects:@"我的权限",@"设备订单",@"我的交易",@"鉴定记录", nil];
    groupCell2 = [NSArray arrayWithObjects:@"设置",@"意见反馈", nil];
    groupImage = [NSArray arrayWithObjects:@"common_jurisdiction@3x.png",@"common_order copy@3x.png",@"common_order@3x.png",@"common_myappraisal@3x.png",@"common_set@3x.png",@"common_feedback@3x.png", nil];
    _loginLabel.font = textFont;
    if (haveLogin) {
        _loginLabel.hidden = YES;
    }
    else{
        _nameLabel.hidden = YES;
        _scoreLabel.hidden = YES;
        _loveLabel.hidden = YES;
        _segueOutlet.hidden = YES;
    }
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


#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return 2;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%li)行数",(long)section);
    if (section == 0) {
        return 4;
    }
    else if(section == 1)
        return 2;
    return 1;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier: SimpleTableIdentifier];
        //设定附加视图
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
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
    cell.textLabel.font = textFont;
//   cell.imageView.highlightedImage=[UIImage imageNamed:@"Back Arrow Copy@3x.png"];//选中cell后的图片
//    cell.textLabel.text=[[self.myDic objectForKey:[[self.myDic allKeys]objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [groupCell1 objectAtIndex:indexPath.row];
            cell.imageView.image=[UIImage imageNamed:[groupImage objectAtIndex:indexPath.row]];//未选cell时的图片
            break;
            
        default:
            cell.textLabel.text = [groupCell2 objectAtIndex:indexPath.row];
            cell.imageView.image=[UIImage imageNamed:[groupImage objectAtIndex:indexPath.row+4]];//未选cell时的图片
            break;
    }
    return cell;
}
//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8*KScaleHeight;//section头部高度
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if (indexPath.row == 0) {
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            //由storyboard根据myView的storyBoardID来获取我们要切换的视图
            SettingViewController *SettingView = [story instantiateViewControllerWithIdentifier:@"authorityVC"];
            [self presentViewController:SettingView animated:YES completion:nil];
        }
        if (indexPath.row == 3) {
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            //由storyboard根据myView的storyBoardID来获取我们要切换的视图
            SettingViewController *SettingView = [story instantiateViewControllerWithIdentifier:@"identityNV"];
            [self presentViewController:SettingView animated:YES completion:nil];
        }
    }
    else{
        if (indexPath.row == 0) {
            //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard,
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            //由storyboard根据myView的storyBoardID来获取我们要切换的视图
            SettingViewController *SettingView = [story instantiateViewControllerWithIdentifier:@"settingVC"];
            [self presentViewController:SettingView animated:YES completion:nil];
        }
    }
}

/*
#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%i）名称",section);
    KCContactGroup *group=_contacts[section];
    return group.name;
}

#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"生成尾部（组%i）详情",section);
    KCContactGroup *group=_contacts[section];
    return group.detail;
}
 */

- (IBAction)segueClick:(id)sender {
}
@end
