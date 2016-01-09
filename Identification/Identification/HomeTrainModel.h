//
//  HomeTrainModel.h
//  Identification
//
//  Created by 朴文一 on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeTrainModel : NSObject

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *category_name;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, strong) NSString *image_url;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *vedio_url;
@property (nonatomic, assign) NSInteger viewnum;

@end
