//
//  authority authority AuthorityViewController.h
//  Collection
//
//  Created by wl on 16/1/9.
//  Copyright © 2016年 wl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface authority_authority_AuthorityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    CGRect rect ;
}

@property (weak, nonatomic) IBOutlet UITableView *authorityTableView;


@end
