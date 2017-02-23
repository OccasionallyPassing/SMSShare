//
//  SMSShare.m
//  SMSShare
//
//  Created by apple on 17/2/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "SMSShare.h"
#import <MessageUI/MessageUI.h>
#import <objc/runtime.h>
NSString *const SMSSHARE_BINDING_KEY = @"com.fengguowangluo.SMSSHAREBINDINGKEY";

@interface SMSShare()<MFMessageComposeViewControllerDelegate>

@property (nonatomic, copy) XYMessageBlock messageBlock;
@property (nonatomic, strong) UIViewController *fromVC;

@end

@implementation SMSShare

- (void)sendContacts:(NSArray<NSString *> *)phoneNumbers
             message:(NSString *)message
              fromVC:(UIViewController *)fromVC
          completion:(XYMessageBlock)handler{
    
    self.messageBlock = handler;
    self.fromVC = fromVC;
    if( [MFMessageComposeViewController canSendText] )
    {
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc] init];
        objc_setAssociatedObject(fromVC, (__bridge const void *)SMSSHARE_BINDING_KEY, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        controller.recipients = phoneNumbers;
        controller.body = message;
        controller.view.backgroundColor = [UIColor yellowColor];
        controller.messageComposeDelegate = self;
        [fromVC presentViewController:controller animated:YES completion:nil];
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示信息" message:@"该设备不支持短信功能"preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
     }
}


#pragma mark - MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    [self.fromVC dismissViewControllerAnimated:YES completion:^{
        if (self.messageBlock) {
            NSInteger num = result;
            self.messageBlock(num);
        }
        objc_setAssociatedObject(self.fromVC, (__bridge const void *)SMSSHARE_BINDING_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
}

- (void)dealloc{
    
}
@end
