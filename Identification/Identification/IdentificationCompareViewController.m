//
//  IdentificationCompareViewController.m
//  Identification
//
//  Created by 朴文一 on 16/1/11.
//  Copyright © 2016年 com.IdentificationofCulturalRelics. All rights reserved.
//

#import "IdentificationCompareViewController.h"
#import "IdentificationCollectionReusableView.h"
#import "IdentificationTextView.h"

static NSString *cellIdentifier = @"cell";
static NSString *cellIdentifier2 = @"cell2";

static NSString *headerIdentifier = @"header";
static NSString *footerIdentifier = @"footer";

@interface IdentificationCompareViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *modelArray1;
@property (nonatomic, strong) NSMutableArray *modelArray2;
@property (nonatomic, strong) NSMutableArray *modelArray3;
@property (nonatomic, strong) UIImageView *bannerImageView;
@property (nonatomic, strong) IdentificationTextView *textView;

@end


@implementation IdentificationCompareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    //返回按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    back.frame = CGRectMake(0, 0, 12.5*KScaleWidth*2 , 21*KScaleHeight*2);
    [back setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];//向左移动
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = left;

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.itemSize = CGSizeMake(108*KScaleWidth, 140.4*KScaleHeight);
    layout.sectionInset = UIEdgeInsetsMake(36.1*KScaleHeight, 8*KScaleWidth, 8*KScaleHeight, 8*KScaleWidth);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier2];
    [self.collectionView registerClass:[IdentificationCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:headerIdentifier];
    [self.collectionView registerClass:[IdentificationCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter  withReuseIdentifier:footerIdentifier];
    
    [self.view addSubview:_collectionView];
    
    if (self.isOnline) {
        self.title = [NSString stringWithFormat:@"%@鉴定",self.model.name];
        self.bannerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 110*KScaleHeight)];
        self.bannerImageView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_bannerImageView];
        self.collectionView.y += (110*KScaleHeight+64);
        self.collectionView.height -= (110*KScaleHeight+64);

    }else{
    self.modelArray1 = [NSMutableArray array];
    self.modelArray2 = [NSMutableArray array];
    self.modelArray3 = [NSMutableArray array];
        self.title = @"对比鉴定";
    }


}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    

    
    if (self.isOnline) {
        if (section == 0) {
            return 10;
        }else if (section == 1) {
            return 8;
        }else if(section==2) {
            return 1;
        }
    }else{
        //    if (section == 0) {
        //        return self.modelArray1.count;
        //    }else if (section == 1) {
        //        return self.modelArray2.count;
        //    }else if(section==2) {
        //        return self.modelArray3.count;
        //    }
    }
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    if (self.isOnline && indexPath.section == 2) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier2 forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        cell.backgroundColor = [UIColor whiteColor];
        self.textView = [[IdentificationTextView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth-32*KScaleWidth , 150*KScaleHeight)];
        self.textView.delegate = self;
        self.textView.backgroundColor = [UIColor grayColor];
        self.textView.placeholder = @"藏品信息简单描述";
        [cell.contentView addSubview:_textView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(self.textView.x, self.textView.height+14*KScaleHeight, self.textView.width, 48*KScaleHeight);
        button.backgroundColor = [UIColor blackColor];
        [button setTitle:@"提交" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:button];
        return cell;
    }
    return cell;
}
- (void)submit{
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind==UICollectionElementKindSectionFooter) {
        IdentificationCollectionReusableView *footer = [collectionView  dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerIdentifier forIndexPath:indexPath];
        return footer;
    }
    
    
    if (indexPath.section >=0) {
        IdentificationCollectionReusableView *header = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        header.backgroundColor = [UIColor whiteColor];
        NSArray *array;
        if (self.isOnline) {
            array = @[@"宏观图", @"显微和折射显微图", @"描述"];
        }else{
            array = @[@"正品库", @"仿品库", @"拍照上传"];
        }
        header.categoryLabel.text = array[indexPath.section];
        [header.categoryLabel sizeToFit];
        header.redView.hidden = NO;

        if (indexPath.section == 2) {
            header.redView.hidden = YES;
        }
        return header;
    }
    
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(0, 36.1*KScaleHeight/2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    
    return CGSizeMake(0, 0.1);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isOnline) {
        if (indexPath.section == 2) {
           return CGSizeMake(KScreenWidth-32*KScaleWidth , 150*KScaleHeight);
        }
    }
        return CGSizeMake(108*KScaleWidth, 140.4*KScaleHeight);
    
}

//返回上一页
- (void)back{
    
    if (!self.isOnline) {
        self.tabBarController.tabBar.hidden = NO;
    }
    [self.navigationController popViewControllerAnimated:NO];
    
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
