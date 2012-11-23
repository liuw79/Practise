//
//  ViewController.m
//  Practise1121
//
//  Created by liuwei on 12-11-21.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) button1Pressed:(UIButton *)sender
{
    NSString *buttonTitle = [sender titleForState:UIControlStateNormal];
    NSString *labelTitle = [NSString stringWithFormat:@"%@ button pressed.", buttonTitle];
    if (sender.tag == 2) {
        NSLog(@"button2 pressed");
    }
    [self.label1 setBackgroundColor:[UIColor colorWithRed:0.5 green:0.1 blue:0.2 alpha:1]];
    [self.label1 setText:labelTitle];
}

-(void) addImageView:(id)sender
{
    //新增一个图片
    //多次添加会有问题
    
    UIImage *image1 = [UIImage imageNamed:@"google.png"];
    UIImageView *tmpImgView = [[UIImageView alloc] initWithImage:image1];
    CGRect ivFrame = CGRectMake(0, 150, 200, 200);
    [tmpImgView setFrame:ivFrame];
    [tmpImgView setContentMode:UIViewContentModeScaleAspectFit];
    [tmpImgView retain];
    if(self.imageView1)
    {
        [self.imageView1 removeFromSuperview];
    }
    [self.imageView1 release];
    self.imageView1 = tmpImgView;
    NSLog(@"%p", self.imageView1);
    [self.view addSubview:self.imageView1];
    [tmpImgView release];
    tmpImgView = nil;
}

-(void) removeImageView:(id)sender
{
    NSLog(@"Remove pressed");
    if(self.imageView1)
    {
        [self.imageView1 removeFromSuperview];
    }
}

-(void) animateImageView:(id)sender
{
    [self addImageView:sender];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut
                     animations:^{
                         
                         [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.imageView1 cache:YES];
                         
                         //放在下面比较好
                         CGRect testFrame = self.imageView1.frame;
                         testFrame.origin.y = 250;
                         self.imageView1.frame = testFrame;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             NSLog(@"finished");
                         }
                     }
     
     ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加一个按钮冰触发事件
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:@"button2" forState:UIControlStateNormal];
    CGRect btn1Frame = [self.button1 frame];
    CGRect btn2Frame = btn1Frame;
    btn2Frame.origin.y += 50;
    [button2 setFrame:btn2Frame];
    [button2 setTag:2];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(button1Pressed:) forControlEvents:UIControlEventTouchUpInside];  //selector 里面没有手动加参数值，就能传进去
    
        
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
