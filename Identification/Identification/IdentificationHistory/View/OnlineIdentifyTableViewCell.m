//
//  OnlineIdentifyTableViewCell.m
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "OnlineIdentifyTableViewCell.h"
#import "OnlineIdentifyModel.h"

#define COMMENT @"参考意见"

@implementation OnlineIdentifyTableViewCell

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
    
    _imageLeft = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageLeft];
    _imageMiddle = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageMiddle];
    _imgeRight = [[UIImageView alloc] init];
    [self.contentView addSubview:_imgeRight];
    
    _goodsTitle = [[UILabel alloc] init];
    _goodsTitle.textColor = [UIColor grayColor];
    _goodsTitle.font = detailTextFont;
    [self.contentView addSubview:_goodsTitle];
    _goodsTitle.numberOfLines = 0;
    
    _identifyDate = [[UILabel alloc] init];
    _identifyDate.textColor = [UIColor grayColor];
    _identifyDate.font = textFont;
    [self.contentView addSubview:_identifyDate];
    
    _goodsComment = [[UILabel alloc] init];
    _goodsComment.textColor = [UIColor grayColor];
    _goodsComment.text = COMMENT;
    _goodsComment.font = detailTextFont;
    [self.contentView addSubview:_goodsComment];
    
    _goodsResult = [[UILabel alloc] init];
    _goodsResult.textColor = [UIColor grayColor];
    _goodsResult.font = detailTextFont;
    [self.contentView addSubview:_goodsResult];
}

-(void)setStatus:(OnlineIdentifyModel*)Model{
    
    CGRect rt;
    
    CGSize textSize=[Model.referenceComments boundingRectWithSize:CGSizeMake(329.6*KScaleWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: detailTextFont} context:nil].size;
    rt = CGRectMake(16*KScaleWidth, 16*KScaleWidth, textSize.width, textSize.height);
    _goodsTitle.frame = rt;
    _goodsTitle.text = Model.referenceComments;
    
    rt = CGRectMake(16*KScaleWidth, textSize.height+16*3*KScaleWidth/2, 108*KScaleWidth, 60*KScaleHeight);
    _imageLeft.frame = rt;
    _imageLeft.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:Model.imgLeft]]];
    _imageLeft.image = [UIImage imageNamed:@"category_bamboo@3x.png"];
    
    rt = CGRectMake(132*KScaleWidth, textSize.height+16*3*KScaleWidth/2, 108*KScaleWidth, 60*KScaleHeight);
    _imageMiddle.frame = rt;
    _imageMiddle.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:Model.imgMiddle]]];
    _imageMiddle.image = [UIImage imageNamed:@"category_gem@3x.png"];
    
    rt = CGRectMake(252*KScaleWidth, textSize.height+16*3*KScaleWidth/2, 108*KScaleWidth, 60*KScaleHeight);
    _imgeRight.frame = rt;
    _imgeRight.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:Model.imgRight]]];
    _imgeRight.image = [UIImage imageNamed:@"category_lacquerware@3x.png"];
    
    rt = CGRectMake(16*KScaleWidth,_imageLeft.frame.size.height + _imageLeft.frame.origin.y+ 16*KScaleWidth, 70*KScaleWidth, 14*KScaleHeight);
    _goodsComment.frame = rt;
    
    rt = CGRectMake(87*KScaleWidth,_imageLeft.frame.size.height + _imageLeft.frame.origin.y + 12*KScaleHeight, 36*KScaleWidth, 19*KScaleHeight);
    _goodsResult.frame = rt;
    _goodsResult.text = @"真品";
    //_goodsResult.text = Model.commentResult;
    
    rt = CGRectMake(289*KScaleWidth, _imageLeft.frame.size.height + _imageLeft.frame.origin.y+ 12*KScaleHeight, 70*KScaleWidth, 17*KScaleHeight);
    _identifyDate.frame = rt;
    //_identifyDate.backgroundColor = [UIColor redColor];
    _identifyDate.text = @"2015.12.14";
    //_identifyDate.text = Model.identifyDate;
    
    _height = _goodsComment.frame.origin.y + _goodsComment.frame.size.height + 13*KScaleHeight;
}


@end
