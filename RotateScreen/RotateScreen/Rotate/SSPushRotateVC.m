//
//  SSPushRotateVC.m
//  RotateScreen
//
//  Created by shen on 17/4/12.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "SSPushRotateVC.h"

@interface SSPushRotateVC ()

@end

@implementation SSPushRotateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    [button setTitle:@"强制横屏" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)buttonClicked{
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    }
    //iOS8之后在视图横屏的时候默认把状态栏隐藏掉,显示出来方法
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (1) { // 旋转支持方向 ，可加条件旋转；比如我之前的项目是在视频流出现之后才支持横屏，否则只能竖屏
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    return UIInterfaceOrientationMaskPortrait;
}

/**
 *  支持自动旋转
 */
- (BOOL)shouldAutorotate
{
    return  YES;
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
