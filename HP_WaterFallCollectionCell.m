//
//  HP_WaterFallCollectionCell.m
//  waterFallDemo
//
//  Created by 马海平 on 2018/7/11.
//  Copyright © 2018年 马海平. All rights reserved.
//

#import "HP_WaterFallCollectionCell.h"

@implementation HP_WaterFallCollectionCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor redColor];
    }
    return self;
}


- (void)updateCellWithData:(NSDictionary *)obj{
    self.contentView.backgroundColor = [obj objectForKey:@"color"];
}



@end
