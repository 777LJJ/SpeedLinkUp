//
//  VCSecond.m
//  JJ连连看
//
//  Created by J J on 2018/3/1.
//  Copyright © 2018年 J J. All rights reserved.
//

#import "VCSecond.h"

@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
   
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(Back)];
    button.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = button;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, width, 100)];
    _label.text = @"GOOD SHOW!";
    _label.font = [UIFont boldSystemFontOfSize:50];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    _label01 = [[UILabel alloc] initWithFrame:CGRectMake(0, height - 120, width, 50)];
    _label01.text = @"開發者:叁個柒";
    _label01.textColor = [UIColor grayColor];
    _label01.font = [UIFont boldSystemFontOfSize:20];
    _label01.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label01];
    
    [self startGame];
}

- (void)startGame
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    //图像名字数组
    NSMutableArray *arrayStr = [[NSMutableArray alloc] init];
    
    for (int k = 0; k < 18; k ++)
    {
        int random = arc4random() % 7 + 1;
        
        NSString *strName = [NSString stringWithFormat:@"%d",random];
        
        //添加到数组中
        [arrayStr addObject:strName];
        [arrayStr addObject:strName];
    }
    //循环创建36个按钮
    for (int i = 0; i < 6; i ++)
    {
        for (int j = 0; j < 6; j ++)
        {
            //创建自定义按钮
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            //创建动画效果
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            btn.frame = CGRectMake(5 + (width - 10) / 6 * j, 150 + (width - 10) / 6 * i, 70, 70);
            [UIView commitAnimations];
            
            //产生随机图片
            //产生随机数
            int indexRandom = arc4random() % arrayStr.count;
            
            //从图像数组中取出文件名
            NSString *strImage = arrayStr[indexRandom];
            //
            NSInteger tag = [strImage integerValue];
            //删掉取出的文件
            [arrayStr removeObjectAtIndex:indexRandom];            UIImage *image = [UIImage imageNamed:strImage];
            
            [btn setImage:image forState:UIControlStateNormal];
            
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            //将按钮的标志位赋值
            btn.tag = tag;
            
            [self.view addSubview:btn];
        }
    }
}

- (void)pressBtn:(UIButton *)btn
{
    //创建一个静态变量保存第一次按下的按钮
    static UIButton *btnFirst = nil;
    
    if (btnFirst == nil)
    {
        btnFirst = btn;
        
        //锁定第一个按钮
        btnFirst.enabled = NO;
    }
    else
    {
        //两个按钮图像相同
        if (btnFirst.tag == btn.tag)
        {
            btnFirst.hidden = YES;
            btn.hidden = YES;
            btnFirst = nil;
        }
        //按钮图像不相同
        else
        {
            btnFirst.enabled = YES;
            btnFirst = nil;
            
            UIAlertController *_alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"点击错误" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            
            [_alertController addAction:ok];
            
            [self presentViewController:_alertController animated:YES completion:nil];
        }
    }
}

- (void)Back
{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = @"suckEffect";
    animation.subtype = kCAGravityTop;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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
