//
//  ViewController.m
//  Solstice-AR
//
//  Created by Ronald Hernandez on 1/15/16.
//  Copyright © 2016 Solstice. All rights reserved.
//

#import "ViewController.h"
#import <LayarSDK/LayarSDK.h>

@interface ViewController ()<LayarSDKDelegate>
@property (nonatomic, retain) LayarSDK *layarSDK;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (IBAction)launchLayer:(UIButton *)sender {
    
    NSString *consumerKey = @"yourkey";
    NSString *consumerSecret = @"yoursecret";
    if (!self.layarSDK)
    {
        self.layarSDK = [LayarSDK layarSDKWithConsumerKey:consumerKey
                                        andConsumerSecret:consumerSecret andDelegate:self];
    }
    [self.layarSDK viewControllerForScanningWithCompletion:
     ^(UIViewController *viewController)
     {
         [self.layarSDK viewControllerForScanningWithCompletion:
          ^(UIViewController *viewController)
          {
              UIButton* closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 40.0f, 80.0f, 30.0f)];
              [closeButton setTitle:@"Close" forState:UIControlStateNormal];
              
              [closeButton addTarget:self action:@selector(dismissModalViewController) forControlEvents:UIControlEventTouchUpInside];
              [viewController.view addSubview:closeButton];
              
              [self presentViewController:viewController animated:YES completion:
               ^{
               }];
          }];  }];
}


@end
