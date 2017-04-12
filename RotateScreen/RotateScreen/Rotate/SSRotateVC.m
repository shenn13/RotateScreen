//
//  SSRotateVC.m
//  RotateScreen
//
//  Created by shen on 17/4/12.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "SSRotateVC.h"
#import "SSModalRoteteVC.h"
#import "SSPushRotateVC.h"

//屏幕的宽和高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface SSRotateVC ()

@end

@implementation SSRotateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"旋转";
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - 250)/2, 200, 100, 30)];
    [btn1 setTitle:@"Modal" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor blackColor]];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(modalButtonclick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn1.frame) + 50, 200, 100, 30)];
    [btn2 setTitle:@"Push" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor blackColor]];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(pushButtonclick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    
}
-(void)modalButtonclick{
    
    [self presentViewController:[[SSModalRoteteVC alloc] init] animated:YES completion:nil];
    
}

-(void)pushButtonclick{
    
    [self.navigationController pushViewController:[[SSPushRotateVC alloc] init] animated:YES];
    
}

//支持旋转
-(BOOL)shouldAutorotate{
    return YES;
}
//支持的方向 因为界面A我们只需要支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;
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
