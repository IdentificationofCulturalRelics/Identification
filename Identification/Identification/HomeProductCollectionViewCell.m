//
//  HomeProductCollectionViewCell.m
//  Identification
//
//  Created by 朴文一 on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "HomeProductCollectionViewCell.h"

@implementation HomeProductCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 168*KScaleWidth, 126*KScaleHeight)];
//        self.imageView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_imageView];
        

        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(8*KScaleWidth, self.imageView.y +self.imageView.height+10*KScaleHeight, 168*KScaleWidth, 42*KScaleHeight)];
        self.label.font = [UIFont systemFontOfSize:14*KScaleWidth];
        self.label.textColor = [UIColor blackColor];
        self.label.numberOfLines = 0;
        [self.contentView addSubview:_label];
        
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(8*KScaleWidth,self.label.y+42*KScaleHeight, 168*KScaleWidth/2, 32*KScaleHeight)];
        self.priceLabel.font = [UIFont systemFontOfSize:20*KScaleWidth];
        self.priceLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_priceLabel];
        
        self.salenumLabel = [[UILabel alloc]initWithFrame:CGRectMake(8*KScaleWidth+self.priceLabel.width,self.label.y+42*KScaleHeight, 168*KScaleWidth/2, 32*KScaleHeight)];
        self.salenumLabel.font = [UIFont systemFontOfSize:12*KScaleWidth];
        self.salenumLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_salenumLabel];
        
        
    }
    
    return self;
}

@end
