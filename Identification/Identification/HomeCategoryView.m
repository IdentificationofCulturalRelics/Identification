//
//  HomeCategoryView.m
//  Identification
//
//  Created by 朴文一 on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "HomeCategoryView.h"

@implementation HomeCategoryView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(16*KScaleWidth, 15*KScaleHeight, 4*KScaleWidth, 12*KScaleHeight)];
        redView.backgroundColor = [UIColor redColor];
        [self addSubview:redView];
        self.categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(redView.x+redView.width+4*KScaleWidth, redView.y, 56*KScaleWidth, 14*KScaleHeight)];
        self.categoryLabel.font = [UIFont systemFontOfSize:14*KScaleWidth];
        self.categoryLabel.text = @"对比鉴定";
        [self addSubview:_categoryLabel];
        
//        NSInteger kwidth = KScreenWidth -16*KScaleWidth
        NSInteger buttonTag = 10;
        for (int i = 0; i<2; i++) {
            for (int j = 0; j<4; j++) {
                self.diyButton = [[DIYButton alloc]initWithFrame:CGRectMake(16*KScaleWidth +34*KScaleWidth*j+60*KScaleWidth*j, 45*KScaleHeight+(16+80)*KScaleHeight*i, 60*KScaleWidth, 80*KScaleHeight)];
                self.diyButton.tag = buttonTag++;
                [self addSubview:_diyButton];
                
            }
        }
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
