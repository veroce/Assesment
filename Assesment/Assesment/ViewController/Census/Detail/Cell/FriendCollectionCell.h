//
//  FriendCollectionCell.h
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFriend;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

-(void)loadData:(NSString *)name andThumbnail:(NSString *)thumbnail;

@end
