//
//  PPTPoint.h
//  collectionViewLayout
//
//  Created by Donald on 16/9/5.
//  Copyright © 2016年 Susu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPTPoint : NSObject

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;

- (instancetype)initWithPointX:(CGFloat)x pointY:(CGFloat)y;
@end
