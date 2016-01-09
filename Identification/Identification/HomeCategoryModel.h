//
//  HomeCategoryModel.h
//  Identification
//
//  Created by 朴文一 on 16/1/8.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeCategoryModel : NSObject

@property (nonatomic, strong) NSArray *attribute_list;
@property (nonatomic, strong) NSString *flows_remark;
@property (nonatomic, strong) NSString *flows_imageurl;
@property (nonatomic, strong) NSString *icon_url;
@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, strong) NSString *name;

@end
