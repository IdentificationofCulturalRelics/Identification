//
//  CompareIdentifyTableViewCell.h
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CompareIdentifyModel;

@interface CompareIdentifyTableViewCell : UITableViewCell{
    UIImageView *_imageLeft;
    UIImageView *_imageMiddle;
    UIImageView *_imgeRight;
    UILabel *_identifyClass;
    UILabel *_identifyDate;
    UIButton * _identifyAgain;
    UIButton *_removeCell;
}

#pragma mark cell对象
@property (nonatomic,strong) CompareIdentifyModel *status;

@end
