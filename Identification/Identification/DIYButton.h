//
//  DIYButton.h

//
//  Created by 朴文一 on 15/12/30.
//  Copyright © 2015年 com.wd.ios.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIYButton : UIButton

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIImageView *selectIconImageView;
@property (nonatomic, assign) CGFloat width;

@end
