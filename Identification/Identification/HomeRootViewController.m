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
#import "HomeCategoryView.h"
#import "HomeTrainTableViewCell.h"
#import "HomeProductCollectionViewCell.h"

@interface HomeRootViewController ()<UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *backgroundScollView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *banner_list;
@property (nonatomic, strong) NSMutableArray *category_list;
@property (nonatomic, strong) NSMutableArray *train_list;
@property (nonatomic, strong) NSMutableArray *product_list;
@property (nonatomic, strong) HomeCategoryView *categoryView;
@property (nonatomic, strong) UITableView *trainTableView;

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
//    self.backgroundScollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth,KScreenHeight)];
//    self.backgroundScollView.contentSize = CGSizeMake(0, 2*KScreenHeight);
//    self.backgroundScollView.delegate = self;
//    //    self.backgroundScollView.showsHorizontalScrollIndicator = NO;
//    self.backgroundScollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.backgroundScollView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //            if (KScreenHeight<667) {
    //                layout.itemSize = CGSizeMake((KScreenWidth-40)/2+2, 494*KScaleHeight);
    //                layout.sectionInset = UIEdgeInsetsMake(20*KScaleHeight, 20*KScaleWidth, 20*KScaleHeight, 20*KScaleWidth);
    //            }else{
    layout.itemSize = CGSizeMake(168*KScaleWidth, 210*KScaleHeight);
    layout.sectionInset = UIEdgeInsetsMake(8*KScaleHeight, 15*KScaleWidth, 8*KScaleHeight, 10*KScaleWidth);
    //            layout.minimumInteritemSpacing = 7*KScaleWidth;
    //            }
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor grayColor];
    [self.collectionView registerClass:[HomeProductCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier2];
    
    [self.view addSubview:_collectionView];
    //网络风火轮开启
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    [session GET:@"http://api.kalande.lingdianqi.com/index/index" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        NSMutableDictionary *contentDic = [responseObject objectForKey:@"content"];
//
//        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"banner_list"]) {
//            HomeBannerModel *model = [[HomeBannerModel alloc]init];
//            [model setValuesForKeysWithDictionary:Dic];
//            [self.banner_list addObject:model];
//        }
//        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"category_list"]) {
//            HomeCategoryModel *model = [[HomeCategoryModel alloc]init];
//            [model setValuesForKeysWithDictionary:Dic];
//            [self.category_list addObject:model];
//        }
//        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"train_list"]) {
//            HomeTrainModel *model = [[HomeTrainModel alloc]init];
//            [model setValuesForKeysWithDictionary:Dic];
//            [self.train_list addObject:model];
//        }
//        for (NSMutableDictionary *Dic in [contentDic objectForKey:@"product_list"]) {
//            HomeProductModel *model = [[HomeProductModel alloc]init];
//            [model setValuesForKeysWithDictionary:Dic];
//            [self.product_list addObject:model];
//        }
//        
//        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth,109*KScaleHeight)];
//        self.scrollView.contentSize = CGSizeMake(KScreenWidth * self.banner_list.count, 0);
//        self.scrollView.delegate = self;
//        self.scrollView.pagingEnabled = YES;
//        self.scrollView.backgroundColor = [UIColor greenColor];
//        //    self.scrollView.showsHorizontalScrollIndicator = NO;
//        [self.backgroundScollView addSubview:self.scrollView];
//        
//        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.scrollView.y+self.scrollView.height -30, KScreenWidth, 30)];
//        self.pageControl.backgroundColor = [UIColor clearColor];
//        self.pageControl.numberOfPages = self.banner_list.count;
//        self.pageControl.userInteractionEnabled = NO;
//        [self.backgroundScollView addSubview:_pageControl];
//        [self startTime];
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        NSLog(@"网络连接失败");
//        NSLog(@"%@",error);
//    }];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://api.kalande.lingdianqi.com/index/index"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSMutableDictionary  *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"网络连接成功");
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

        NSMutableDictionary *contentDic = [dic objectForKey:@"content"];
        
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
        
       
        dispatch_async(dispatch_get_main_queue(), ^{
            self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth,109*KScaleHeight)];
            self.scrollView.contentSize = CGSizeMake(KScreenWidth * self.banner_list.count, 0);
            self.scrollView.delegate = self;
            self.scrollView.pagingEnabled = YES;
            self.scrollView.backgroundColor = [UIColor greenColor];
            //    self.scrollView.showsHorizontalScrollIndicator = NO;
            [self.collectionView addSubview:self.scrollView];
            for (int i = 0 ; i < self.banner_list.count; i ++) {
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth * i, 0, self.scrollView.width, self.scrollView.height)];
                imageView.tag = i;
//                imageView.contentMode = UIViewContentModeScaleAspectFit;
                [imageView sd_setImageWithURL:[NSURL URLWithString:[self.banner_list[i] image_url]]];
                [self.scrollView addSubview:imageView];
            }

            self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.scrollView.y+self.scrollView.height -30, KScreenWidth, 30)];
            self.pageControl.backgroundColor = [UIColor clearColor];
            self.pageControl.numberOfPages = self.banner_list.count;
            self.pageControl.userInteractionEnabled = NO;
            [self.collectionView addSubview:_pageControl];
            [self startTime];
            
            self.categoryView = [[HomeCategoryView alloc]initWithFrame:CGRectMake(0, self.scrollView.height+5, KScreenWidth, 237*KScaleHeight)];
            for (DIYButton *button in self.categoryView.subviews) {
                NSInteger buttonTag = button.tag;
//                NSLog(@"%ld",buttonTag);
                if (buttonTag>=10 && buttonTag<17) {
                button.textLabel.text = [self.category_list[buttonTag-10] name];
                [button.iconImageView sd_setImageWithURL:[NSURL URLWithString:[self.category_list[buttonTag-10] icon_url]]];
                }
                if (buttonTag==17) {
                    button.textLabel.text = @"全部分类";
                    [button.iconImageView sd_setImageWithURL:[NSURL URLWithString:[self.category_list[buttonTag-10] icon_url]]];
                }

            }
            [self.collectionView addSubview:_categoryView];
            self.trainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.categoryView.y+self.categoryView.height + 16*KScaleHeight, KScreenWidth, 272*KScaleHeight)];
            self.trainTableView.dataSource = self;
            self.trainTableView.delegate = self;
            self.trainTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
            [self.collectionView addSubview:_trainTableView];
            
            [self.collectionView reloadData];
            
            UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(16*KScaleWidth, -10, 4*KScaleWidth, 12*KScaleHeight)];
            redView.backgroundColor = [UIColor redColor];
            [self.trainTableView addSubview:redView];
            UILabel *categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(redView.x+redView.width+4*KScaleWidth, redView.y, 56*KScaleWidth, 14*KScaleHeight)];
            categoryLabel.font = [UIFont systemFontOfSize:14*KScaleWidth];
            categoryLabel.text = @"培训知识";
            [self.trainTableView addSubview:categoryLabel];
            
            UIView *redView2 = [[UIView alloc]initWithFrame:CGRectMake(16*KScaleWidth, self.trainTableView.y+self.trainTableView.height + 10*KScaleHeight, 4*KScaleWidth, 12*KScaleHeight)];
            redView2.backgroundColor = [UIColor redColor];
            [self.collectionView addSubview:redView2];
            UILabel *categoryLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(redView2.x+redView2.width+4*KScaleWidth, redView2.y, 56*KScaleWidth, 14*KScaleHeight)];
            categoryLabel2.font = [UIFont systemFontOfSize:14*KScaleWidth];
            categoryLabel2.text = @"精品仪器";
            [self.collectionView addSubview:categoryLabel2];
        });
        
    }] resume];
    
   
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.train_list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    HomeTrainModel *model = self.train_list[indexPath.row];
    cell.textLabel.text = model.title;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
    return cell;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.scrollView.contentOffset.x<=KScreenWidth*(self.banner_list.count-1)) {
        self.pageControl.currentPage = self.scrollView.contentOffset.x/KScreenWidth;
    }else if(self.scrollView.contentOffset.x>=KScreenWidth*5){
        self.scrollView.contentOffset = CGPointMake(0, 0);
        self.pageControl.currentPage =1;
    }
    page = (int)self.pageControl.currentPage;
    [self startTime];
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTime];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.product_list.count+6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier2 forIndexPath:indexPath];
    if (indexPath.row<6) {
//        cell.imageView = nil;
//        cell.label.text = nil;
        cell.hidden = YES;
        return cell;
    }else{
        HomeProductModel *model = self.product_list[indexPath.row-6];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:nil];
        cell.label.text = model.title;
//        [cell.label sizeToFit];
        cell.priceLabel.text = [NSString stringWithFormat:@"¥%.2f",model.price];
        NSString *oldPrice = [NSString stringWithFormat:@"¥%.2f",model.salenum];
        NSUInteger length = [oldPrice length];
        
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:oldPrice];
        [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
        [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, length)];
        [cell.salenumLabel setAttributedText:attri];
        cell.hidden = NO;
        return cell;
    }
    
   
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeProductModel *model = self.product_list[indexPath.row-6];
//    HomeDetailPageViewController *detailVc = [[HomeDetailPageViewController alloc]init];
//    detailVc.url = model.requestURL;
//    self.tabBarController.tabBar.hidden = YES;
//    [self.navigationController pushViewController:detailVc animated:NO];
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
