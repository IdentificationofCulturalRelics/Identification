//
//  IdentificationCollectionReusableView.m
//  Identification
//
//  Created by 朴文一 on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "IdentificationCollectionReusableView.h"

@implementation IdentificationCollectionReusableView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.redView = [[UIView alloc]initWithFrame:CGRectMake(16*KScaleWidth, 15*KScaleHeight, 4*KScaleWidth, 12*KScaleHeight)];
        self.redView.backgroundColor = [UIColor redColor];
        [self addSubview:_redView];
        self.categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.redView.x+self.redView.width+4*KScaleWidth, self.redView.y, 56*KScaleWidth, 14*KScaleHeight)];
        self.categoryLabel.font = [UIFont systemFontOfSize:14*KScaleWidth];
        [self addSubview:_categoryLabel];
    }
    return self;
}

- (void)setText:(NSString *)text
{
    self.categoryLabel.text = text;
}

@end
