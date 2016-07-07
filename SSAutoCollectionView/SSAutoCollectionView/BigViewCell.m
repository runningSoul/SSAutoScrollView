//
//  BigViewCell.m
//  SSAutoCollectionView
//
//  Created by 杨尚彬 on 15/11/10.
//  Copyright © 2015年 杨尚彬. All rights reserved.
//

#import "BigViewCell.h"

@implementation BigViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.picImageView = [[UIImageView alloc]init];
        self.picImageView.frame = CGRectMake(0, 0, kScreenWidth, self.frame.size.height);
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.picImageView];
        
        
        if (self.itemBlock) {
            self.itemBlock(1);
        }
        
        
        if ([self.delege respondsToSelector:@selector(chuanZhi:)]) {
            [self.delege chuanZhi:@"你好"];
        }
    }
    return self;
}
@end
