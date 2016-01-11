//
//  CompareIdentifyModel.m
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "CompareIdentifyModel.h"

@implementation CompareIdentifyModel

#pragma mark 根据字典初始化对象
-(CompareIdentifyModel *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.identifyClassName = dic[@"identifyClassName"];
        self.identifyDate = dic[@"identifyDate"];
        self.imgLeft = dic[@"imgLeft"];
        self.imgMiddle = dic[@"imgMiddle"];
        self.imgRight = dic[@"imgRight"];
    }
    return self;
}

#pragma mark 初始化对象（静态方法）
+(CompareIdentifyModel *)statusWithDictionary:(NSDictionary *)dic{
    CompareIdentifyModel *status=[[CompareIdentifyModel alloc]initWithDictionary:dic];
    return status;
}

@end
