//
//  NSString+Height.m
//  B
//
//  Created by 朴文一 on 15/11/26.
//  Copyright © 2015年 朴文一. All rights reserved.
//

#import "NSString+Height.h"

@implementation NSString (Height)
-(CGSize)heightWithString:(NSString *)string width:(CGFloat)width font:(UIFont *)font
{
    CGRect rect =[string boundingRectWithSize:CGSizeMake(width, 10000) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size;
}
@end
