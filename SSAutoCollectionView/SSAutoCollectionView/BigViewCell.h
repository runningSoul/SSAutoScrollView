//
//  BigViewCell.h
//  SSAutoCollectionView
//
//  Created by 杨尚彬 on 15/11/10.
//  Copyright © 2015年 杨尚彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol bigViewDelegate <NSObject>

- (void)chuanZhi:(NSString *)title;


@end


typedef void(^itemIntegerBlock)(NSInteger integer);

@interface BigViewCell : UICollectionViewCell

@property (nonatomic,weak)id<bigViewDelegate> delege;

@property (nonatomic,copy)itemIntegerBlock itemBlock;
@property (nonatomic,strong)UIImageView *picImageView;
@end
