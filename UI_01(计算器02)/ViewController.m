//
//  ViewController.m
//  UI_01(计算器02)
//
//  Created by Ibokan on 16/5/23.
//  Copyright © 2016年 king-mo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    double number1;
    double number2;
    NSString *operation;
    double temp;
}
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@end

@implementation ViewController
- (IBAction)number:(UIButton *)sender {
    if ([self.showLabel.text isEqualToString:@"0"]) {
        self.showLabel.text = sender.titleLabel.text;
    }else{
        self.showLabel.text = [self.showLabel.text stringByAppendingString:sender.titleLabel.text];
    }
}

- (IBAction)pointAction:(UIButton *)sender {
    NSRange range = [self.showLabel.text rangeOfString:@"."];
    if (range.location == NSNotFound) {
        self.showLabel.text = [self.showLabel.text stringByAppendingString:sender.titleLabel.text];
    }
    
}

- (IBAction)operation:(UIButton *)sender {
    number1 = [self.showLabel.text doubleValue];
    operation = sender.titleLabel.text;
    self.showLabel.text =  @"0";
}

- (IBAction)equalAction:(UIButton *)sender {
    number2 = [self.showLabel.text doubleValue];
    if ([operation isEqualToString:@"+"]) {
        self.showLabel.text = [NSString stringWithFormat:@"%g",number1 + number2];
    }else if ([operation isEqualToString:@"-"]){
        self.showLabel.text = [NSString stringWithFormat:@"%g",number1 - number2];
    }else if ([operation isEqualToString:@"×"]){
        self.showLabel.text = [NSString stringWithFormat:@"%g",number1 * number2];
    }else if ([operation isEqualToString:@"÷"]){
        self.showLabel.text = [NSString stringWithFormat:@"%g",number1 / number2];
    }

}
- (IBAction)percent:(UIButton *)sender {
    self.showLabel.text = [@"" stringByAppendingFormat:@"%g",[self.showLabel.text doubleValue]/100];
}
- (IBAction)posORminus:(UIButton *)sender {
    self.showLabel.text = [@"" stringByAppendingFormat:@"%g",[self.showLabel.text doubleValue]*-1];
}
//- (IBAction)buttonTouchDown:(UIButton *)sender {
//    sender.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
//}
//- (IBAction)buttonUpInside:(UIButton *)sender {
//    sender.backgroundColor = [UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
//}
- (IBAction)clear:(UIButton *)sender {
    number1 = 0;
    number2 = 0;
    operation = @"";
    temp = 0;
    self.showLabel.text = @"0";

}

//- (IBAction)percent:(UIButton *)sender {
//    percent = [self.showLabel.text doubleValue]*0.01;
//    self.showLabel.text = [NSString stringWithFormat:@"%f",percent];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _showLabel.adjustsFontSizeToFitWidth = YES; 
    
    NSLog(@"视图加载完成时调用");
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"视图将要出现");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"视图已经出现");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"视图将要消失");
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"视图已经消失");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"内存警告,程序将要退出");
}

@end
