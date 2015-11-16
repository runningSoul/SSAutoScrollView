//
//  AutoScrollView.m
//  SSAutoCollectionView
//
//  Created by 杨尚彬 on 15/11/10.
//  Copyright © 2015年 杨尚彬. All rights reserved.
//

#import "AutoScrollView.h"
#import "BigViewCell.h"
#import "smallViewCell.h"



//放大数组个数,使页面成轮播
#define pageCount self.picArray.count * 50
@interface AutoScrollView ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
{
    //为了匹配数组
    NSArray *_picArray;
}
//自动轮播时间戳
@property (nonatomic,strong)NSTimer *timer;

@property (nonatomic)CGFloat BigFloat;

@property (nonatomic,assign)NSInteger smallInteger;
@end

@implementation AutoScrollView
- (void)viewWillAppear
{
    [self addUpTimer];
}

- (void)viewWillDisAppear
{
    [self removeTimer];
}
- (NSArray *)picArray
{
    if (!_picArray) {
        _picArray = [NSArray array];
    }
    return _picArray;
}
- (void)setPicArray:(NSArray *)picArray
{
    _picArray = picArray;
    [self.smallCollectiionView reloadData];
    if (picArray.count != 0) {
         [self.bigCollectiionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:pageCount inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    self.smallInteger = 0;
    [self addUpTimer];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addBigCollectionViewFrame:frame];
        [self addSmallView];
        [self addUpTimer];
        self.smallInteger = 0;
    }
    return self;
}
//添加大的轮播图
- (void)addBigCollectionViewFrame:(CGRect)frame
{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize =CGSizeMake(kScreenWidth, 200);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:flowLayout];
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = YES;
    collectionView.pagingEnabled = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[BigViewCell class] forCellWithReuseIdentifier:@"cell"];
    collectionView.frame = CGRectMake(0,0, kScreenWidth, 200);
//    [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:pageCount inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    [self addSubview:collectionView];
    self.bigCollectiionView = collectionView;
    
    
}
//小的轮播图
- (void)addSmallView
{
    UICollectionViewFlowLayout *viewFlowLayout = [[UICollectionViewFlowLayout alloc]init];
    viewFlowLayout.itemSize = CGSizeMake(40, 50);
    viewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    viewFlowLayout.minimumInteritemSpacing = 0;
    viewFlowLayout.minimumLineSpacing = 4;
    UICollectionView *CollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,150,500,50) collectionViewLayout:viewFlowLayout];
    CollectionView.dataSource = self;
    CollectionView.backgroundColor = [UIColor whiteColor];
    CollectionView.delegate = self;
    [CollectionView registerClass:[smallViewCell class] forCellWithReuseIdentifier:@"bitCell"];
    [self addSubview:CollectionView];
    self.smallCollectiionView = CollectionView;
    
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    [self addUpTimer];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
//    self.testInteger = self.BIGInteger;
    
    self.BigFloat = self.bigCollectiionView.contentOffset.x;
    
    
    [self removeTimer];
    
}
//计算当滑动的时候的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if ((self.bigCollectiionView.contentOffset.x - self.BigFloat) > (kScreenWidth/2)) {
        if (self.smallInteger == 0) {
            self.smallInteger++;
            [self.smallCollectiionView reloadData];
            return;
        }else if (self.smallInteger == self.picArray.count-1){
            self.smallInteger = 0;
            [self.smallCollectiionView reloadData];
            return;
        }else{
            self.smallInteger++;
            [self.smallCollectiionView reloadData];
            return;
        }
        
    }else if((self.BigFloat - self.bigCollectiionView.contentOffset.x) > (kScreenWidth/2)){
        
        if (self.smallInteger == 0) {
            self.smallInteger = self.picArray.count-1;
            [self.smallCollectiionView reloadData];
            return;
        }else if (self.smallInteger == self.picArray.count-1){
            self.smallInteger--;
            [self.smallCollectiionView reloadData];
            return;
        }else{
            self.smallInteger--;
            [self.smallCollectiionView reloadData];
            return;
        }
    }else{
        return;
    }
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.bigCollectiionView) {
        return self.picArray.count + pageCount * 2;
    }else {
         return self.picArray.count;
    }
    
   
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.bigCollectiionView) {
        BigViewCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        NSString *strImage = self.picArray[indexPath.row%self.picArray.count];
        Cell.picImageView.image = [UIImage imageNamed:strImage];
        
        return Cell;
        
        
    }else{
        
        smallViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bitCell" forIndexPath:indexPath];
        NSString *strImage = self.picArray[indexPath.row];
        cell.picImageView.image = [UIImage imageNamed:strImage];
        if (indexPath.row == self.smallInteger) {
            cell.maskView.hidden = YES;
        }else {
            cell.maskView.hidden =NO;
        }

        return cell;
        
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.bigCollectiionView) {
        //点击大的轮播图处理事件
        NSLog(@"dianjile    %ld",indexPath.row);
    }else{
        self.smallInteger = indexPath.row;
    }
}
//添加定时
- (void)addUpTimer
{
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer timerWithTimeInterval:2.5 target:self selector:@selector(collectionAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];
}
- (void)collectionAction
{
    NSIndexPath *indexPath = [[self.bigCollectiionView indexPathsForVisibleItems] firstObject];
    NSInteger items = indexPath.item;
    if (self.picArray.count == 0) {
        return;
    }
    
    if (items%self.picArray.count == 0) {
        [self.bigCollectiionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:pageCount inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        items = pageCount;
    }
    NSInteger nextItem = items + 1;
    [self.bigCollectiionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    self.smallInteger++;
    if (self.smallInteger >= self.picArray.count) {
        self.smallInteger = 0;
    }
    [self.smallCollectiionView reloadData];
}
//移除定时
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer= nil;
    
}

@end
