//
//  VCRoot.m
//  JJ连连看
//
//  Created by J J on 2018/3/1.
//  Copyright © 2018年 J J. All rights reserved.
//

#import "VCRoot.h"
#import "VCSecond.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏
    self.title = @"连连看游戏之JJ篇";
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:26],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //按钮
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(width / 2 - 50, height - 188, 100, 50);
    [_button setTitle:@"PLAY" forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    //Label
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, height - 320, width, 50)];
    _label.text = @"不会玩游戏的程序员，不是好程序员";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont boldSystemFontOfSize:23];
    _label.textColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    //label01
    _label01 = [[UILabel alloc] initWithFrame:CGRectMake(0, height - 130, width, 50)];
    _label01.text = @"Developed By 叁個柒";
    _label01.font = [UIFont boldSystemFontOfSize:20];
    _label01.textColor = [UIColor grayColor];
    _label01.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label01];
    
    //imageView
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"777.JPG"]];
    _imageView.frame = CGRectMake(50, 100, width - 100, width - 100);
    [self.view addSubview:_imageView];
}

- (void)pressBtn
{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = @"cube";
    animation.subtype = kCAGravityTop;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    VCSecond *second = [[VCSecond alloc] init];
    
    [self.navigationController pushViewController:second animated:YES];
    
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
