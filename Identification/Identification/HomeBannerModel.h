//
//  HomeBannerModel.h
//  Identification
//
//  Created by 朴文一 on 16/1/8.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeBannerModel : NSObject

@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, assign) NSInteger orderby;
@property (nonatomic, strong) NSString *image_url;
@property (nonatomic, strong) NSString *scheme_url;
@property (nonatomic, strong) NSString *title;

@end
