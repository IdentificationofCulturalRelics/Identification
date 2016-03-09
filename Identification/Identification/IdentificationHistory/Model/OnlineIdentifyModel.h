//
//  OnlineIdentifyModel.h
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnlineIdentifyModel : NSObject


@property(nonatomic,copy) NSString* referenceComments;//物品描述
@property(nonatomic,copy) NSString* identifyDate;
@property(nonatomic,copy) NSString* imgLeft;
@property(nonatomic,copy) NSString* imgMiddle;
@property(nonatomic,copy) NSString* imgRight;
@property(nonatomic,copy) NSString* commentResult;//鉴定结果

+(OnlineIdentifyModel *)statusWithDictionary:(NSDictionary *)dic;
@end
