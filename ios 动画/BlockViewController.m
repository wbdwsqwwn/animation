//
//  BlockViewController.m
//  ios 动画
//
//  Created by tepusoft on 16/4/22.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@property (nonatomic ,strong) CALayer *secondLayout;
@property (nonatomic, strong) CALayer *minuteLayout;
@property (nonatomic, strong) CALayer *hourLayout;

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self blockLayout];
    // Do any additional setup after loading the view.
}


-(void)blockLayout
{
    //view的宽高
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    //钟表的宽高
    CGFloat blockWidth = 100;
    CGFloat blockHeight = 100;
    
    //表盘图层
    CALayer *layout = [CALayer layer];
    layout.frame  = CGRectMake((width-blockWidth)/2, (height-blockHeight)/2, blockWidth, blockHeight);
    layout.backgroundColor = [UIColor brownColor].CGColor;
    layout.cornerRadius = 50;
    layout.borderColor = [UIColor blackColor].CGColor;
    layout.borderWidth = 4.0;
    [self.view.layer addSublayer:layout];
    
    //时针图层
    _hourLayout =  [CALayer layer];
    _hourLayout.frame = CGRectMake((blockWidth-3)/2, 10, 3, 45);
    _hourLayout.position = CGPointMake(blockWidth/2, blockHeight/2);//锚点的位置
    _hourLayout.anchorPoint = CGPointMake(0.5, 8/9.0);//设置锚点
    _hourLayout.backgroundColor = [UIColor redColor].CGColor;//颜色
    _hourLayout.cornerRadius = 1.5;//圆角
    [layout addSublayer:_hourLayout];
    
    //分针图层
    _minuteLayout =  [CALayer layer];
    _minuteLayout.frame = CGRectMake((blockWidth-2)/2, 5, 2, 50);
    _minuteLayout.position = CGPointMake(blockWidth/2, blockHeight/2);
    _minuteLayout.anchorPoint = CGPointMake(0.5, 9/10.0);
    _minuteLayout.backgroundColor = [UIColor blueColor].CGColor;
    _minuteLayout.cornerRadius = 1;
    [layout addSublayer:_minuteLayout];
    
    //秒针图层
    _secondLayout =  [CALayer layer];
    _secondLayout.frame = CGRectMake((blockWidth-1)/1, 0, 1, 55);
    _secondLayout.position = CGPointMake(blockWidth/2, blockHeight/2);
    _secondLayout.backgroundColor = [UIColor yellowColor].CGColor;
    _secondLayout.anchorPoint = CGPointMake(0.5, 10/11.0);
    _secondLayout.cornerRadius = 0.5;
    [layout addSublayer:_secondLayout];
    
    //定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(secondRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

-(void)secondRun
{
    dispatch_async(dispatch_get_main_queue(), ^{
        _secondLayout.transform = CATransform3DRotate(_secondLayout.transform, 6*M_PI/180.0, 0, 0, 1);//旋转
        _minuteLayout.transform = CATransform3DRotate(_minuteLayout.transform, 0.1*M_PI/180.0, 0, 0, 1);
        _hourLayout.transform = CATransform3DRotate(_hourLayout.transform, 1/120*M_PI/180, 0, 0, 1);
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
