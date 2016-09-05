//
//  PPTCollectionViewCircleLayout.h
//  collectionViewLayout
//
//  Created by Donald on 16/9/3.
//  Copyright © 2016年 Susu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PPTCollectionViewCircleLayoutDelegate <NSObject>

@optional
- (CGPoint)itemLocationCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
- (CGPoint)centerItemLocationCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)index;

@required
- (CGSize)itemSizeCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;


@end


@interface PPTCollectionViewCircleLayout : UICollectionViewFlowLayout
@property (nonatomic,assign) UIEdgeInsets edge;
@property (nonatomic,weak) id <PPTCollectionViewCircleLayoutDelegate>delegate;

@end
