//
//  FriendCollectionCell.m
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "FriendCollectionCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Appearance.h"

#import "TextStyles.h"

@implementation FriendCollectionCell

-(void)loadData:(NSString *)name andThumbnail:(NSString *)thumbnail{
    
    [TextStyles primaryText:_labelName];
    _labelName.text = name;
    [_imageViewFriend sd_setImageWithURL:[NSURL URLWithString:thumbnail]
                         placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    [_imageViewFriend.layer setCornerRadius:10.0];
    _imageViewFriend.clipsToBounds = YES;
    _imageViewFriend.layer.borderColor = [UIColor clearColor].CGColor;
    _imageViewFriend.layer.borderWidth = 1;
        
}

@end
