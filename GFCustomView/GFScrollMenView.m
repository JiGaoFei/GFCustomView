//
//  GFScrollMenView.m
//  GFCustomeDemo
//
//  Created by 孙行者网络 on 2018/3/20.
//  Copyright © 2018年 纪高飞. All rights reserved.
//

#import "GFScrollMenView.h"
#import <Masonry/Masonry.h>
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
@interface GFScrollMenView()<UIScrollViewDelegate>
/**分页视图*/
@property (nonatomic,strong) UIScrollView *menScrollView;
/**分页*/
@property (nonatomic,strong) UIPageControl *pageControl;
@end
@implementation GFScrollMenView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpGFScrollMenViewUI];
    }
    return self;
}

#pragma makr - 创建控件
- (void)setUpGFScrollMenViewUI {
    // 创建collectionView
    self.menScrollView = [[UIScrollView alloc] init];
    self.menScrollView.backgroundColor = [UIColor purpleColor];
    self.menScrollView.pagingEnabled = YES;
    self.menScrollView.delegate = self;
    self.menScrollView.bounces = NO;
    self.menScrollView.showsHorizontalScrollIndicator = NO;
    self.menScrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.menScrollView];

}


#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局collectionView
    [self.menScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    [self setUpButtons];
}
#pragma makr - 创建按钮
- (void)setUpButtons
{
    self.totallNumber=13.0;
    self.pageNum = 8;
    self.rowNum = 4;
    // 当页面数量不为整数的时候加1 (num++)
    int tagIndex = 0;
    float  num = self.totallNumber / self.pageNum;
    int  number = self.totallNumber /self.pageNum;
    if (num >number) {
        number ++;
    }
    
    // 设置滚动范围
    self.menScrollView.contentSize = CGSizeMake(number *ScreenW, self.bounds.size.height - 20);
    for (int i = 0 ; i< self.totallNumber; i++) {
        // 行数
        int row = i / self.rowNum;
        // 列数
        int col = i % self.rowNum;
        // 页数
        int n= i/self.pageNum ;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 100 +i;
        btn.backgroundColor = [UIColor orangeColor];
        [btn setImage:[UIImage imageNamed:@"park_buy"] forState:UIControlStateNormal];
       btn.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
       btn.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 0);
        btn.frame = CGRectMake(col *ScreenW / self.rowNum  + n *ScreenW, ( row % 2) *self.bounds.size.height/2, ScreenW/self.rowNum, self.bounds.size.height/2);
        [btn setTitle:[NSString stringWithFormat:@"第%d个",tagIndex++] forState:UIControlStateNormal];
        [self.menScrollView addSubview:btn];
    }
}
@end


