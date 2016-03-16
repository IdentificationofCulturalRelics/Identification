//
//  SettingViewController.m
//  Collection
//
//  Created by wl on 16/1/8.
//  Copyright © 2016年 wl. All rights reserved.
//

#import "SettingViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

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
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                          reuseIdentifier: SettingTableIdentifier];
        }
        else
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier: SettingTableIdentifier];
        
        switch (indexPath.row) {
            case 0:
                 [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                cell.textLabel.text = @"清除缓存";
                //SDWebImage框架自身计算缓存的实现
                float folderSize = 0;
                folderSize += [[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%fK",folderSize];
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
        cell.textLabel.font = textFont;
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

//#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 72*KScaleHeight;
}

//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;//section头部高度
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return tableView.frame.size.height - 72*3*KScaleHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [[SDImageCache sharedImageCache] cleanDisk];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil){
            NSLog(@"nil;");
        }
        cell.detailTextLabel.text = @"0K";
    }
    else if(indexPath.row == 1){
        //1、创建分享参数         （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
        NSArray* imageArray = @[[UIImage imageNamed:@"appraisal_history@3x.png"]];

        if (imageArray) {
            
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                             images:imageArray
                                                url:[NSURL URLWithString:@"http://mob.com"]
                                              title:@"分享标题"
                                               type:SSDKContentTypeAuto];
            //2、分享（可以弹出我们的分享菜单和编辑界面）
            [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                     items:nil
                               shareParams:shareParams
                       onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                           
                           switch (state) {
                               case SSDKResponseStateSuccess:
                               {
                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                       message:nil
                                                                                      delegate:nil
                                                                             cancelButtonTitle:@"确定"
                                                                             otherButtonTitles:nil];
                                   [alertView show];
                                   break;
                               }
                               case SSDKResponseStateFail:
                               {
                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                                   message:[NSString stringWithFormat:@"%@",error]
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"OK"
                                                                         otherButtonTitles:nil, nil];
                                   [alert show];
                                   break;
                               }
                               default:
                                   break;
                           }
                       }  
             ];}
    }
    else if(indexPath.row == 2){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"kalande" message:@"版本:1.0.0;版权所有" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)settingBackClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
