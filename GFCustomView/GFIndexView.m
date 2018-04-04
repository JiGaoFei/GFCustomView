/***************************************/
/*  Life is a palette， you put colors on it.    */
/***************************************/

#import "GFIndexView.h"
#import <Masonry/Masonry.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface GFIndexView ()
@end
@implementation GFIndexView
#pragma mark - 懒加载
- (NSMutableArray *)indexTitleArray
{
    if (!_indexTitleArray) {
        self.indexTitleArray = [[NSMutableArray alloc] init];
    }
    return _indexTitleArray;
}
#pragma makr 创建控件
- (instancetype)initWithFrame:(CGRect)frame indexTitleArray:(NSMutableArray *)array
{
    if ([super initWithFrame:frame]) {
        // 赋值
        self.indexTitleArray = array;
        // 创建展示label
        [self initView];
        // 创建序列
        [self setUpUI];
    }
    return self;
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


- (void)setUpUI
{
    CGFloat hh = self.frame.size.height/self.indexTitleArray.count;
    for (int i = 0; i < self.indexTitleArray.count; i ++)
    {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, i * hh, self.frame.size.width, hh)];
        label.text = self.indexTitleArray[i];
        label.tag = TAG + i;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = STR_COLOR;
        label.font = FONT_SIZE;
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
        UILabel * label = (UILabel *)[self viewWithTag:TAG + i];
        [UIView animateWithDuration:0.2 animations:^{
            label.center = CGPointMake(self.frame.size.width/2, i * hh + hh/2);
            label.font = FONT_SIZE;
            label.alpha = 1.0;
            label.textColor = STR_COLOR;
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
        UILabel * label = (UILabel *)[self viewWithTag:TAG + i];
        // fabs求绝对值
        if (fabs(label.center.y - point.y) <= ANIMATION_HEIGHT)
        {
            [UIView animateWithDuration:0.2 animations:^{
                // 计算动画中的中心
                label.center = CGPointMake(label.bounds.size.width/2 - sqrt(fabs(ANIMATION_HEIGHT * ANIMATION_HEIGHT - fabs(label.center.y - point.y) * fabs(label.center.y - point.y))), label.center.y);
                // 字体
                label.font = [UIFont systemFontOfSize:_number + (ANIMATION_HEIGHT - fabs(label.center.y - point.y)) * FONT_RATE];
                
                if (fabs(label.center.y - point.y) * ALPHA_RATE <= 0.08)
                {
                    label.textColor = MARK_COLOR;
                    label.alpha = 1.0;
                    
                    [self animationWithSection:i];
                    
                    for (int j = 0; j < self.indexTitleArray.count; j ++)
                    {
                        UILabel * label = (UILabel *)[self viewWithTag:TAG + j];
                        if (i != j)
                        {
                            label.textColor = STR_COLOR;
                            label.alpha = fabs(label.center.y - point.y) * ALPHA_RATE;
                        }
                    }
                }
            }];
            
        }else
        {
            [UIView animateWithDuration:0.2 animations:^
             {
                 label.center = CGPointMake(self.frame.size.width/2, i * hh + hh/2);
                 label.font = FONT_SIZE;
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
        make.left.equalTo(self.mas_left).offset(-WIDTH/2 + self.frame.size.width/2);
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
