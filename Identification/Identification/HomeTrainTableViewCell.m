//
//  HomeTrainTableViewCell.m
//  Identification
//
//  Created by 朴文一 on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "HomeTrainTableViewCell.h"

@implementation HomeTrainTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(16*KScaleWidth, 0, 80*KScaleWidth, 60*KScaleHeight)];
        [self.contentView addSubview:_myImageView];
        
        self.category_name = [[UILabel alloc]initWithFrame:CGRectMake(self.myImageView.x+self.myImageView.width+12*KScaleWidth, self.myImageView.y, 259*KScaleWidth, 34*KScaleHeight)];
        self.category_name.font = [UIFont systemFontOfSize:14*KScaleWidth];
        [self.contentView addSubview:_category_name];
        
        self.price = [[UILabel alloc]initWithFrame:CGRectMake(self.category_name.x,self.category_name.y+self.category_name.height+6*KScaleHeight, 168*KScaleWidth/2+8*KScaleWidth, 24*KScaleHeight)];
        self.price.font = [UIFont systemFontOfSize:20*KScaleWidth];
        self.price.textColor = [UIColor redColor];
        [self.contentView addSubview:_price];
        
        self.timelimit = [[UILabel alloc]initWithFrame:CGRectMake(self.price.x+self.price.width,self.price.y+4*KScaleWidth, 25*KScaleWidth, 16*KScaleHeight)];
        self.timelimit.font = [UIFont systemFontOfSize:10*KScaleWidth];
        self.timelimit.textColor = [UIColor whiteColor];
        self.timelimit.text = @"限时";
        self.timelimit.textAlignment = NSTextAlignmentCenter;
        self.timelimit.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_timelimit];
        
        self.date  = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - (16+71)*KScaleWidth,self.price.y, 71*KScaleWidth, 17*KScaleHeight)];
        self.date.font = [UIFont systemFontOfSize:14*KScaleWidth];
        self.date.text = @"2016.01.11";
        self.date.textColor = [UIColor grayColor];
        [self.contentView addSubview:_date];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
