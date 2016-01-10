//
//  ListViewController.h
//  Identification
//
//  Created by wl on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewPagerController.h"
@interface ListViewController : ViewPagerController<ViewPagerDataSource, ViewPagerDelegate>
- (IBAction)identityHistoryReturn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *identityHistoryOutlet;

@end
