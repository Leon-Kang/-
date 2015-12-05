//
//  KLWebViewController.m
//  Web test
//
//  Created by 康梁 on 15/12/2.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLWebViewController.h"

@interface KLWebViewController ()



@end

@implementation KLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
    
#pragma mark 广播信息
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KLogin" object:@"Hello World"];
}




- (void)setURL:(NSURL *)URL {
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

@end
