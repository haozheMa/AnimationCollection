//
//  ViewController.m
//  AnimationCollection
//
//  Created by 马浩哲 on 16/11/16.
//  Copyright © 2016年 junanxin. All rights reserved.
//

#import "ViewController.h"
#import "CircleLoadingAnimation.h"
#import "WaterRippleLoadingAnimation.h"
#import "LearnAnimationVC.h"
#import "ImageHandleVC.h"
#import "POPViewController.h"
#import "POPSpringAnimationVC.h"
#import "EasingAnimationVC.h"
#import "CAEmitterLayerVC.h"
#import "MaskVC.h"
#import "ProgressClassVC.h"
#import "SystemFontController.h"
#import "PopAlertViewVC.h"
#import "MJRefresh.h"
#import "MHZAnimationHeader.h"
#import "MHZNormalHeader.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, strong) NSArray *itemArrays;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画收集";
    
    self.navigationController.navigationBar.translucent = NO;
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.mj_header = [MHZAnimationHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    _tableview.mj_header = [MHZNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    [self.view addSubview:_tableview];
}

-(NSArray *)itemArrays
{
    if (_itemArrays == nil) {
        _itemArrays = [[NSArray alloc] init];
        _itemArrays = @[@"加载动画",@"水纹动画",@"学习动画",@"图片模糊处理",@"POP动画",@"弹簧效果",@"缓动函数动画",@"粒子效果",@"遮罩",@"模拟表盘页面",@"系统字体",@"AlertView"];
    }
    return _itemArrays;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArrays.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _itemArrays[indexPath.row];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, kDeviceWidth, 0.5)];
    lineView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.f];
    [cell.contentView addSubview:lineView];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        CircleLoadingAnimation *lodingVC = [[CircleLoadingAnimation alloc] init];
        [self.navigationController pushViewController:lodingVC animated:YES];
    }else if (indexPath.row == 1){
        WaterRippleLoadingAnimation *waterVC = [[WaterRippleLoadingAnimation alloc] init];
        [self.navigationController pushViewController:waterVC animated:YES];
    }else if (indexPath.row == 2){
        LearnAnimationVC *learnVC = [[LearnAnimationVC alloc] init];
        [self.navigationController pushViewController:learnVC animated:YES];
    }else if (indexPath.row == 3){
        ImageHandleVC *imagVC = [[ImageHandleVC alloc] init];
        [self.navigationController pushViewController:imagVC animated:YES];
    }else if (indexPath.row == 4){
        POPViewController *popVC = [[POPViewController alloc] init];
        [self.navigationController pushViewController:popVC animated:YES];
    }else if (indexPath.row == 5){
        POPSpringAnimationVC *springVC = [[POPSpringAnimationVC alloc] init];
        [self.navigationController pushViewController:springVC animated:YES];
    }else if (indexPath.row == 6){
        EasingAnimationVC *easingVC = [[EasingAnimationVC alloc] init];
        [self.navigationController pushViewController:easingVC animated:YES];
    }else if (indexPath.row == 7){
        CAEmitterLayerVC *emitterVC = [[CAEmitterLayerVC alloc] init];
        [self.navigationController pushViewController:emitterVC animated:YES];
    }else if (indexPath.row == 8){
        MaskVC *maskVC = [[MaskVC alloc] init];
        [self.navigationController pushViewController:maskVC animated:YES];
    }else if (indexPath.row == 9){
        ProgressClassVC *progress = [[ProgressClassVC alloc] init];
        [self.navigationController pushViewController:progress animated:YES];
    }else if (indexPath.row == 10){
        SystemFontController *fontVC = [[SystemFontController alloc] init];
        [self.navigationController pushViewController:fontVC animated:YES];
    }else if (indexPath.row == 11){
        PopAlertViewVC *alertVC = [[PopAlertViewVC alloc] init];
        [self.navigationController pushViewController:alertVC animated:YES];
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

//MARK: 交互事件
-(void)loadNewData{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tableview.mj_header endRefreshing];
    });
}

@end
