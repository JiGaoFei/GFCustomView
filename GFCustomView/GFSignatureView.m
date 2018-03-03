//
//  GFSignatureView.m
//  GFCustomeDemo
//
//  Created by 孙行者网络 on 2018/3/3.
//  Copyright © 2018年 纪高飞. All rights reserved.
//

#import "GFSignatureView.h"
#import <Masonry/Masonry.h>
#import <QuartzCore/QuartzCore.h>
@interface GFSignatureView()
/**topView*/
@property (nonatomic,strong) UIView *topView;
/**分割线*/
@property (nonatomic,strong) UIView *topSeperateLineView;
/**内容视图*/
@property (nonatomic,strong) UIView *contentView;
/**绘图*/
@property (nonatomic,strong) GFSignatureCutomeView *customView;
@end
@implementation GFSignatureView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.5];
        // 创建布局视图
        [self setUpSignatureView];
    }
    return self;
}


#pragma makr - 创建控件
- (void)setUpSignatureView{
    // 创建内容视图
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    // 创建顶部视图
    self.topView = [[UIView alloc] init];
    [self.contentView addSubview:self.topView];
    // 创建上分割线
    self.topSeperateLineView = [[UIView alloc] init];
    self.topSeperateLineView.backgroundColor = [UIColor grayColor];
    [self.topView addSubview:self.topSeperateLineView];
    // 创建标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"请签名";
    [self.topView addSubview:self.titleLabel];
    // 创建撤销按钮
    self.undoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.undoButton setTitle:@"撤销" forState:UIControlStateNormal];
    [self.undoButton addTarget:self action:@selector(undoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.undoButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.topView addSubview:_undoButton];
    
    // 创建重签按钮
    self.redrawButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.redrawButton setTitle:@"重签" forState:UIControlStateNormal];
    [self.redrawButton addTarget:self action:@selector(redrawButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.redrawButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.topView addSubview:_redrawButton];
    // 创建customeView
    self.customView = [[GFSignatureCutomeView alloc ] init ];
    [self.contentView addSubview:self.customView];
    // 创建提交按钮
    self.submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitButton.backgroundColor = [UIColor blueColor];
    [self.submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [self.submitButton addTarget:self action:@selector(submitButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.submitButton];
}

#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局内容视图
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@300);
    }];
    // 布局顶部视图
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@50);
    }];
    
    // 布局标题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topView.mas_centerX);
        make.centerY.equalTo(self.topView.mas_centerY);
    }];
    
    // 布局撤销按钮
    [self.undoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.topView);
        make.width.equalTo(@60);
        make.bottom.equalTo(self.topView.mas_bottom);
    }];
    
    // 布局重签按钮
    [self.redrawButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.topView);
        make.width.equalTo(@60);
        make.bottom.equalTo(self.topView.mas_bottom);
    }];
    // 布局上分割线
    [self.topSeperateLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.topView.mas_bottom);
        make.height.equalTo(@0.5);
    }];
    // 布局签名视图
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.topView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.submitButton.mas_top);
    }];
    //布局提交按钮
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@50);
    }];
}
#pragma mark - 视图展示
/**视图的展示*/
-(void)gf_showSignatureView
{
    [UIView animateWithDuration:1 animations:^{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }];
}
#pragma mark - 视图销毁
/**销毁*/
-(void)gf_dismissSignatureView
{
    [UIView animateWithDuration:1 animations:^{
        [self removeFromSuperview];
    }];
}

#pragma mark - 点击空白消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:1 animations:^{
        [self removeFromSuperview];
    }];
}

#pragma mark - 撤销
- (void)undoButtonAction:(UIButton *)button
{
    [self.customView gf_undoLastDraw];
}
#pragma mark - 重签
- (void)redrawButtonAction:(UIButton *)button
{
    [self.customView gf_clearSignature];
}
#pragma mark - 提交
/**提交保存照片*/
- (void)submitButtonAction:(UIButton *)button
{
    UIImage *img = [self.customView signatureImage];
    // 保存图片到相册
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    // 把图片传出去
    if ([self.delegate respondsToSelector:@selector(gf_submitAction:)]) {
        [self.delegate gf_submitAction:img];
    }
    // 移除视图
    [self gf_dismissSignatureView];
}
/**照片保存成功后的回调*/
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

