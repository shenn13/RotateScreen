//
//  SSBaseVC.m
//  RotateScreen
//
//  Created by shen on 17/4/12.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "SSBaseVC.h"

@interface SSBaseVC ()

@end

@implementation SSBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航栏的背景颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.0/255 green:197.0/255 blue:11.0/255 alpha:1]];
    //导航栏字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:246.0/255 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
