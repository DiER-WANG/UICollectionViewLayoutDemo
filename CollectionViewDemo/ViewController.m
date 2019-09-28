//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by 王昌阳 on 2019/9/28.
//  Copyright © 2019年 wangchangyang. All rights reserved.
//

#import "ViewController.h"
#import "PinterestLayout.h"

@interface ViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, PinterestLayoutDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(CGRectGetWidth(self.view.frame) * 0.5, CGRectGetWidth(self.view.frame) * 0.5);
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.minimumInteritemSpacing = 0.f;
//    layout.minimumLineSpacing = 0.f;
    
    PinterestLayout *layout = [[PinterestLayout alloc] init];
    layout.numberOfColumns = 2;
    layout.delegate = self;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class)];
    collectionView.scrollEnabled = YES;
    [self.view addSubview:collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.f green:arc4random_uniform(255)/255.f blue:arc4random_uniform(255)/255.f alpha:1];
    return cell;
    
}

// PinterestLayoutDelegate
- (CGFloat)collectionView:(UICollectionView *)collectionView heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100 * (arc4random_uniform(4) + 1);
}

@end
