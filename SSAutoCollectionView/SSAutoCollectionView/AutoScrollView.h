//
//  AutoScrollView.h
//  SSAutoCollectionView
//
//  Created by 杨尚彬 on 15/11/10.
//  Copyright © 2015年 杨尚彬. All rights reserved.
//


/**
 *导入此类的时候需要添加本项目的pch文件里的部分东西
 *
 */
#import <UIKit/UIKit.h>

@interface AutoScrollView : UIView

@property (nonatomic,assign)CGFloat smallWidth;
@property (nonatomic,assign)CGFloat smallHeight;
/**
 *  小的view中间的间距
 */
@property (nonatomic,assign)CGFloat miniSpalicing;
@property (nonatomic,strong)UICollectionView *bigCollectiionView;

@property (nonatomic,strong)UICollectionView *smallCollectiionView;


@property (nonatomic,strong)NSArray *picArray;
- (instancetype)initWithFrame:(CGRect)frame width:(CGFloat)width height:(CGFloat)height;
@end
