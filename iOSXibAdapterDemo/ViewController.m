//
//  ViewController.m
//  iOSXibAdapterDemo
//
//  Created by klp on 2021/3/9.
//

#import "ViewController.h"
#import "LPCardView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    LPCardView *cardView = [[LPCardView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:cardView];
}


@end
