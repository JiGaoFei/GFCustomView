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
    // 创建scrollView
    self.menScrollView = [[UIScrollView alloc] init];
    self.menScrollView.pagingEnabled = YES;
    self.menScrollView.delegate = self;
    self.menScrollView.bounces = NO;
    self.menScrollView.showsHorizontalScrollIndicator = NO;
    self.menScrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.menScrollView];
    // 创建pageController
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = 3;
    // 非选中页圆点颜色
    self.pageControl.pageIndicatorTintColor = [UIColor greenColor];
    // 选中页圆点颜色
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    [self addSubview:self.pageControl];

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
    // 布局pageController
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@20);
    }];
    [self setUpButtons];
}
#pragma mark - set方法
- (void)setPageTintColor:(UIColor *)pageTintColor
{
    _pageTintColor = pageTintColor;
    // 非选中页圆点颜色
    self.pageControl.pageIndicatorTintColor = pageTintColor;
}
- (void)setCurrentPageTintColor:(UIColor *)currentPageTintColor
{
    _currentPageTintColor = currentPageTintColor;
        // 选中页圆点颜色
    self.pageControl.currentPageIndicatorTintColor = currentPageTintColor;
}
#pragma makr - 创建按钮
- (void)setUpButtons
{
  
    // 当页面数量不为整数的时候加1 (num++)
    float  num = self.totallNumber / self.pageNum;
    int  number = self.totallNumber /self.pageNum;
    self.pageControl.numberOfPages = number;
    if (num >number) {
        number ++;
    }
    
    // 设置滚动范围
    self.menScrollView.contentSize = CGSizeMake(number *ScreenW, self.bounds.size.height - 20);
    for (int i = 0 ; i< self.titlesArray.count; i++) {
        // 行数
        int row = i / self.rowNum;
        // 列数
        int col = i % self.rowNum;
        // 页数
        int n= i/self.pageNum ;
       // 每页行数(每页有几行)
        int m = (int) self.pageNum / self.rowNum;
        GFScrollMenCell *menCell = [[GFScrollMenCell alloc] init];
        menCell.iconImageView.image = [UIImage imageNamed:self.imagesArray[i]];
        menCell.clickButton.tag = 100 +i;
        [menCell.clickButton addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        if (self.rowNum == self.pageNum) {
        menCell.frame = CGRectMake(col *ScreenW / self.rowNum  + n *ScreenW, 0, ScreenW/self.rowNum, (self.bounds.size.height-20)/m);
        }else{
           // row %(self.pageNum / self.rowNum)     行数
          menCell.frame = CGRectMake(col *ScreenW / self.rowNum  + n *ScreenW, (row %(self.pageNum / self.rowNum)) *(self.bounds.size.height-20)/m, ScreenW/self.rowNum, (self.bounds.size.height-20)/m);
        }
        menCell.titleLabel.text = self.titlesArray[i];
        [self.menScrollView addSubview:menCell];
    }
}
#pragma mark - scrollView代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x /ScreenW;
    
    // 设置页码
    _pageControl.currentPage = page;
}
#pragma mark - 事件
- (void)clickButtonAction:(UIButton *)button
{
    NSLog(@"点击的是第%ld个",button.tag - 100);
}

@end
@interface GFScrollMenCell()
@end
@implementation GFScrollMenCell
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpGFScrollMenUI];
    }
    return self;
}

#pragma makr - 创建控件
- (void)setUpGFScrollMenUI {
    // 创建图片
    self.iconImageView = [[UIImageView alloc] init];
    [self addSubview:self.iconImageView];
    // 创建标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    // 创建按钮
    self.clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.clickButton];
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局图片
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-10);
    }];
    // 布局标题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(5);
        make.centerX.equalTo(self.mas_centerX);
    }];
    // 布局按钮
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

@end

