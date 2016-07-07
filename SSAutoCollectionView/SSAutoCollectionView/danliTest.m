//
//  danliTest.m
//  SSAutoCollectionView
//
//  Created by 杨尚彬 on 16/2/17.
//  Copyright © 2016年 杨尚彬. All rights reserved.
//

#import "danliTest.h"



@implementation danliTest

#pragma mark - 初始化部分
static id _instance;
- (id)init
{
    if (self = [super init]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
        
            
        });
    }
    return self;
}

+ (instancetype)shareDanliTest
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    
    return _instance;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self allocWithZone:zone];
    });
    return _instance;
}

@end
