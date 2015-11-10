//
//  ViewController.m
//  SSAutoCollectionView
//
//  Created by 杨尚彬 on 15/10/21.
//  Copyright © 2015年 杨尚彬. All rights reserved.
//

#import "ViewController.h"
#import "AutoScrollView.h"


@interface ViewController ()

@property (nonatomic,strong)AutoScrollView *autoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addUpScrollView];

    
    
}
//配置文件
- (void)addUpScrollView
{
    AutoScrollView *autoView = [[AutoScrollView alloc]init];
    autoView.frame =CGRectMake(0,0,kScreenWidth, 200);
    autoView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:autoView];
    self.autoView = autoView;
    
    
    
    self.autoView.picArray = [NSArray arrayWithObjects:@"1.png",@"2.png",@"3.png",@"4.png", nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
