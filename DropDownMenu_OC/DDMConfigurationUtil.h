//
//  DDMConfigurationUtil.h
//  DropDownMenu_OC
//
//  Created by Jimmy on 2017/9/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// A configuration that allows users to customize their DDM
typedef struct DDMConfiguration {
    CGFloat                                 cellHeight;
    NSTextAlignment                         cellTextAlignment;
    __unsafe_unretained UIFont *            cellTextFont;
    CGColorRef                              cellSelectedTextColor;
    CGColorRef                              cellTextColor;
    CGColorRef                              cellSeparatorColor;
    CGColorRef                              cellSelectedColor;
    CGColorRef                              cellBackgroundColor;
    __unsafe_unretained UIImage *           cellCheckMarkImage;
    
    NSTextAlignment                         ddmBtnTitleAlignment;
    __unsafe_unretained UIFont *            ddmBtnTitleFont;
    CGColorRef                              ddmBtnTitleColor;
    CGColorRef                              ddmBtnBackgroundColor;
    __unsafe_unretained UIImage *           ddmBtnArrowImage;
    
    NSTimeInterval  durationDrop;
    NSTimeInterval  durationRise;
    BOOL            shouldChangeTitle;
    
    CGColorRef                              backgroundColor;
    CGFloat                                 backgroundAlpha;
} DDMConfiguration;

@interface DDMConfigurationUtil : NSObject {}

+ (DDMConfiguration) default;
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
          backgroundAlpha: (CGFloat) backgroundAlpha;

@end
