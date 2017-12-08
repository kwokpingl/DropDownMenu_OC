//
//  DDMButton.m
//  DropDownMenu_OC
//
//  Created by Jimmy on 2017/9/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "DDMButton.h"

@interface DDMButton() {
    UILabel *           btnLabel;
    UIImageView *       btnImageView;
    UITableView *       tv;
    UIView *            mainView;
    UIView *            backgroundView;
    
    NSMutableArray *    items;
    BOOL                shouldShowDDM;
    int                 selectedIndex;
    CGFloat             navigationHeight;
}

@end

@implementation DDMButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init:(UINavigationController *)navigationController containerView:(UIView *)containerView titles:(NSArray<NSString *> *)titles selectedIndex:(int)index {
    
    CGRect mainBtnFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.3, [UIApplication sharedApplication].statusBarFrame.size.height);
    
    self = [[DDMButton alloc] initWithFrame:mainBtnFrame];
    
    
    if (self) {
        [self addTarget:self action:@selector(triggerDDM) forControlEvents:UIControlEventTouchUpInside];
        
        navigationHeight = 0;
        
        if (navigationController != nil) {
            navigationHeight = navigationController.navigationBar.frame.size.height;
        }
        
        ////////////////////
        //   BASIC SETUP
        ////////////////////
        
        selectedIndex = index;
        [self setupVariables];
        
        
        ////////////////////
        //  CHECK PARAMETERS
        ////////////////////
        
        if (_ddmConfig.ddmBtnTitleColor == nil) {
            _ddmConfig = [DDMConfigurationUtil default];
        }
        
        items = [NSMutableArray new];
        
        if (titles.count > 0) {
            items = [[NSMutableArray alloc] initWithArray:titles];
        }
        
        if (containerView == nil) {
            containerView = [UIApplication sharedApplication].keyWindow;
        }
        
        ////////////////////
        //  SETUP VIEWs
        ////////////////////
        
        mainView = [[UIView alloc] initWithFrame:containerView.bounds];
        mainView.backgroundColor = [UIColor clearColor];
        [self setupView];
        
        [containerView addSubview:mainView];
        
        ////////////////////
        //  SETUP SELF VIEW
        ////////////////////
        
        btnLabel = [UILabel new];
        btnLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        if (index<titles.count) {
            btnLabel.text = titles[index];
        }
        
        btnImageView = [UIImageView new];
        btnImageView.translatesAutoresizingMaskIntoConstraints = false;
        
        [self addSubview:btnLabel];
        [self addSubview:btnImageView];
        
        NSLayoutConstraint * btnLabelTop = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:btnLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        NSLayoutConstraint * btnLabelBottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:btnLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        NSLayoutConstraint * btnLabelLeading = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:btnLabel attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
        NSLayoutConstraint * btnLabelImageViewPadding = [NSLayoutConstraint constraintWithItem:btnLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:btnImageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
        NSLayoutConstraint * imageViewTrailing = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btnImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:8];
        NSLayoutConstraint * imageViewTop = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:btnImageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:8];
        NSLayoutConstraint * imageViewBottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:btnImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:8];
        NSLayoutConstraint * imageViewWidth = [NSLayoutConstraint constraintWithItem:btnImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:btnImageView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
        
        [self addConstraints:@[btnLabelTop, btnLabelBottom, btnLabelLeading, btnLabelImageViewPadding, imageViewTrailing, imageViewTop, imageViewBottom, imageViewWidth]];
        
        ///////////////////////////////////////
        //  SETUP UI through DDMConfiguration
        ///////////////////////////////////////
        
        [self setupConfig:_ddmConfig];
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void) setupVariables {
    items = [NSMutableArray new];
}

