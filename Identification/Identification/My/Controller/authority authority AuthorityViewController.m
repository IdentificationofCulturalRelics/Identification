//
//  authority authority AuthorityViewController.m
//  Collection
//
//  Created by wl on 16/1/9.
//  Copyright © 2016年 wl. All rights reserved.
//

#import "authority authority AuthorityViewController.h"

@interface authority_authority_AuthorityViewController ()

@end

@implementation authority_authority_AuthorityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    rect = [[UIScreen mainScreen] bounds];
    // Do any additional setup after loading the view.
    _authorityTableView.delegate = self;
    _authorityTableView.dataSource = self;
    _deadTime.font = detailTextFont;
    _authorityLevel.font = detailTextFont;
    _loginName.font = textFont;
    _authorityNow.font = detailTextFont;
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
    return 2;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    static NSString *authortyTableIdentifier = @"authortyTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             authortyTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier: authortyTableIdentifier];
        //设定附加视图
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
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
    //    cell.imageView.highlightedImage=[UIImage imageNamed:@"1002.jpg"];//选中cell后的图片
    //    cell.textLabel.text=[[self.myDic objectForKey:[[self.myDic allKeys]objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    CGFloat fontSizeSc = rect.size.width/375;
    UIFont *newFont = [UIFont fontWithName:@"STHeitiTC-Medium" size:16.0*fontSizeSc];
    UIFont *detailFont = [UIFont fontWithName:@"STHeitiTC-Light" size:13.0*fontSizeSc];
    //创建完字体格式之后就告诉cell
    cell.textLabel.font = newFont;
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"初级用户";
                cell.textLabel.textColor = [UIColor redColor];
                cell.textLabel.font = newFont;
                cell.detailTextLabel.text = @"仅提供真伪对比服务";
                cell.detailTextLabel.font = detailFont;
                cell.detailTextLabel.alpha = 0.5;
                cell.detailTextLabel.textColor = [UIColor redColor];
            }
            else{
                cell.textLabel.text = @"高级用户";
                cell.textLabel.font = newFont;
                cell.detailTextLabel.text = @"同时提供真伪对比服务和断代对比服务";
                cell.detailTextLabel.font = detailFont;
                cell.detailTextLabel.alpha = 0.5;
                
            }
            break;
            
        default:
            cell.textLabel.font = newFont;
            if (indexPath.row == 0) {
                cell.textLabel.text = @"一年";
                cell.textLabel.textColor = [UIColor redColor];
            }
            else{
                cell.textLabel.text = @"两年";
            }
            break;
    }
    return cell;

    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(rect.size.width*16/375, 0, rect.size.width, rect.size.height*44/667)];
        headerView.backgroundColor = [UIColor clearColor];
        UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(rect.size.width*16/375, headerView.frame.size.height/3, 4, headerView.frame.size.height/3)];
        redView.backgroundColor = [UIColor redColor];
        UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(rect.size.width*24/375, headerView.frame.size.height/3, 56*rect.size.width/375, headerView.frame.size.height/3)];
        titleView.text = @"开通权限";
        titleView.font = [UIFont fontWithName:@"STHeitiSC-Light" size:14*rect.size.width/375];
        [headerView addSubview:redView];
        [headerView addSubview:titleView];
        return headerView;
    }
    return nil;
}




#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    if (section == 0) {
        return 44*rect.size.height/667;
    }
    return 0;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48*rect.size.height/667;
}

#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 1;
}




- (IBAction)authorityBackClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
