//
//  ViewController.m
//  GFCustomeDemo
//
//  Created by 纪高飞 on 18/1/31.
//  Copyright © 2018年 纪高飞. All rights reserved.
//

#import "ViewController.h"
#import "GFCustomView.h"
#import <Masonry/Masonry.h>
#import "TableIndexViewController.h"
@interface ViewController ()<GFSignatureViewDelegate>
/**签名视图*/
@property (nonatomic,strong) GFSignatureView  *signatureView;
/**滚动视图*/
@property (nonatomic,strong) GFScrollMenView *scrollMenView;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载UI
//    [self setUpSignatureView];
   // [self setUpUI];
    // 滚动视图
//    [self setUpGFScrollMenUI];
}
- (void)setUpUI{
    // 创建标题和左副标题
    GFCellView*titleAndLeftTiteView = [[GFCellView alloc] init];
    titleAndLeftTiteView.titleLab.text = @"姓名";
    titleAndLeftTiteView.leftViceLab.text =@"GF";
    titleAndLeftTiteView.leftViceLab.textColor = [UIColor grayColor];
    titleAndLeftTiteView.gfCustomType = GFH_Title_LeftViceTitle;
    [self.view addSubview:titleAndLeftTiteView];
    
    // 布局标题和左副标题
    [titleAndLeftTiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    // 创建标题和左副标题 右箭头
    GFCellView *titleAndLeftTiteArrowView = [[GFCellView alloc] init];
    titleAndLeftTiteArrowView .titleLab.text = @"姓名";
    titleAndLeftTiteArrowView .leftViceLab.text =@"GF";
    titleAndLeftTiteArrowView .leftViceLab.textColor = [UIColor grayColor];
    titleAndLeftTiteArrowView.rightArrowImageView.image = [UIImage imageNamed:@"pub_ic_arrow"];
    titleAndLeftTiteArrowView.gfCustomType = GFH_Title_LeftViceTitleAndArrow;
    [self.view addSubview:titleAndLeftTiteArrowView ];
    
    // 布局标题和左副标题 右箭头
    [titleAndLeftTiteArrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndLeftTiteView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    
    // 创建标题和右副标题
    GFCellView *titleAndRightTiteView = [[GFCellView alloc] init];
    titleAndRightTiteView.titleLab.text = @"姓名";
    titleAndRightTiteView.rightViceLab.text =@"GF";
    titleAndRightTiteView.rightViceLab.textColor = [UIColor grayColor];
    titleAndRightTiteView.gfCustomType = GFH_Title_RightViceTitle;
    [self.view addSubview:titleAndRightTiteView];
    
    // 布局标题和右副标题
    [titleAndRightTiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndLeftTiteArrowView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    // 创建标题和右副标题
    GFCellView *titleAndRightTiteArrowView = [[GFCellView alloc] init];
    titleAndRightTiteArrowView .titleLab.text = @"姓名";
    titleAndRightTiteArrowView .rightViceLab.text =@"GF";
    titleAndRightTiteArrowView .rightViceLab.textColor = [UIColor grayColor];
    titleAndRightTiteArrowView.gfCustomType = GFH_Title_RightViceTitleAndArrow;
     titleAndRightTiteArrowView.rightArrowImageView.image =  [UIImage imageNamed:@"pub_ic_arrow"];
    [self.view addSubview:titleAndRightTiteArrowView ];
    
    // 布局标题和右副标题
    [titleAndRightTiteArrowView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndRightTiteView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];
    
    // 创建标题和左副输入框
    GFCellView *titleAndleftTFView = [[GFCellView alloc] init];
    titleAndleftTFView .titleLab.text = @"姓名";
    titleAndleftTFView .leftViceTextField.placeholder = @"请输入姓名";
    titleAndleftTFView .rightViceLab.textColor = [UIColor grayColor];
    titleAndleftTFView.gfCustomType = GFH_Title_LeftTextField;
    [self.view addSubview:titleAndleftTFView ];

    // 布局标题和左副输入框
    [titleAndleftTFView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndRightTiteArrowView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];

    // 创建标题和右副图  右箭头
    GFCellView *titleAndRightImgeAndArrow= [[GFCellView alloc] init];
    titleAndRightImgeAndArrow .titleLab.text = @"姓名";
    titleAndRightImgeAndArrow.gfCustomType = GFH_Title_RightViceimageViewAndArrow;
    titleAndRightImgeAndArrow.rightViceImageView.image = [UIImage imageNamed:@"my_ic_qrcard"];
    titleAndRightImgeAndArrow.rightArrowImageView.image = [UIImage imageNamed:@"pub_ic_arrow"];
    [self.view addSubview:titleAndRightImgeAndArrow ];

    // 布局标题和右副图 右箭头
    [titleAndRightImgeAndArrow  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(titleAndleftTFView.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@50);
    }];

}
- (void)setUpSignatureView
{
    self.signatureView = [[GFSignatureView alloc] init];
    self.signatureView.delegate = self;
}

- (void)gf_submitAction:(UIImage *)gfSignatureImage
{
    NSLog(@"已经提交");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.signatureView gf_showSignatureView];
    TableIndexViewController *indexVC = [[TableIndexViewController alloc] init];
    [self.navigationController pushViewController:indexVC animated:YES];
}
- (void)setUpGFScrollMenUI
{
    self.scrollMenView = [[GFScrollMenView alloc] init];
    self.scrollMenView.titlesArray = @[@"推荐车位",@"车位出售",@"车位长租",@"车位求购",@"车位求租",@"91车位",@"共享车位",@"车位投建"].mutableCopy;
    self.scrollMenView.imagesArray =@[@"home_reco",@"home_sale",@"home_rent",@"home_buy",@"home_qz",@"home_cwtz",@"home_gx",@"home_cwtj"].mutableCopy;
    // 总数(必须赋值)
    self.scrollMenView.totallNumber=8;
    // 每页显示个数(必须赋值)
   self.scrollMenView.pageNum =4;
    // 每行显示个数(必须赋值)
   self.scrollMenView.rowNum =4;
    // 指示器圆点颜色
    self.scrollMenView.pageTintColor = [UIColor orangeColor];
    // 指示器当前页圆点颜色
    self.scrollMenView.currentPageTintColor = [UIColor redColor];
    self.scrollMenView.gfScrollMenViewClickIndex = ^(NSInteger index) {
        NSLog(@"点击的是第----%ld个",(long)index);
    };
    [self.view addSubview:self.scrollMenView];
    [self.scrollMenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@90);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
