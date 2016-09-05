//
//  PPTImageCollectionViewCell.m
//  collectionViewLayout
//
//  Created by Donald on 16/9/5.
//  Copyright © 2016年 Susu. All rights reserved.
//

#import "PPTImageCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface PPTImageCollectionViewCell ()
@property (nonatomic,strong) UIImageView * image;


@end

@implementation PPTImageCollectionViewCell
- (void)layoutData:(NSString *)iconUrl
{
    [self.image sd_setImageWithURL:[NSURL URLWithString:iconUrl]];
    
}

- (UIImageView *)image
{
    if(_image == nil)
    {
        _image = [[UIImageView alloc]initWithFrame:self.contentView.frame];
        [self.contentView addSubview:_image];
        self.contentView.backgroundColor = [UIColor whiteColor];
        _image.backgroundColor = [UIColor whiteColor];
    }
    return _image;
}
@end
