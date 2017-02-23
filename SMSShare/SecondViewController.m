//
//  SecondViewController.m
//  SMSShare
//
//  Created by apple on 17/2/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "SecondViewController.h"
#import "SMSShare.h"

@interface SecondViewController ()
@property (nonatomic, strong) SMSShare *share;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(150, 150, 50, 50);
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:@"邀请" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor greenColor];
    
    UIButton *btn1 =[UIButton buttonWithType:UIButtonTypeCustom];

    btn1.frame = CGRectMake(200, 200, 50, 50);
    
    [self.view addSubview:btn1];
    
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    
    [btn1 setTitle:@"sms" forState:UIControlStateNormal];
    
    btn1.backgroundColor = [UIColor greenColor];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)btn1{
    SMSShare  *share = [[SMSShare alloc]init];
    [share sendContacts:@[@"10010"]  message:@"This is a test" fromVC:self completion:^(XYMessageComposeResult result) {
        
    }];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)dealloc{
    
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
