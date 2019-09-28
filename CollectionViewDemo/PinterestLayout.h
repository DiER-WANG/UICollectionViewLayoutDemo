//
//  PinterestLayout.h
//  CollectionViewDemo
//
//  Created by 王昌阳 on 2019/9/28.
//  Copyright © 2019年 wangchangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PinterestLayoutDelegate <NSObject>

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface PinterestLayout : UICollectionViewLayout

@property (nonatomic, weak) id<PinterestLayoutDelegate> delegate;
// 不能为 0
@property (nonatomic, assign) NSUInteger numberOfColumns;

@end

NS_ASSUME_NONNULL_END
