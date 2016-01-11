//
//  CompareIdentifyTableViewCell.m
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "CompareIdentifyTableViewCell.h"
#import "CompareIdentifyModel.h"

@implementation CompareIdentifyTableViewCell

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
    }
    return self;
}

#pragma mark 初始化视图
-(void)initSubView{
    
    _imageLeft = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageLeft];
    _imageMiddle = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageMiddle];
    _imgeRight = [[UIImageView alloc] init];
    [self.contentView addSubview:_imgeRight];
    
    _identifyClass = [[UILabel alloc] init];
    //_identifyClass.textColor = [UIColor grayColor];
    _identifyClass.font = detailTextFont;
    [self.contentView addSubview:_identifyClass];
    
    _identifyDate = [[UILabel alloc] init];
    //_identifyDate.textColor = [UIColor grayColor];
    _identifyDate.font = HelveticaNeueTextFont;
    [self.contentView addSubview:_identifyDate];
    
    _removeCell = [[UIButton alloc] init];
    _removeCell.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_removeCell];
    
    _identifyAgain= [[UIButton alloc] init];
    //_identifyAgain.backgroundColor = [UIColor redColor];
    [_identifyAgain setTitleColor:Font999999 forState:UIControlStateNormal];
    //[_removeCell setTitle:detailTextFont forState:UIControlStateNormal];
    _identifyAgain.titleLabel.font = detailTextFont;
    _identifyAgain.layer.borderWidth = 1;
    _identifyAgain.layer.borderColor = [Font999999 CGColor];
    [self.contentView addSubview:_identifyAgain];
}

-(void)setStatus:(CompareIdentifyModel*)Model{
    CGRect rt = CGRectMake(16*KScaleWidth, 16*KScaleWidth, 187*KScaleWidth, 14*KScaleHeight);
    _identifyClass.frame = rt;
    _identifyClass.text = [NSString stringWithFormat:@"鉴定种类: %@",Model.identifyClassName];
    
    rt = CGRectMake(289*KScaleWidth, 16*KScaleWidth, 70*KScaleWidth, 17*KScaleHeight);
    _identifyDate.frame = rt;
    //_identifyDate.backgroundColor = [UIColor redColor];
    _identifyDate.text = @"2015.12.14";
    //_identifyDate.text = Model.identifyDate;
    
    rt = CGRectMake(16*KScaleWidth, 38*KScaleHeight, 108*KScaleWidth, 60*KScaleHeight);
    _imageLeft.frame = rt;
    _imageLeft.backgroundColor = [UIColor yellowColor];
    _imageLeft.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:Model.imgLeft]]];
    
    rt = CGRectMake(132*KScaleWidth, 38*KScaleHeight, 108*KScaleWidth, 60*KScaleHeight);
    _imageMiddle.frame = rt;
    _imageMiddle.backgroundColor = [UIColor yellowColor];
    _imageMiddle.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:Model.imgMiddle]]];
    
    rt = CGRectMake(252*KScaleWidth, 38*KScaleHeight, 108*KScaleWidth, 60*KScaleHeight);
    _imgeRight.frame = rt;
    _imgeRight.backgroundColor = [UIColor yellowColor];
    _imgeRight.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:Model.imgRight]]];
    
    rt = CGRectMake(16*KScaleWidth, 106*KScaleHeight, 72*KScaleWidth, 24*KScaleHeight);
    _identifyAgain.frame = rt;
    [_identifyAgain setTitle:@"重新鉴定" forState:UIControlStateNormal];
    
    rt = CGRectMake(344*KScaleWidth, 106*KScaleHeight, 15*KScaleWidth, 15*KScaleHeight);
    _removeCell.frame = rt;
    [_removeCell setTitle:@"remove" forState:UIControlStateNormal];
}

@end
