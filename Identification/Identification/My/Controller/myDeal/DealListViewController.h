//
//  DealListViewController.h
//  Identification
//
//  Created by wl on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DealViewPagerController.h"
@interface DealListViewController : DealViewPagerController<DealViewPagerDataSource, DealViewPagerDelegate>
- (IBAction)identityHistoryReturn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *identityHistoryOutlet;

@end