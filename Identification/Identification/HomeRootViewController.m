//
//  HomeRootViewController.m
//  Identification
//
//  Created by 朴文一 on 16/1/8.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "HomeRootViewController.h"
#import "HomeBannerModel.h"
#import "HomeCategoryModel.h"
#import "HomeTrainModel.h"
#import "HomeProductModel.h"

@interface HomeRootViewController ()<UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIScrollView *backgroundScollView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *banner_list;
@property (nonatomic, strong) NSMutableArray *category_list;
@property (nonatomic, strong) NSMutableArray *train_list;
@property (nonatomic, strong) NSMutableArray *product_list;

@end

static NSString *cellIdentifier = @"cell";
static NSString *cellIdentifier2 = @"cell2";
static int page = 0;

@implementation HomeRootViewController
- (void)startTime
{
    if (!self.timer) {
        self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:true];
    }
    [self.timer fire];
}

- (void)stopTime
{
    if (self.timer.isValid) {
        [self.timer invalidate];
    }
    self.timer=nil;
}
- (void)timeAction{
    if (page == self.banner_list.count) {
        page = 0;
    }
    self.scrollView.contentOffset = CGPointMake(KScreenWidth*page, 0);
    self.pageControl.currentPage = page  ;
    page += 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"卡兰德";
    self.banner_list = [NSMutableArray array];
    self.category_list = [NSMutableArray array];
    self.train_list = [NSMutableArray array];
    self.product_list = [NSMutableArray array];
    //网络风火轮开启
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:@"http://api.kalande.lingdianqi.com/index/index" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSMutableDictionary *contentDic = [responseObject objectForKey:@"content"];

        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"banner_list"]) {
            HomeBannerModel *model = [[HomeBannerModel alloc]init];
            [model setValuesForKeysWithDictionary:Dic];
            [self.banner_list addObject:model];
        }
        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"category_list"]) {
            HomeCategoryModel *model = [[HomeCategoryModel alloc]init];
            [model setValuesForKeysWithDictionary:Dic];
            [self.category_list addObject:model];
        }
        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"train_list"]) {
            HomeTrainModel *model = [[HomeTrainModel alloc]init];
            [model setValuesForKeysWithDictionary:Dic];
            [self.train_list addObject:model];
        }
        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"product_list"]) {
            HomeProductModel *model = [[HomeProductModel alloc]init];
            [model setValuesForKeysWithDictionary:Dic];
            [self.product_list addObject:model];
        }
        
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth,109*KScaleHeight)];
        self.scrollView.contentSize = CGSizeMake(KScreenWidth * self.banner_list.count, 0);
        self.scrollView.delegate = self;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.backgroundColor = [UIColor greenColor];
        //    self.scrollView.showsHorizontalScrollIndicator = NO;
        [self.backgroundScollView addSubview:self.scrollView];
        
        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.scrollView.y+self.scrollView.height -30, KScreenWidth, 30)];
        self.pageControl.backgroundColor = [UIColor clearColor];
        self.pageControl.numberOfPages = self.banner_list.count;
        self.pageControl.userInteractionEnabled = NO;
        [self.backgroundScollView addSubview:_pageControl];
        [self startTime];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"网络连接失败");
    }];
    
    self.backgroundScollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth,KScreenHeight)];
    self.backgroundScollView.contentSize = CGSizeMake(0, 2*KScreenHeight);
    self.backgroundScollView.delegate = self;
//    self.backgroundScollView.showsHorizontalScrollIndicator = NO;
    self.backgroundScollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.backgroundScollView];
    
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

@end
