//
//  DeviceOrderTableViewCell.h
//  Identification
//
//  Created by wl on 16/3/15.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceOrderModel.h"

@interface DeviceOrderTableViewCell : UITableViewCell
{
    UIImageView *_leftImg;
    UILabel *_titleLabel;
    UILabel *_priceLabel;
    UILabel *_timeLabel;
}
#pragma mark cell对象
@property (nonatomic,strong) DeviceOrderModel *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;
@end
