//
//  Created by 黄轩 on 16/1/13.
//  Copyright © 2015年 IT小子. All rights reserved.
//

#import "WJFTagCollectionViewCell.h"

@implementation WJFTagCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = self.bounds;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.titleLabel.text = @"";
}

@end
