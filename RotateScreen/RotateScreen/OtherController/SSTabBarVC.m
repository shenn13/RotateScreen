//
//  SSTabBarVC.m
//  RotateScreen
//
//  Created by shen on 17/4/12.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "SSTabBarVC.h"
#import "SSNavigationVC.h"


@interface SSTabBarVC ()

@end

@implementation SSTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //工具栏背景颜色
     [self.tabBar setBarTintColor:[UIColor colorWithRed:0.0/255 green:197.0/255 blue:11.0/255 alpha:1]];
    
    
    [self addSubViewsControllers];
    [self customTabbarItem];
    
}

-(void)addSubViewsControllers{
    NSArray *classControllers = @[@"SSRotateVC",@"SSUnrotateVC"];
    NSMutableArray *conArr = [NSMutableArray array];
    
    for (int i = 0; i < classControllers.count; i ++) {
        Class cts = NSClassFromString(classControllers[i]);
        
        UIViewController *vc = [[cts alloc] init];
        SSNavigationVC *naVC = [[SSNavigationVC alloc] initWithRootViewController:vc];
        [conArr addObject:naVC];
    }
    self.viewControllers = conArr;
}

-(void)customTabbarItem{
    
    NSArray *titles = @[@"旋转",@"不可旋转"];
    
    for (int i = 0; i < titles.count; i++) {
        
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:nil selectedImage:nil];
        
    }
    
}

/**
 *   shouldAutorotate  supportedInterfaceOrientations调用顺序最底层容器控制器有优先权级别，先判断tabbarController,再判断navgationController，在具体的某个contoller
 *
 */
- (BOOL)shouldAutorotate{
    if ([self.selectedViewController isEqual:[self.viewControllers objectAtIndex:0]]) {
        return [self.selectedViewController shouldAutorotate];
    }
    return NO; // tabbar第一栏旋转控制交给下级控制器，其他栏不支持自动旋转
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if ([self.selectedViewController isEqual:[self.viewControllers objectAtIndex:0]]) {
        return [self.selectedViewController supportedInterfaceOrientations];
    }
    return UIInterfaceOrientationMaskPortrait; // tabbar第一栏控制器所支持旋转方向交给下级控制器处理，其他栏只支持竖屏方向
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
