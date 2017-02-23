//
//  SMSShare.h
//  SMSShare
//
//  Created by apple on 17/2/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XYMessageComposeResult)
{
    XYMessageComposeResultCancelled = 0,
    XYMessageComposeResultSent,
    XYMessageComposeResultFailed
};
typedef void(^XYMessageBlock)(XYMessageComposeResult result);

@interface SMSShare : NSObject

/**
 @brief 调用系统短信功能 单发/群发信息，并返回发送结果

 @param phoneNumbers 电话号码数组
 @param message 短信内容
 @param fromVC 从哪个控制器跳转过来
 @param handler 返回结果
 */
- (void)sendContacts:(NSArray<NSString *> *)phoneNumbers
             message:(NSString *)message
              fromVC:(UIViewController *)fromVC
          completion:(XYMessageBlock)handler;

@end
