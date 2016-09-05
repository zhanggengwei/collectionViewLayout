//
//  PPTPoingDateView.m
//  collectionViewLayout
//
//  Created by Donald on 16/9/5.
//  Copyright © 2016年 Susu. All rights reserved.
//

#import "PPTPoingDateView.h"
#import "PPTCollectionViewCircleLayout.h"
#import "PPTImageCollectionViewCell.h"
#import "PPTPoint.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
@interface PPTPoingDateView ()<UICollectionViewDelegate,UICollectionViewDataSource,PPTCollectionViewCircleLayoutDelegate>
@property (nonatomic,strong) NSArray<PPTPoint *> * locationArr;
@property (nonatomic,assign) NSInteger teamCount;
@property (nonatomic,assign) CGSize itemSize;
@property (nonatomic,assign) CGFloat screenWidth;

@end
@implementation PPTPoingDateView

@synthesize collectionView = _collectionView,circleLayout = _circleLayout;

- (instancetype)init
{
    self = [super init];
    if(self)
    {
      
        
        [self addSubview:self.collectionView];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor redColor].CGColor;
       
       
        [self.collectionView reloadData];
        
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.itemSize = CGSizeMake(104, 104);
        self.teamCount = 3;
        self.screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.layer.borderWidth = 2;
        [self addSubview:self.collectionView];
        self.circleLayout.delegate = self;
    }
    return self;
}
- (PPTCollectionViewCircleLayout *)circleLayout
{
    if(_circleLayout == nil)
    {
        _circleLayout = [PPTCollectionViewCircleLayout new];
    }
    return _circleLayout;
    
}
- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.circleLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor yellowColor];
       [ _collectionView registerClass:[PPTImageCollectionViewCell class] forCellWithReuseIdentifier:@"PPTImageCollectionViewCell"];
        
    }
    return _collectionView;
}
- (NSArray *)locationArr
{
    if(_locationArr == nil)
    {
        if(self.teamCount == 2)
        {
            
            PPTPoint * point1 = [[PPTPoint alloc]initWithPointX:self.screenWidth* 0.5 - 20 - self.itemSize.width * 0.5 pointY:self.itemSize.width * 0.5];
               PPTPoint * point2 = [[PPTPoint alloc]initWithPointX:self.screenWidth* 0.5 + 20 pointY:self.itemSize.width * 0.5];
            _locationArr = @[point1,point2];
        }else if (self.teamCount == 3)
        {
            PPTPoint * point1 = [[PPTPoint alloc]initWithPointX:self.screenWidth* 0.5 - 20 - self.itemSize.width * 0.5 pointY:self.itemSize.width * 0.5];
            PPTPoint * point2 = [[PPTPoint alloc]initWithPointX:self.frame.origin.x + self.screenWidth * 0.5 + 20 + self.itemSize.width * 0.5 pointY:self.itemSize.width * 0.5];
            
             PPTPoint * point3 = [[PPTPoint alloc]initWithPointX:self.screenWidth* 0.5 pointY:self.itemSize.height + 15 + self.itemSize.height * 0.5];
            
            _locationArr = @[point1,point2,point3];
            
        
        }
    }
    return _locationArr;
    
}

#pragma mark UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PPTImageCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PPTImageCollectionViewCell" forIndexPath:indexPath];
    cell.layer.borderWidth = 2;
    cell.layer.borderColor = [UIColor greenColor].CGColor;
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  self.teamCount;
}
#pragma PPTCollectionViewCircleLayoutDelegate
- (CGSize)itemSizeCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    return self.itemSize;
}

- (CGPoint)centerItemLocationCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)index
{
    return  CGPointMake(self.locationArr[index.row].x,self.locationArr[index.row].y);
    
}



@end
