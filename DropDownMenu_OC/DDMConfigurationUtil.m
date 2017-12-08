//
//  DDMConfigurationUtil.m
//  DropDownMenu_OC
//
//  Created by Jimmy on 2017/9/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "DDMConfigurationUtil.h"



@implementation DDMConfigurationUtil

+ (DDMConfiguration) default {
    DDMConfiguration config;
    
    config.cellHeight               = 50;
    config.cellTextAlignment        = NSTextAlignmentLeft;
    config.cellTextFont             = [UIFont fontWithName:@"Steelworks Vintage"
                                                      size:25];
    config.cellTextColor            = [UIColor colorWithRed:0.2
                                                      green:0.3
                                                       blue:0.5
                                                      alpha:0.5].CGColor;
    
    config.cellSelectedColor        = [UIColor grayColor].CGColor;
    config.cellSelectedTextColor    = [UIColor whiteColor].CGColor;
    config.cellSeparatorColor       = [UIColor blackColor].CGColor;
    config.cellBackgroundColor      = [UIColor whiteColor].CGColor;
    config.cellCheckMarkImage       = [UIImage imageNamed:@"CheckMark"];
    
    config.ddmBtnTitleAlignment     = NSTextAlignmentLeft;
    config.ddmBtnTitleFont          = config.cellTextFont;
    config.ddmBtnArrowImage         = [UIImage imageNamed:@"Arrow"];
    
    config.durationDrop             = 0.2;
    config.durationRise             = 0.2;
    
    config.backgroundAlpha          = 0.5;
    config.backgroundColor          = [UIColor grayColor].CGColor;
    
    return config;
}

+ (DDMConfiguration) init: (CGFloat) cellHeight
        cellTextAlignment: (NSTextAlignment) cellTextAlignment
             cellTextFont: (UIFont *) cellTextFont
    cellSelectedTextColor: (CGColorRef) cellSelectedTextColor
            cellTextColor: (CGColorRef) cellTextColor
       cellSeparatorColor: (CGColorRef) cellSeparatorColor
      cellBackgroundColor: (CGColorRef) cellBackgroundColor
       cellCheckMarkImage: (UIImage *) cellCheckMarkImage
     ddmBtnTitleAlignment: (NSTextAlignment) ddmBtnTitleAlignment
          ddmBtnTitleFont: (UIFont *) ddmBtnTitleFont
         ddmBtnTitleColor: (CGColorRef) ddmBtnTitleColor
    ddmBtnBackgroundColor: (CGColorRef) ddmBtnBackgroundColor
         ddmBtnArrowImage: (UIImage *) ddmBtnArrowImage
             durationDrop: (NSTimeInterval) durationDrop
             durationRise: (NSTimeInterval) durationRise
          backgroundColor: (CGColorRef) backgroundColor
          backgroundAlpha: (CGFloat) backgroundAlpha {
    
    DDMConfiguration config;
    config.cellHeight = cellHeight;
    config.cellTextAlignment = cellTextAlignment;
    config.cellTextFont = cellTextFont;
    config.cellSelectedTextColor = cellSelectedTextColor;
    config.cellSeparatorColor = cellSeparatorColor;
    config.cellBackgroundColor = cellBackgroundColor;
    config.cellCheckMarkImage = cellCheckMarkImage;
    
    config.ddmBtnTitleAlignment = ddmBtnTitleAlignment;
    config.ddmBtnTitleFont = ddmBtnTitleFont;
    config.ddmBtnTitleColor = ddmBtnTitleColor;
    config.ddmBtnArrowImage = ddmBtnArrowImage;
    config.durationDrop = durationDrop;
    config.durationRise = durationRise;
    
    config.backgroundAlpha = backgroundAlpha;
    config.backgroundColor = backgroundColor;
    
    return config;
}

@end
