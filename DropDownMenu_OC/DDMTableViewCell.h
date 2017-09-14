//
//  DDMTableViewCell.h
//  DropDownMenu_OC
//
//  Created by Jimmy on 2017/9/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDMTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UIImageView *   imgV;
@property (nonatomic) IBOutlet UILabel *       titleLabel;
@property (nonatomic) CGColorRef selectedTextColor;
@property (nonatomic) CGColorRef textColor;

- (void) setTitle:(NSString *) title andImage:(UIImage *) image;

@end
