//
//  OnlineIdentifyTableViewCell.h
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OnlineIdentifyModel;


@interface OnlineIdentifyTableViewCell : UITableViewCell{
    UIImageView *_imageLeft;
    UIImageView *_imageMiddle;
    UIImageView *_imgeRight;
    UILabel *_goodsTitle;
    UILabel *_identifyDate;
    UILabel *_goodsComment;
    UILabel *_goodsResult;
}

#pragma mark cell对象
@property (nonatomic,strong) OnlineIdentifyModel *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;

@end
