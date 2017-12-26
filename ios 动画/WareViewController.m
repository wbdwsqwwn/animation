//
//  WareViewController.m
//  ios 动画
//
//  Created by tepusoft on 16/4/22.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "WareViewController.h"
#import "WaterWareView.h"

@interface WareViewController ()

@end

@implementation WareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*.5 + 100);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    
    WaterWareView *waterWareView = [[WaterWareView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:waterWareView];
    // Do any additional setup after loading the view.

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
