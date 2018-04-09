/***************************************/
/*  Life is a palette， you put colors on it.    */
/***************************************/

#import "GFIndexToastView.h"
#import <Masonry/Masonry.h>
//字体变化率
#define GF_FONT_RATE 1/10.000
//透明度变化率
#define GF_ALPHA_RATE 1/100.0000
// 屏幕宽
#define GF_WIDTH [UIScreen mainScreen].bounds.size.width
// 屏幕高
#define GF_HEIGHT [UIScreen mainScreen].bounds.size.height
//索引label的tag值
#define GF_TAG 666666
@interface GFIndexToastView ()
/**初始数值(计算用到)*/
@property (nonatomic,unsafe_unretained) CGFloat number;
/**圆的半径*/
@property (nonatomic,assign) CGFloat animationRadius;
/**普通字体颜色*/
@property (nonatomic,strong) UIColor *textNomorColor;
/**选中字体颜色*/
@property (nonatomic,strong) UIColor *textSelectColor;
/**字体大小*/
@property (nonatomic,assign) CGFloat fontSize;
/**动画视图*/
@property (nonatomic,strong) UILabel *animationLabel;
/**创建水滴*/
@property (nonatomic,strong) UIImageView *waterImageView;
/**水滴文本*/
@property (nonatomic,strong) UILabel *waterLabel;
/**类型*/
@property (nonatomic,assign) GFIndexToastViewType toastType;
@end
@implementation GFIndexToastView
#pragma mark - 懒加载
- (NSMutableArray *)indexTitleArray
{
    if (!_indexTitleArray) {
        self.indexTitleArray = [[NSMutableArray alloc] init];
    }
    return _indexTitleArray;
}
#pragma makr 创建控件
/**初始化(参数必传)
 @params  frame 位置
 @params fontSize 字体大小
 @params textNomorColor  字体颜色
 @params selectColor  选中状态下字体颜色
 @params toastType 类型
 */
- (instancetype)initWithFrame:(CGRect)frame indexTitleArray:(NSMutableArray *)array fontSize:(CGFloat)fontSize textNomorColor:(UIColor *)textNomorColor textSelectColor:(UIColor *)selectColor toastType:(GFIndexToastViewType)toastType;
{
    if ([super initWithFrame:frame]) {
        // 半径默认80
        self.animationRadius =80;
        // 普通字体颜色
        self.textNomorColor = textNomorColor;
        // 选中字体颜色
        self.textSelectColor = selectColor;
        // 字体
        self.fontSize = fontSize;
        // 赋值
        self.indexTitleArray = array;
        self.toastType = toastType;
        //根据类型创建响应的视图
        if (toastType == GFIndexToastWarerType) {
            [self initWaterView];
        }else{
            // 默认矩形
            [self initView];
        }
        // 创建序列
        [self setUpUI];
    }
    return self;
}
#pragma mark Set方法
#pragma mark - 创建UI
- (void)initView {
    // 创建展示
    self.animationLabel = [[UILabel alloc]init];
    _animationLabel.layer.masksToBounds = YES;
    _animationLabel.layer.cornerRadius = 5.0;
    _animationLabel.backgroundColor = [UIColor grayColor];
    _animationLabel.textColor = [UIColor whiteColor];
    _animationLabel.alpha = 0;
    _animationLabel.textAlignment = NSTextAlignmentCenter;
    _animationLabel.font = [UIFont systemFontOfSize:22];
    [self addSubview:self.animationLabel];
}
- (void)initWaterView{
    // 创建水滴
    self.waterImageView = [[UIImageView alloc] init];
    // 设置文件路径
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"GFCustomView" ofType:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
    NSString *waterImageStr = [resourceBundle pathForResource:@"ic_fd@3x" ofType:@"png"];
    self.waterImageView.image = [UIImage imageNamed:waterImageStr];
    self.waterImageView.alpha = 0;
    self.waterImageView.userInteractionEnabled = YES;
    [self addSubview:self.waterImageView];
    // 创建水滴文本
    self.waterLabel = [[UILabel alloc] init];
    self.waterLabel.textColor = [UIColor whiteColor];
    self.waterLabel.font =  [UIFont fontWithName:@"Helvetica-Bold" size:self.fontSize];
    [self.waterImageView addSubview:self.waterLabel];
}
// 创建索引
- (void)setUpUI
{
    CGFloat hh = self.frame.size.height/self.indexTitleArray.count;
    for (int i = 0; i < self.indexTitleArray.count; i ++)
    {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, i * hh, self.frame.size.width, hh)];
        label.text = self.indexTitleArray[i];
        label.tag = GF_TAG + i;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = self.textNomorColor;
        label.font = [UIFont systemFontOfSize:self.fontSize];
        [self addSubview:label];
        _number = label.font.pointSize;
    }
}
#pragma makr - 动画
-(void)animationWithSection:(NSInteger)section
{
    self.selectedBlock(section);
    _animationLabel.text = self.indexTitleArray[section];
    // 根据类型隐藏
    if (self.toastType == GFIndexToastWarerType) {
        self.waterImageView.alpha = 1.0;
    }else{
        _animationLabel.alpha = 1.0;
    }
}

#pragma mark  - 动画
// 手势开始动画
-(void)panAnimationBeginWithToucher:(NSSet<UITouch *> *)touches
{
    // 获取点击对象
    UITouch * touch = [touches anyObject];
    // 获取点击点
    CGPoint point = [touch locationInView:self];
    // 获取每个标题高度
    CGFloat hh = self.frame.size.height/self.indexTitleArray.count;
    
    for (int i = 0; i < self.indexTitleArray.count; i ++)
    {
        UILabel * label = (UILabel *)[self viewWithTag:GF_TAG + i];
        label.textColor =self.textNomorColor;
        // fabs求绝对值
        if (fabs(label.center.y - point.y) <= hh/2)
        {
            label.textColor = self.textSelectColor;
            
            // 根据类型隐藏
            if (self.toastType == GFIndexToastWarerType) {
                CGRect rect = self.waterImageView.frame;
                rect.origin.y =  label.center.y - 15 ;
                self.waterImageView.frame = rect;
                self.waterImageView.alpha = 1;
                self.waterLabel.text = self.indexTitleArray[i];
            }else{
                self.animationLabel.text = self.indexTitleArray[i];
                self.animationLabel.alpha = 1;
            }
            // 回调选中的
            if (self.selectedBlock) {
                self.selectedBlock(i);
            }
        }
    }
}

// 点击开始
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self panAnimationBeginWithToucher:touches];
}
// 手势离开时
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self panAnimationBeginWithToucher:touches];
}
// 结束时
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5 animations:^{
        if (self.toastType == GFIndexToastWarerType) {
            self.waterImageView.alpha = 0;
        }else{
            self.animationLabel.alpha = 0;
        }
    }];
}
// 回调选中
- (void)gf_selecctIndexBlock:(GFIndexBlock)block
{
    self.selectedBlock = block;
}
#pragma makr 布局控件
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.toastType  == GFIndexToastWarerType) {
        //  布局水滴
        [self.waterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_left).offset(-10);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(36, 30));
        }];
        // 布局水滴文本
        [self.waterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.waterImageView.mas_centerX).offset(-3);
            make.centerY.equalTo(self.waterImageView.mas_centerY);
        }];
    }else{
        [self.animationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(-GF_WIDTH/2 + self.frame.size.width/2);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
}
-(void)dealloc
{
    self.animationLabel = nil;
    self.waterImageView = nil;
    self.waterLabel  = nil;
    self.indexTitleArray = nil;
    self.selectedBlock = nil;
}
@end