@end

#pragma mark  - 绘图
@interface GFSignatureCutomeView()
@property (nonatomic, strong) NSMutableArray *pathsArray;
@property (nonatomic, strong) NSMutableArray *backPathsArray;
@property (nonatomic, copy) UIBezierPath *bezierPath;
@end;
@implementation GFSignatureCutomeView
#pragma mark - 懒加载
/**懒加载创建bezierPath*/
- (UIBezierPath *)bezierPath {
    if (!_bezierPath) {
        _bezierPath = [UIBezierPath bezierPath];
        _bezierPath.lineJoinStyle = kCGLineJoinRound;
        _bezierPath.lineCapStyle = kCGLineCapRound;
        _bezierPath.lineWidth = _lineWidth;
    }
    return _bezierPath;
}

/**路径数组*/
- (NSMutableArray *)pathsArray {
    if (!_pathsArray) {
        _pathsArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _pathsArray;
}

/**返回路径数组*/
- (NSMutableArray *)backPathsArray {
    if (!_backPathsArray) {
        _backPathsArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _backPathsArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpConfigure];
    }
    return self;
}



// 配置
- (void)setUpConfigure {
    _lineColor = [UIColor blackColor];
    _lineWidth = 3.0;
    self.backgroundColor = [UIColor whiteColor];
}
// 绘图
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    for (UIBezierPath *bPath in self.pathsArray) {
        [_lineColor setStroke];
        [bPath stroke];
    }
}
#pragma mark - set方法
// 设置线的颜色
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
}
// 设置线宽
- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
}

#pragma mark - 获取签名图片
- (UIImage *)signatureImage {
    //创建一个基于位图的上下文，并设置当前上下文
    UIGraphicsBeginImageContext(self.frame.size);
    //获取图形上下文
    CGContextRef contex = UIGraphicsGetCurrentContext();
    //裁剪区域
    UIRectClip(CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    [self.layer renderInContext:contex];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //生成 PNG 格式的图片（如果是其他格式，可以自行更改）
    NSData* imageData =  UIImagePNGRepresentation(image);
    UIImage* pngImage = [UIImage imageWithData:imageData];
    return pngImage;
}


#pragma mark - 绘图操作
/**撤销上一步操作*/
- (void)gf_undoLastDraw {
    if (self.pathsArray.count >0) {
        NSInteger index = self.pathsArray.count - 1;
        [self.backPathsArray addObject:self.pathsArray[index]];
        [self.pathsArray removeObjectAtIndex:index];
        [self setNeedsDisplay];
    }
}

/**恢复上一步的撤销操作*/
- (void)gf_redoLastDraw {
    if (self.backPathsArray.count >0) {
        NSInteger index = self.backPathsArray.count - 1;
        [self.pathsArray addObject:self.backPathsArray[index]];
        [self.backPathsArray removeObjectAtIndex:index];
        [self setNeedsDisplay];
    }
}

/**清空签名*/
- (void)gf_clearSignature {
    [self.pathsArray removeAllObjects];
    [self.backPathsArray removeAllObjects];
    [self setNeedsDisplay];
}

/**保存签名后的图片*/
- (void)gf_saveSignature {
    UIImage *signatureImage = [self signatureImage];
    UIImageWriteToSavedPhotosAlbum(signatureImage, self, nil, NULL);
}

#pragma mark - Touches Action
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches allObjects].lastObject;
    CGPoint startPoint = [touch locationInView:self];
    [self.bezierPath moveToPoint:startPoint];
    [self.pathsArray addObject:self.bezierPath];
    [self.backPathsArray removeAllObjects];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches allObjects].lastObject;
    CGPoint touchPoint = [touch locationInView:self];
    [self.bezierPath addLineToPoint:touchPoint];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.bezierPath = nil;
}
@end;
