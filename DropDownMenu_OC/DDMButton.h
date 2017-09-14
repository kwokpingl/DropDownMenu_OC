//
//  DDMButton.h
//  DropDownMenu_OC
//
//  Created by Jimmy on 2017/9/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMConfigurationUtil.h"
#import "DDMTableViewCell.h"
#import "UIView+JLView.h"

@protocol DDMProtocol

- (void) didSelectAtIndex:(int) index;

@end

@interface DDMButton : UIButton <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) DDMConfiguration ddmConfig ;
@property (nonatomic, weak) id <DDMProtocol> delegate;

- (instancetype) init: (UINavigationController *) navigationController
        containerView:(UIView *)containerView
               titles:(NSArray<NSString *> *) titles
        selectedIndex:(int) index;

- (void) setupConfig: (DDMConfiguration) config;

@end
