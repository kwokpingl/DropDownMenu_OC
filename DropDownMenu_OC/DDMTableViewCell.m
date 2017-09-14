//
//  DDMTableViewCell.m
//  DropDownMenu_OC
//
//  Created by Jimmy on 2017/9/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "DDMTableViewCell.h"

@interface DDMTableViewCell() {
    
}

@end

@implementation DDMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    if (selected) {
        [_imgV setHidden:false];
        [_titleLabel setTextColor:[UIColor colorWithCGColor:_selectedTextColor]];
    } else {
        [_imgV setHidden:true];
        [_titleLabel setTextColor:[UIColor colorWithCGColor:_textColor]];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void) setupUI {
    _imgV = [UIImageView new];
    _imgV.translatesAutoresizingMaskIntoConstraints = false;
    [_imgV setClipsToBounds:true];
    
    _titleLabel = [UILabel new];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [self addSubview:_imgV];
    [self addSubview:_titleLabel];
    
    NSLayoutConstraint * titleLabelTop = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_titleLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:-8];
    NSLayoutConstraint * titleLabelBottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:8];
    NSLayoutConstraint * titleLabelLeading = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_titleLabel attribute:NSLayoutAttributeLeading multiplier:1.0 constant:-8];
    NSLayoutConstraint * titleLabelTrailing = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:_imgV attribute:NSLayoutAttributeLeading multiplier:1.0 constant:8];
    NSLayoutConstraint * imgVCenterY = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_imgV attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint * imgVHeight = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_imgV attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    NSLayoutConstraint * imgVWidth = [NSLayoutConstraint constraintWithItem:_imgV attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_imgV attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    NSLayoutConstraint * imgVTrailing = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_imgV attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:8];
    
    [self addConstraints:@[titleLabelTop, titleLabelBottom, titleLabelLeading, titleLabelTrailing, imgVCenterY, imgVHeight, imgVWidth, imgVTrailing]];
}

- (void) setTitle:(NSString *) title andImage:(UIImage *) image {
    
    if (image != nil) {
        [_imgV setImage:image];
    }
    
    if (title != nil) {
        [_titleLabel setText:title];
    }
}



@end
