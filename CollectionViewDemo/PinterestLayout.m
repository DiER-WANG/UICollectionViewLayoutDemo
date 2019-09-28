//
//  PinterestLayout.m
//  CollectionViewDemo
//
//  Created by 王昌阳 on 2019/9/28.
//  Copyright © 2019年 wangchangyang. All rights reserved.
//

#import "PinterestLayout.h"

@interface PinterestLayout ()

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *cache;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat width;

@end

@implementation PinterestLayout

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.width, _contentHeight);
}

- (void)prepareLayout {
    [super prepareLayout];
    
    if (self.cache.count == 0) {
        CGFloat columnWidth  = self.width / (float)(_numberOfColumns > 0 ?_numberOfColumns:1);
        
        NSMutableArray *xOffsets = [NSMutableArray array];
        for (NSUInteger column = 0; column < _numberOfColumns; column++) {
            [xOffsets addObject:@(column * columnWidth)];
        }
        
        NSMutableArray *yOffsets = [NSMutableArray array];
        for (NSUInteger column = 0; column < _numberOfColumns; column++) {
            [yOffsets addObject:@(0)];
        }
        
        NSUInteger column = 0;
        NSUInteger items = [self.collectionView numberOfItemsInSection:0];
        for (NSUInteger item = 0; item < items; item++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            
            CGFloat height = [self.delegate collectionView:self.collectionView heightForItemAtIndexPath:indexPath];
            
            CGRect frame = CGRectMake([xOffsets[column] doubleValue], [yOffsets[column] doubleValue], columnWidth, height);
            
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.frame = frame;
            [self.cache addObject:attributes];
            
            _contentHeight = MAX(_contentHeight, CGRectGetMaxY(frame));
            
            yOffsets[column] = @([yOffsets[column] doubleValue] + height);
            
            column = (column >= (_numberOfColumns - 1) ? 0 : ++column);
        }
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attributes in self.cache) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [layoutAttributes addObject:attributes];
        }
    }
    return layoutAttributes;
}

#pragma mark Getter
- (CGFloat)width {    
    return CGRectGetWidth(self.collectionView.bounds);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)cache {
    if (!_cache) {
        _cache = [NSMutableArray array];
    }
    return _cache;
}


@end
