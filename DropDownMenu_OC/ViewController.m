//
//  ViewController.m
//  DropDownMenu_OC
//
//  Created by Jimmy on 2017/9/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    DDMButton * ddmBtn;
    NSMutableArray<NSString *> * titles;
    
    UILabel * label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    titles = [[NSMutableArray alloc] initWithArray:@[@"Main Page", @"Second Page", @"Third Page", @"Fourth Page", @"Fifth Page"]];
    
    label = [[UILabel alloc] initWithFrame:self.view.bounds];
    [label setText:titles.firstObject];
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ddmBtn = [[DDMButton alloc] init:self.navigationController containerView:self.view titles:titles selectedIndex:0];
    
    UIColor * bgColor = [UIColor colorWithRed:207.0/255.0 green:207.0/255.0 blue:207.0/255.0 alpha:0.5];
    
    
    
    DDMConfiguration ddmconfig = [DDMConfigurationUtil default];
    ddmconfig.cellSelectedColor =[UIColor darkGrayColor].CGColor;
    ddmconfig.cellBackgroundColor = [UIColor whiteColor].CGColor;
    ddmconfig.cellTextColor = [UIColor blackColor].CGColor;
    ddmconfig.backgroundColor = bgColor.CGColor;
    ddmconfig.backgroundAlpha = 0.5;
    ddmconfig.durationRise = 0.40;
    ddmconfig.durationDrop = 0.40;
    [ddmBtn setupConfig:ddmconfig];
    
    
    ddmBtn.delegate = self;
    
    [self.navigationItem setTitleView:ddmBtn];
}

-(void)didSelectAtIndex:(int)index {
    [label setText:titles[index]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
