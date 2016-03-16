//
//  DeviceOrderTableViewController.h
//  Identification
//
//  Created by wl on 16/3/15.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceOrderTableViewController : UITableViewController
{
    NSMutableArray *_deviceOrderModels;
    NSMutableArray *_deviceOrderCells;
}
@property (weak, nonatomic) IBOutlet UINavigationItem *deviceOrderItem;
- (IBAction)backBtn:(id)sender;

@end
