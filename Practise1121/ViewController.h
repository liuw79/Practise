//
//  ViewController.h
//  Practise1121
//
//  Created by liuwei on 12-11-21.
//  Copyright (c) 2012年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *label1;
@property (nonatomic, retain) IBOutlet UIButton *button1;

@property (nonatomic, retain) UIImageView *imageView1;


-(IBAction) button1Pressed:(id)sender;

-(IBAction) addImageView:(id)sender;
-(IBAction) removeImageView:(id)sender;
-(IBAction) animateImageView:(id)sender;

@end
