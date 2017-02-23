//
//  ViewController.m
//  SMSShare
//
//  Created by apple on 17/2/22.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "SMSShare.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SecondViewController *second = [[SecondViewController alloc]init];
    [self presentViewController:second animated:YES completion:nil];


}

//-(void)showMessageView:(NSArray *)phones title:(NSString *)title body:(NSString *)body
//{
//    if( [MFMessageComposeViewController canSendText] )
//    {
//        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc] init];
//        controller.recipients = phones;
////        controller.navigationBar.tintColor = [UIColor redColor];
//        controller.body = body;
////        controller.view.backgroundColor = [UIColor yellowColor];
//        controller.messageComposeDelegate = self;
//        //修改短信界面标题
////        [[[[controller viewControllers] lastObject] navigationItem] setTitle:title];
//        
//        [self presentViewController:controller animated:YES completion:nil];
//        
//    }
//    else
//    {
//        
//        
//        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示信息" message:@"该设备不支持短信功能"preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
//        
//        [alert addAction:defaultAction];
//        
//        [self presentViewController:alert animated:YES completion:nil];
//    }
//}
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
