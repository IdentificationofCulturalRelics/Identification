//
//  DeviceOrderTableViewController.m
//  Identification
//
//  Created by wl on 16/3/15.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "DeviceOrderTableViewController.h"
#import "DeviceOrderModel.h"
#import "DeviceOrderTableViewCell.h"

@interface DeviceOrderTableViewController ()

@end

@implementation DeviceOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(152*KScaleWidth, 32*KScaleHeight, 72*KScaleWidth, 19*KScaleHeight)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"设备订单"];
    customLab.font = titleFont;
    _deviceOrderItem.titleView = customLab;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 加载数据
-(void)initData{
    _deviceOrderModels=[[NSMutableArray alloc]init];
    _deviceOrderCells=[[NSMutableArray alloc]init];
    //    [_identifyHistoryCells addObject:nil];
    
    NSString *str;
    for (int i = 0; i<5; i++) {
        DeviceOrderTableViewCell *cell = [[DeviceOrderTableViewCell alloc] init];
        [_deviceOrderCells addObject:cell];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"img",@"如何鉴定晚清均要变成全美品天球瓶的真伪成色",@"title",@"",@"price",@"",@"time",nil];
        DeviceOrderModel *model = [DeviceOrderModel statusWithDictionary:dic];
        [_deviceOrderModels addObject:model];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"UITableViewCellDeviceOrderKey";
    DeviceOrderTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[DeviceOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置，以便重新布局
    DeviceOrderModel *status=_deviceOrderModels[indexPath.row];
    cell.status=status;
    return cell;
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //KCStatusTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    DeviceOrderTableViewCell *cell= _deviceOrderCells[indexPath.row];
    cell.status=_deviceOrderModels[indexPath.section];
    // return cell.height;
    
    return cell.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
