//
//  OnlineIdentifyModel.m
//  Identification
//
//  Created by wl on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "OnlineIdentifyModel.h"

@implementation OnlineIdentifyModel


#pragma mark 根据字典初始化对象
-(OnlineIdentifyModel *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.referenceComments = dic[@"referenceComments"];
        self.identifyDate = dic[@"identifyDate"];
        self.imgLeft = dic[@"imgLeft"];
        self.imgMiddle = dic[@"imgMiddle"];
        self.imgRight = dic[@"imgRight"];
        self.commentResult = dic[@"commentResult"];
    }
    return self;
}

#pragma mark 初始化对象（静态方法）
+(OnlineIdentifyModel *)statusWithDictionary:(NSDictionary *)dic{
    OnlineIdentifyModel *status=[[OnlineIdentifyModel alloc]initWithDictionary:dic];
    return status;
}

@end
