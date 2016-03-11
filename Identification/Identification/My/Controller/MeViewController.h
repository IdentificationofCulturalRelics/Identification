//
//  MeViewController.h
//  Collection
//
//  Created by wl on 16/1/8.
//  Copyright © 2016年 wl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *groupCell1;
    NSArray *groupCell2;
    NSArray *groupImage;
    BOOL haveLogin;
}
@property (weak, nonatomic) IBOutlet UITableView *MeTableView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *loveLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
- (IBAction)segueClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *segueOutlet;

@end
