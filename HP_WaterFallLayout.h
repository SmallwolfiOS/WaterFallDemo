//
//  HP_WaterFallLayout.h
//  waterFallDemo
//
//  Created by 马海平 on 2018/7/11.
//  Copyright © 2018年 马海平. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HP_WaterFallLayout;

@protocol HPWaterFallLayoutDelegate <NSObject>

@required
// 返回index位置下的item的高度
- (CGFloat)waterFallLayout:(HP_WaterFallLayout *)waterFallLayout heightForItemAtIndex:(NSUInteger)index width:(CGFloat)width;
@end



@interface HP_WaterFallLayout : UICollectionViewLayout
/** 代理 */
@property (nonatomic, weak) id<HPWaterFallLayoutDelegate> delegate;


@end
