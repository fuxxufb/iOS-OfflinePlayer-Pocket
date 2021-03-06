//
//  UIAddViewViewController.m
//  FinalMajorProject
//
//  Created by Xiaohan Yang on 2018/7/11.
//  Copyright © 2018年 xiaohan yang. All rights reserved.
//

#import "UIAddViewViewController.h"
#import "WiFiConnectController.h"

@interface UIAddViewViewController ()

@end

@implementation UIAddViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo1];
    // Do any additional setup after loading the view.
    self.ipAddressLabel.text=[WiFiConnectController OnloadWiFiServer];
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:@"BG_transfer"ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    self.view.layer.contents=(id)image.CGImage;
    //------------------------------navigation bar
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent=true;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //-----------------------------
    self.ipAddressLabel.adjustsFontSizeToFitWidth=true;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)demo1{
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"网络响应：response：%@",response);
        NSString *html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
            [web loadHTMLString:html baseURL:nil];
            // [self.view addSubview:web];
            //[self.view sendSubviewToBack:web];
        });

        
    }];

    [dataTask resume];
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
