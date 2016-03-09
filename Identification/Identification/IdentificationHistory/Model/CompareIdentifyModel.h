//
//  CompareIdentifyModel.h
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompareIdentifyModel : NSObject

@property(nonatomic,copy) NSString* identifyClassName;//鉴定种类
@property(nonatomic,copy) NSString* identifyDate;
@property(nonatomic,copy) NSString* imgLeft;
@property(nonatomic,copy) NSString* imgMiddle;
@property(nonatomic,copy) NSString* imgRight;

+(CompareIdentifyModel *)statusWithDictionary:(NSDictionary *)dic;

@end
