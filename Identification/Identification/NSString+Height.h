//
//  NSString+Height.h
//  B
//
//  Created by 朴文一 on 15/11/26.
//  Copyright © 2015年 朴文一. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Height)
-(CGSize)heightWithString:(NSString *)string width:(CGFloat)width font:(UIFont *)font;
@end
