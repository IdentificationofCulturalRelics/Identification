//
//  HomeTrainModel.m
//  Identification
//
//  Created by 朴文一 on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "HomeTrainModel.h"

@implementation HomeTrainModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"_id"];
    }
}
@end