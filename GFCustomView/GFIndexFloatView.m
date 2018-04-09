/***************************************/
/*  Life is a palette， you put colors on it.    */
/***************************************/

#import "GFIndexFloatView.h"
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
@interface GFIndexFloatView ()
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
@end
@implementation GFIndexFloatView
#pragma mark - 懒加载
- (NSMutableArray *)indexTitleArray
{
    if (!_indexTitleArray) {
        self.indexTitleArray = [[NSMutableArray alloc] init];
    }
    return _indexTitleArray;
}
#pragma makr 创建控件
- (instancetype)initWithFrame:(CGRect)frame indexTitleArray:(NSMutableArray *)array fontSize:(CGFloat)fontSize textNomorColor:(UIColor *)textNomorColor textSelectColor:(UIColor *)selectColor
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
        // 创建展示label
        [self initView];
        // 创建序列
        [self setUpUI];
    }
    return self;
}
#pragma mark Set方法

// 设置动画半径
- (void)setAnimationRadius:(CGFloat)animationRadius
{
    _animationRadius = animationRadius;
    if (_animationRadius>0) {
        _animationRadius = animationRadius;
    }else{
       _animationRadius = 60;
    }
}
#pragma mark - 创建UI
- (void)initView {
    // 创建展示
    self.animationLabel = [[UILabel alloc]init];
    _animationLabel.layer.masksToBounds = YES;
    _animationLabel.layer.cornerRadius = 5.0f;
    _animationLabel.backgroundColor = [UIColor grayColor];
    _animationLabel.textColor = [UIColor whiteColor];
    _animationLabel.alpha = 0;
    _animationLabel.textAlignment = NSTextAlignmentCenter;
    _animationLabel.font = [UIFont systemFontOfSize:22];
    [self addSubview:self.animationLabel];
}
// 创建序列
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
    _animationLabel.alpha = 1.0;
}

// 手势结束动画
-(void)panAnimationFinish
{
    CGFloat hh = self.frame.size.height/self.indexTitleArray.count;
    
    for (int i = 0; i < self.indexTitleArray.count; i ++)
    {
        UILabel * label = (UILabel *)[self viewWithTag:GF_TAG + i];
        [UIView animateWithDuration:0.2 animations:^{
            label.center = CGPointMake(self.frame.size.width/2, i * hh + hh/2);
            label.font = [UIFont systemFontOfSize:self.fontSize];
            label.alpha = 1.0;
            label.textColor =self.textNomorColor;
        }];
    }
    
    [UIView animateWithDuration:1 animations:^{
        self.animationLabel.alpha = 0;
    }];
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
        // fabs求绝对值
        if (fabs(label.center.y - point.y) <= self.animationRadius)
        {
            [UIView animateWithDuration:0.2 animations:^{
                // 计算动画中的中心
                label.center = CGPointMake(label.bounds.size.width/2 - sqrt(fabs(self.animationRadius * self.animationRadius - fabs(label.center.y - point.y) * fabs(label.center.y - point.y))), label.center.y);
                // 字体
                label.font = [UIFont systemFontOfSize:_number + (self.animationRadius - fabs(label.center.y - point.y)) * GF_FONT_RATE];
                
                if (fabs(label.center.y - point.y) * GF_ALPHA_RATE <= 0.08)
                {
                    label.textColor =  self.textSelectColor;
                    label.alpha = 1.0;
                    
                    [self animationWithSection:i];
                    
                    for (int j = 0; j < self.indexTitleArray.count; j ++)
                    {
                        UILabel * label = (UILabel *)[self viewWithTag:GF_TAG + j];
                        if (i != j)
                        {
                            label.textColor = self.textNomorColor;
                            label.alpha = fabs(label.center.y - point.y) * GF_ALPHA_RATE;
                        }
                    }
                }
            }];
            
        }else
        {
            [UIView animateWithDuration:0.2 animations:^
             {
                 label.center = CGPointMake(self.frame.size.width/2, i * hh + hh/2);
                 label.font =[UIFont systemFontOfSize:self.fontSize];
                 label.alpha = 1.0;
             }];
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
// 取消时
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self panAnimationFinish];
}
// 结束时
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self panAnimationFinish];
}
// 回调选中
- (void)gf_selecctIndexBlock:(GFIndexBlock)block
{
    self.selectedBlock = block;
}

#pragma makr 布局控件
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.animationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(-GF_WIDTH/2 + self.frame.size.width/2);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
}

-(void)dealloc
{
    self.animationLabel = nil;
    self.indexTitleArray = nil;
    self.selectedBlock = nil;
}
@end
