//
//  PPTPoint.m
//  collectionViewLayout
//
//  Created by Donald on 16/9/5.
//  Copyright © 2016年 Susu. All rights reserved.
//

#import "PPTPoint.h"

@implementation PPTPoint
- (instancetype)initWithPointX:(CGFloat)x pointY:(CGFloat)y
{
    self = [super init];
    if(self)
    {
        self.x = x;
        self.y = y;
        
    }
    return self;
    
}
@end
