//
//  MyBuyingCollectionViewCell.m
//  Identification
//
//  Created by wl on 16/3/16.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "MyBuyingCollectionViewCell.h"

@implementation MyBuyingCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 168*KScaleWidth, 126*KScaleHeight)];
        self.img.image = [UIImage imageNamed:@"category_ceramic@3x.png"];
        [self addSubview:self.img];
        
        NSString *text = @"古董检定仪便携显微镜放大20倍数400倍";
        CGSize textSize=[text boundingRectWithSize:CGSizeMake(160*KScaleWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: detailTextFont} context:nil].size;
        self.desc = [[UILabel alloc] initWithFrame:CGRectMake(8*KScaleWidth, 134*KScaleHeight, textSize.width, textSize.height)];
        self.desc.numberOfLines = 2;
        self.desc.text = text;
        self.desc.font = detailTextFont;
        [self addSubview:self.desc];
        
        self.priceTitle = [[UILabel alloc] initWithFrame:CGRectMake(8*KScaleWidth, 182*KScaleHeight, 56*KScaleWidth, 14*KScaleHeight)];
        [self addSubview:self.priceTitle];
        self.priceTitle.font = detailTextFont;
        self.priceTitle.textColor = [UIColor grayColor];
        self.priceTitle.text = @"成交价:";
        
        self.price = [[UILabel alloc] initWithFrame:CGRectMake(65*KScaleWidth, 177*KScaleHeight, 95*KScaleWidth, 21*KScaleHeight)];
        self.price.textColor = [UIColor redColor];
        self.price.font = titleFont;
        self.price.text = @"389.00";
        [self addSubview:self.price];
        
    }
    return self;
}

@end
