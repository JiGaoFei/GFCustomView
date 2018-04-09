# GFCustomView
*Quickly create rich view
* Installation with CocoaPods：`pod 'GFCustomView'`


![1.gif](https://upload-images.jianshu.io/upload_images/1945476-86cedaf4e5cfb36c.gif?imageMogr2/auto-orient/strip)
~~~
- (void)setUpUI{
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
~~~
