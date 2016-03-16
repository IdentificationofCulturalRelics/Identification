//
//  DeviceOrderModel.m
//  Identification
//
//  Created by wl on 16/3/16.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "DeviceOrderModel.h"

@implementation DeviceOrderModel

#pragma mark 根据字典初始化对象
-(DeviceOrderModel *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.imgUrl = dic[@"img"];
        self.titleStr = dic[@"title"];
        self.priceStr = dic[@"price"];
        self.timeStr = dic[@"time"];

    }
    return self;
}

#pragma mark 初始化对象（静态方法）
+(DeviceOrderModel *)statusWithDictionary:(NSDictionary *)dic{
    DeviceOrderModel *status=[[DeviceOrderModel alloc]initWithDictionary:dic];
    return status;
}

@end
