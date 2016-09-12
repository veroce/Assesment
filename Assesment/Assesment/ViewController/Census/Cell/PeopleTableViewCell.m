//
//  PeopleTableViewCell.m
//  Assesment
//
//  Created by Vero on 30/8/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "PeopleTableViewCell.h"
#import "TextStyles.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Appearance.h"

@interface PeopleTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIView *viewRounded;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewPeople;
@end

@implementation PeopleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self loadStyle];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadData:(People *)people{
    _labelTitle.text = people.name;
    [_imageViewPeople sd_setImageWithURL:[NSURL URLWithString:people.thumbnail]
                      placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    
    
}
-(void)loadStyle{
    [TextStyles primaryTextBold:_labelTitle];
    [Appearance setBorderSemiCircleView:_imageViewPeople];
    [_imageViewPeople setContentMode:UIViewContentModeScaleAspectFill];
    
    
}

@end
