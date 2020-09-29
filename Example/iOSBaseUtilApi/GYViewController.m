//
//  GYViewController.m
//  iOSBaseUtilApi
//
//  Created by tttt870226 on 09/28/2020.
//  Copyright (c) 2020 tttt870226. All rights reserved.
//

#import "GYViewController.h"
#import "iOSBaseUtilApi.h"

@interface GYViewController ()

@end

@implementation GYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* appName = [BaseUtilApi getDetailPhoneType];
    NSLog(@"appname = %@",appName);
    
    [NetRequest requestWithMethods:@"GET" url:nil params:nil cookies:nil block:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
