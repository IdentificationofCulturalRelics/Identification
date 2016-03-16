//
//  DealListViewController.m
//  Identification
//
//  Created by wl on 16/1/9.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "DealListViewController.h"
#import "ContentViewController.h"
#import "OnlineContentViewController.h"

#import "MyBuyingCollectionViewController.h"

@interface DealListViewController ()

@end

@implementation DealListViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    
    self.dataSource = self;
    self.delegate = self;
    
    self.title = @"我的交易";
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont boldSystemFontOfSize:18*KScaleWidth],UITextAttributeFont, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    
    
    
    // Keeps tab bar below navigation bar on iOS 7.0+
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(DealViewPagerController *)viewPager {
    return 3;
}
- (UIView *)viewPager:(DealViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    switch (index) {
        case 0:
            label.text = @"我买到的";
            break;
        case 1:
            label.text = @"进行中";
        case 2:
            label.text = @"我卖出的";
        default:
            break;
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    [label sizeToFit];
    
    return label;
}

- (UIViewController *)viewPager:(DealViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    if (index == 0) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(168*KScaleWidth, 210*KScaleHeight);
        // 设置整个collectionView的内边距
        CGFloat paddingX = 14*KScaleWidth;
        CGFloat paddingY = 16*KScaleHeight;
        layout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
        // 设置每一行之间的间距
        //layout.minimumLineSpacing = paddingY;
       // layout.minimumInteritemSpacing = paddingSpacing;
        MyBuyingCollectionViewController *cvc = [[MyBuyingCollectionViewController alloc] initWithCollectionViewLayout:layout];
        line = 2;
        return cvc;
    }
    else if(index == 1) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(168*KScaleWidth, 210*KScaleHeight);
        // 设置整个collectionView的内边距
        CGFloat paddingX = 14*KScaleWidth;
        CGFloat paddingY = 16*KScaleHeight;
        layout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
        // 设置每一行之间的间距
        //layout.minimumLineSpacing = paddingY;
        // layout.minimumInteritemSpacing = paddingSpacing;
        MyBuyingCollectionViewController *cvc = [[MyBuyingCollectionViewController alloc] initWithCollectionViewLayout:layout];
        line = 1;
        return cvc;
    }
    else {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(168*KScaleWidth, 210*KScaleHeight);
        // 设置整个collectionView的内边距
        CGFloat paddingX = 14*KScaleWidth;
        CGFloat paddingY = 16*KScaleHeight;
        layout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
        // 设置每一行之间的间距
        //layout.minimumLineSpacing = paddingY;
        // layout.minimumInteritemSpacing = paddingSpacing;
        MyBuyingCollectionViewController *cvc = [[MyBuyingCollectionViewController alloc] initWithCollectionViewLayout:layout];
        line = 4;
        return cvc;
    }
    return nil;
}

#pragma mark - ViewPagerDelegate
- (CGFloat)viewPager:(DealViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 1.0;
            break;
        case ViewPagerOptionCenterCurrentTab:
            return 0.0;
            break;
        case ViewPagerOptionTabLocation:
            return 1.0;
            break;
        default:
            break;
    }
    
    return value;
}
- (UIColor *)viewPager:(DealViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color {
    
    switch (component) {
        case ViewPagerIndicator:
            return [[UIColor redColor] colorWithAlphaComponent:0.64];
            break;
        default:
            break;
    }
    
    return color;
}


- (IBAction)identityHistoryReturn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