- (void) setupView {
    
    //////////////////////////////////////
    //  SETUP TABLEVIEW + BACKGROUNDVIEW
    //////////////////////////////////////
    
    CGFloat x = self.frame.origin.x;
    
    CGRect tableViewFrame = CGRectMake(x, 8, mainView.frame.size.width, mainView.frame.size.height - 8);
    
    tv = [[UITableView alloc] initWithFrame:tableViewFrame];
    
    CGFloat newY = [UIApplication sharedApplication].statusBarFrame.size.height;
    newY = newY + navigationHeight;

    [tv setOriginY: newY];
    
    tv.delegate = self;
    tv.dataSource = self;
    
    [tv setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [tv registerClass:[DDMTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    backgroundView = [[UIView alloc] initWithFrame:mainView.frame];
    
    [mainView addSubview:backgroundView];
    [mainView addSubview:tv];
    
    shouldShowDDM = false;
    [mainView setHidden:true];
}

- (void) setupConfig: (DDMConfiguration) config {
    
    _ddmConfig = config;
    
    [tv setRowHeight:_ddmConfig.cellHeight];
    [tv setSeparatorColor:[UIColor colorWithCGColor:_ddmConfig.cellSeparatorColor]];
    
    [tv setBackgroundColor:[UIColor colorWithCGColor:_ddmConfig.backgroundColor]];
    
    [tv reloadData];
}

- (void) triggerDDM {
    shouldShowDDM = !shouldShowDDM;
    
    if (shouldShowDDM) {
        [self openDDM];
    } else {
        [self closeDDM];
    }
}

- (void) openDDM {
    [mainView setHidden:false];
    [UIView animateWithDuration:_ddmConfig.durationDrop animations:^{
        
//        CGFloat newY = [UIApplication sharedApplication].statusBarFrame.size.height;
//        newY = newY + navigationHeight;
//        
//        [tv setOriginY: newY];
        [tv setHeight:items.count * _ddmConfig.cellHeight];
        [tv reloadData];
    }];
}

- (void) closeDDM {
    [UIView animateWithDuration:_ddmConfig.durationRise animations:^{
//        [tv setOriginY: 0];
        [tv setHeight:items.count * _ddmConfig.cellHeight];
        [tv reloadData];
    }];
    
    [UIView animateWithDuration:_ddmConfig.durationRise animations:^{
//        CGFloat newY = items.count * _ddmConfig.cellHeight;
//        
//        newY = newY + [UIApplication sharedApplication].statusBarFrame.size.height;
//        
//        newY = newY + navigationHeight;
//        
//        [tv setOriginY: -newY];
        
        [tv setHeight:0];
        [tv reloadData];
        
    } completion:^(BOOL finished) {
        if (!shouldShowDDM && finished) {
            [mainView setHidden:true];
        }
    }];
}

///////////////////////////////////////////////////////////////////
//                      TABLE VIEW DELEGATE
///////////////////////////////////////////////////////////////////

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedIndex = (int)indexPath.row;
    [_delegate didSelectAtIndex: selectedIndex];
    DDMTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cell.titleLabel setTextColor:[UIColor colorWithCGColor:_ddmConfig.cellSelectedTextColor]];
    [btnLabel setText:items[selectedIndex]];
    [self triggerDDM];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    DDMTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithCGColor:_ddmConfig.cellBackgroundColor]];
    [cell.titleLabel setTextColor:[UIColor colorWithCGColor:_ddmConfig.cellTextColor]];
}

///////////////////////////////////////////////////////////////////
//                      TABLE VIEW DATASOURCE
///////////////////////////////////////////////////////////////////

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDMTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSIndexPath * selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
    
    [tv selectRowAtIndexPath: selectedIndexPath animated:true scrollPosition:UITableViewScrollPositionNone];
    
    NSString * title = items[indexPath.row];
    UIImage * img = _ddmConfig.cellCheckMarkImage;
    
    [cell setTitle:title andImage:img];
    
    cell.selectedTextColor = _ddmConfig.cellSelectedTextColor;
    cell.textColor = _ddmConfig.cellTextColor;
    
    UIView * selectedView = [UIView new];
    [selectedView setBackgroundColor:[UIColor colorWithCGColor:_ddmConfig.cellSelectedColor]];
    
    [cell setSelectedBackgroundView:selectedView];
    
    [cell.titleLabel setTextColor:[UIColor colorWithCGColor:_ddmConfig.cellTextColor]];
    [cell.titleLabel setFont:_ddmConfig.cellTextFont];
    [cell.titleLabel setTextAlignment:_ddmConfig.cellTextAlignment];
    
    [cell setBackgroundColor:[UIColor colorWithCGColor:_ddmConfig.cellBackgroundColor]];
    
    return cell;
}

@end
