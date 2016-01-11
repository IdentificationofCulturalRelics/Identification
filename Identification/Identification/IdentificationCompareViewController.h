//
//  IdentificationCompareViewController.h
//  Identification
//
//  Created by 朴文一 on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCategoryModel.h"

@interface IdentificationCompareViewController : UIViewController

@property (nonatomic, assign) BOOL isOnline;
@property (nonatomic, strong) HomeCategoryModel *model;

@end
