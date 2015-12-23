//
//  smallViewCell.m
//  SSAutoCollectionView
//
//  Created by 杨尚彬 on 15/11/10.
//  Copyright © 2015年 杨尚彬. All rights reserved.
//

#import "smallViewCell.h"

@implementation smallViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.picImageView = [[UIImageView alloc]init];
        self.picImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.picImageView];
        UIView *View  =  [[UIView alloc]init];
        View.frame = CGRectMake(0, 0,frame.size.width, frame.size.height);
        View.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8];
        [self addSubview:View];
        self.maskView  = View;
    }
    return self;
}
@end
