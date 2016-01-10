//
//  SettingViewController.h
//  Collection
//
//  Created by wl on 16/1/8.
//  Copyright © 2016年 wl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *SettingTableView;

@end
