//
//  IdentificationCollectionReusableView.h
//  Identification
//
//  Created by 朴文一 on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IdentificationCollectionReusableView : UICollectionReusableView

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UILabel *categoryLabel;
@property (nonatomic, strong) UIView *redView;
@end
