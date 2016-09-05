//
//  PPTCollectionViewCircleLayout.m
//  collectionViewLayout
//
//  Created by Donald on 16/9/3.
//  Copyright © 2016年 Susu. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#import "PPTCollectionViewCircleLayout.h"

@interface PPTCollectionViewCircleLayout ()
@property (nonatomic,assign) CGSize  collectionViewSize;
@end

@implementation PPTCollectionViewCircleLayout

- (void)prepareLayout
{
}
- (CGSize)collectionViewContentSize
{
    return self.collectionViewSize;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * layoutAttribute = [super layoutAttributesForItemAtIndexPath:indexPath];
    if([self.delegate respondsToSelector:@selector(itemSizeCollectionView:indexPath:)])
    {
        
        CGSize itemSize = [self.delegate itemSizeCollectionView:self.collectionView indexPath:indexPath];
        if([self.delegate respondsToSelector:@selector(itemLocationCollectionView:indexPath:)])
        {
          CGPoint  point = [self.delegate itemLocationCollectionView:self.collectionView indexPath:indexPath];
          layoutAttribute.frame = CGRectMake(point.x, point.y, itemSize.width, itemSize.height);
        }else if ([self.delegate respondsToSelector:@selector(centerItemLocationCollectionView:indexPath:)])
        {
            CGPoint center = [self.delegate centerItemLocationCollectionView:self.collectionView indexPath:indexPath];
            layoutAttribute.frame = CGRectMake(center.x - itemSize.width * 0.5, center.y - itemSize.width * 0.5, itemSize.width, itemSize.height);
            
            
        }
        if(CGRectGetMaxY(layoutAttribute.frame)>self.collectionViewSize.height)
        {
            self.collectionViewSize = CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(layoutAttribute.frame));
        }
    }
    return layoutAttribute;
    
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i=0 ; i < count; i++)
    {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return [attributes copy];
}

@end
