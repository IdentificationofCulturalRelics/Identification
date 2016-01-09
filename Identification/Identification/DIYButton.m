//
//  DIYButton.m

//
//  Created by 朴文一 on 15/12/30.
//  Copyright © 2015年 com.wd.ios.app. All rights reserved.
//

#import "DIYButton.h"

@implementation DIYButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setFrame:(CGRect)frame
{
    _width = 60*KScaleWidth;
    
    
    self.iconImageView.frame = CGRectMake(0, 0 ,_width, _width);
    self.iconImageView.layer.cornerRadius = self.iconImageView.width / 2;
    self.iconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:_iconImageView];
    
    self.selectIconImageView.frame = self.iconImageView.frame;
    self.selectIconImageView.hidden = YES;
    [self addSubview:_selectIconImageView];
    
    
    self.textLabel.frame = CGRectMake(0 , _width+8*KScaleHeight, _width, 12*KScaleHeight);
    self.textLabel.textAlignment =NSTextAlignmentCenter;
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.font =[UIFont systemFontOfSize:12*KScaleWidth];
    [self addSubview:_textLabel];
    
    
    //调用父类的方法
    [super setFrame:frame];
}


#pragma mark -  selectState
- (void)setSelected:(BOOL)selected
{
    self.selectIconImageView.hidden = !_selectIconImageView.hidden;
    
    self.iconImageView.hidden = !_iconImageView.hidden;
    
    [super setSelected:selected];
    
}

- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _width, _width)];
    }
    return _iconImageView;
}

- (UIImageView *)selectIconImageView{
    if (_selectIconImageView == nil) {
        self.selectIconImageView = [[UIImageView alloc]initWithFrame:self.iconImageView.frame];
    }
    return _selectIconImageView;
}

- (UILabel *)textLabel{
    if (_textLabel == nil) {
        self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0 , _width+8*KScaleHeight, _width, 12*KScaleHeight)];
    }
    return _textLabel;
}

@end
