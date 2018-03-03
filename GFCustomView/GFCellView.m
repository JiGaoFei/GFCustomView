//
//  GFCellView.m
//  GFCustomeDemo
//
//  Created by 孙行者网络 on 2018/3/3.
//  Copyright © 2018年 纪高飞. All rights reserved.
//

#import "GFCellView.h"
#import <Masonry/Masonry.h>
@interface GFCellView()
/**线*/
@property (nonatomic,strong) UIView *lineView;
@end
@implementation GFCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpGFCustomeUI];
    }
    return self;
}

#pragma makr - 创建控件
- (void)setUpGFCustomeUI {
    // 创建标题
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_titleLab];
    // 创建左副题
    self.leftViceLab = [[UILabel alloc] init];
    self.leftViceLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.leftViceLab];
    // 创建左输入框
    self.leftViceTextField = [[UITextField alloc] init];
    [self addSubview:self.leftViceTextField];
    // 创建右副题
    self.rightViceLab = [[UILabel alloc] init];
    self.rightViceLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.rightViceLab];
    // 创建右副图片
    self.rightViceImageView = [[UIImageView alloc] init];
    [self addSubview:self.rightViceImageView];
    // 创建右箭头
    self.rightArrowImageView = [[UIImageView alloc] init];
    [self addSubview:self.rightArrowImageView];
    // 创建分割线
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [UIColor grayColor];
    [self addSubview:_lineView];
}

#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局线
    [self layoutGFlineView];
    switch (_gfCustomType) {
        case GFH_Title_LeftViceTitle:
        {
            // 布局标题 和左副标题
            [self layoutGFH_Title_LeftViceTitle];
        }
            break;
            
        case GFH_Title_LeftViceTitleAndArrow:
        {
            // 布局标题 和左副标题 箭头
            [self layoutGFH_Title_LeftViceTitleArrow];
        }
            break;
        case GFH_Title_RightViceTitle:
        {
            // 布局标题 和右副标题
            [self layoutGFH_Title_RightViceTitle];
        }
            break;
        case GFH_Title_RightViceTitleAndArrow:
        {
            // 布局标题 和右副标题 右箭头
            [self layoutGFH_Title_RightViceTitleAndArrow];
        }
            break;
        case  GFH_Title_LeftTextField:
        {
            // 布局标题和左输入框
            [self layoutGFH_Title_LeftTextField];
        }
            break;
        case GFH_Title_RightViceimageViewAndArrow:
        {
            // 布局标题  右副图 右副箭头
            [self layoutGFH_Title_RightViceimageViewAndArrow];
        }
        default:
            break;
            
    }
}

#pragma mark - 布局线
- (void)layoutGFlineView
{
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.lineLeftMargin?self.lineLeftMargin:10);
        make.right.equalTo(self.mas_right).offset(self.lineRightMargin?(-self.lineRightMargin):-10);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(self.lineHeight?@(self.lineHeight):@1);
    }];
    
    
}
#pragma mark - 标题 左副标题
- (void)layoutGFH_Title_LeftViceTitle
{
    // 布局标题
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.leftMargin?self.leftMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    // 布局左副标题
    [self.leftViceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(self.leftAndViceMargin?self.leftAndViceMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
#pragma mark - 标题 左副标题 箭头
- (void)layoutGFH_Title_LeftViceTitleArrow
{
    // 布局标题
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.leftMargin?self.leftMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    // 布局左副标题
    [self.leftViceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(self.leftAndViceMargin?self.leftAndViceMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    // 布局右箭头
    [self.rightArrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(self.rightMargin?(-self.rightMargin):-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
#pragma mark - 标题 右副标题
- (void)layoutGFH_Title_RightViceTitle{
    // 布局标题
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.leftMargin?self.leftMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    // 布局右副标题
    [self.rightViceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(self.rightMargin?(-self.rightMargin):-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
#pragma mark - 标题 右副标题  右箭头
- (void)layoutGFH_Title_RightViceTitleAndArrow
{
    // 布局标题
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.leftMargin?self.leftMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    // 布局右箭头
    [self.rightArrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(self.rightMargin?(-self.rightMargin):-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    // 布局右副标题
    [self.rightViceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightArrowImageView.mas_left).offset(self.rightArrowAndViceMargin?(-self.rightArrowAndViceMargin):-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
#pragma mark - 标题 左输入框
- (void)layoutGFH_Title_LeftTextField
{
    // 布局标题
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.leftMargin?self.leftMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    // 布局左副输入框
    [self.leftViceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(self.leftAndViceMargin?self.leftAndViceMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
#pragma mark - 标题 右副图 右箭头
- (void)layoutGFH_Title_RightViceimageViewAndArrow
{
    // 布局标题
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(self.leftMargin?self.leftMargin:10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    // 布局右箭头
    [self.rightArrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(self.rightMargin?(-self.rightMargin):-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    // 布局右副图
    [self.rightViceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightArrowImageView.mas_left).offset(self.rightArrowAndViceMargin?(-self.rightArrowAndViceMargin):-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

@end
