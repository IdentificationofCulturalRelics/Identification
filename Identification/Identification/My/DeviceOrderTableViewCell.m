//
//  DeviceOrderTableViewCell.m
//  Identification
//
//  Created by wl on 16/3/15.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "DeviceOrderTableViewCell.h"

@implementation DeviceOrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark 初始化视图
-(void)initSubView{
    _leftImg = [[UIImageView alloc] init];
    [self.contentView addSubview:_leftImg];
    
    _timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeLabel];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = HelveticaNeueTextFont;
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = detailTextFont;
    [self.contentView addSubview:_titleLabel];
    _titleLabel.numberOfLines = 0;
    
    _priceLabel  = [[UILabel alloc] init];
    [self.contentView addSubview:_priceLabel];
    _priceLabel.font = titleFont;
    _priceLabel.textColor = [UIColor redColor];
}

-(void)setStatus:(DeviceOrderModel*)Model{
    CGSize textSize=[Model.titleStr boundingRectWithSize:CGSizeMake(259*KScaleWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: detailTextFont} context:nil].size;
    CGRect rt = CGRectMake(16*KScaleWidth, 16*KScaleWidth, 80*KScaleWidth, 60*KScaleHeight);
    _leftImg.frame = rt;
    _leftImg.image = [UIImage imageNamed:@"category_agate@3x.png"];
    
     _height = _leftImg.height+16*KScaleHeight;
    
    rt = CGRectMake(108*KScaleWidth, 16*KScaleWidth, textSize.width, textSize.height);
    _titleLabel.frame = rt;
    _titleLabel.text = Model.titleStr;
    
    rt = CGRectMake(109*KScaleWidth, _height - 24*KScaleHeight, 80*KScaleWidth, 24*KScaleHeight);
    _priceLabel.frame = rt;
    _priceLabel.text = @"￥0.00";
    
    rt = CGRectMake(288*KScaleWidth, _height - 21*KScaleHeight, 71*KScaleWidth, 17*KScaleHeight);
    _timeLabel.frame = rt;
    _timeLabel.text = @"2015.09.12";
    
    
}

@end
