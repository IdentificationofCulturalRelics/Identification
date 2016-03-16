//
//  DeviceOrderModel.h
//  Identification
//
//  Created by wl on 16/3/16.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceOrderModel : NSObject

@property(nonatomic,copy) NSString* imgUrl;
@property(nonatomic,copy) NSString* titleStr;
@property(nonatomic,copy) NSString* priceStr;
@property(nonatomic,copy) NSString* timeStr;
+(DeviceOrderModel *)statusWithDictionary:(NSDictionary *)dic;
@end
