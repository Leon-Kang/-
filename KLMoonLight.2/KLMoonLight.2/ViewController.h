//
//  ViewController.h
//  KLMoonLight.2
//
//  Created by 康梁 on 15/11/21.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) AVCaptureDevice *capDevice;
@property (nonatomic) BOOL isLightOn;

@end

