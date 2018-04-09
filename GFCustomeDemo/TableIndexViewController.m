/***************************************/
/*  Life is a palette， you put colors on it.    */
/***************************************/

#import "TableIndexViewController.h"
#import "GFIndexFloatView.h"
#import "GFIndexToastView.h"
#import <Masonry/Masonry.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface TableIndexViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tabelView;
/**数据源*/
@property (nonatomic,strong) NSMutableArray *titleAry;
/**index*/
@property (nonatomic,strong) GFIndexToastView *indexView;
@end

@implementation TableIndexViewController
- (NSMutableArray *)titleAry
{
    if (!_titleAry) {
        self.titleAry = [[NSMutableArray alloc] init];
    }
    return _titleAry;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleAry = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"].mutableCopy;
    self.tabelView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self.view addSubview:self.tabelView];

    self.indexView = [[GFIndexToastView alloc]initWithFrame:CGRectMake(WIDTH - 40, 100, 40, HEIGHT - 140)  indexTitleArray:self.titleAry fontSize:18 textNomorColor:[UIColor orangeColor] textSelectColor:[UIColor colorWithRed:0/250.0 green:190/250.0 blue:159/250.0 alpha:1] toastType:GFIndexToastWarerType];
    [_indexView gf_selecctIndexBlock:^(NSInteger section)  
     {
         [self.tabelView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]
                                 animated:NO
                           scrollPosition:UITableViewScrollPositionTop];
     }];
    [self.view addSubview:_indexView];
}

#pragma mark - tableviewDegate、DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleAry.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleAry.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"DangerRecordCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld区%ld行",(long)indexPath.section,indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.frame = CGRectMake(0, 0, 375, 15);
    titleLab.text = self.titleAry[section];
    return titleLab;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
