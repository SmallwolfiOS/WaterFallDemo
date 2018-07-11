//
//  ViewController.m
//  waterFallDemo
//
//  Created by 马海平 on 2018/7/11.
//  Copyright © 2018年 马海平. All rights reserved.
//

#import "ViewController.h"
#import "HP_WaterFallLayout.h"
#import "HP_WaterFallCollectionCell.h"


#define kWaterFallCellIdentifier @"WaterFallCellIdentifier"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,HPWaterFallLayoutDelegate>
@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong)NSMutableArray * dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
    
}
#pragma mark Lazy
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    NSArray * array = @[@{  @"w":@"140",
                            @"h":@"180",
                            @"color":[UIColor yellowColor],
                            },
                        @{  @"w":@"40",
                            @"h":@"10",
                            @"color":[UIColor yellowColor],
                            },
                        @{  @"w":@"40",
                            @"h":@"180",
                            @"color":[UIColor yellowColor],
                            },
                        @{  @"w":@"90",
                            @"h":@"80",
                            @"color":[UIColor yellowColor],
                            },
                        @{  @"w":@"80",
                            @"h":@"80",
                            @"color":[UIColor yellowColor],
                            },
                        
                        
                        ];
    [_dataSource addObjectsFromArray:array];
    return _dataSource;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        HP_WaterFallLayout * layout = [[HP_WaterFallLayout alloc]init];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.alwaysBounceVertical = true;
        UIEdgeInsets contentInset = UIEdgeInsetsZero;
        _collectionView.contentInset = contentInset;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HP_WaterFallCollectionCell class] forCellWithReuseIdentifier:kWaterFallCellIdentifier];
//         [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kWaterFallHeaderIdentifier];
    }
    return _collectionView;
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HP_WaterFallCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kWaterFallCellIdentifier forIndexPath:indexPath];
    NSDictionary * obj = [self.dataSource objectAtIndex:indexPath.item];
//    cell.obj = obj;
    [cell updateCellWithData:(NSDictionary *)obj];
    return cell;
}

#pragma mark HPWaterFallLayoutDelegate
// 返回index位置下的item的高度
- (CGFloat)waterFallLayout:(HP_WaterFallLayout *)waterFallLayout heightForItemAtIndex:(NSUInteger)index width:(CGFloat)width{
    NSDictionary *obj = [self.dataSource objectAtIndex: index];
    CGFloat itemWidth = [obj[@"w"] integerValue];
    CGFloat itemHeight = [obj[@"h"] integerValue];
//    if (imageWidth <= 0 || imageHeight <= 0) {
//        return 100.0;
//    }
    return   floor(itemHeight * width / itemWidth);
}























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
