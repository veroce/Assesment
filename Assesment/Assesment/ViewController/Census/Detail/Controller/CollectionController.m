//
//  CollectionController.m
//  Assesment
//
//  Created by Vero on 10/9/16.
//  Copyright © 2016 veronica. All rights reserved.
//

#import "CollectionController.h"
#import "People.h"
#import "FriendCollectionCell.h"


@implementation CollectionController

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _friends.count;
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FriendCollectionCell * cell = (FriendCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FriendCollectionCell" forIndexPath:indexPath];
    [cell loadData:((People *)[_friends objectAtIndex:indexPath.row]).name  andThumbnail:((People *)[_friends objectAtIndex:indexPath.row]).thumbnail];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    People * person = [_friends objectAtIndex:indexPath.row];
    
    if(_delegate && [_delegate respondsToSelector:@selector(comunicationFriendSelected:)]){
        [_delegate comunicationFriendSelected:person];
    }
    
}
@end
