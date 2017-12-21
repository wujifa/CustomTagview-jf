//
//  WJFTableViewController.m
//  WJFTags
//
//  Created by 吴际发 on 2017/12/21.
//  Copyright © 2017年 wjf. All rights reserved.
//

#import "WJFTableViewController.h"
#import "WJFTagsCell.h"
@interface WJFTableViewController ()
@property (nonatomic,strong) WJFTagCollectionViewFlowLayout *layout;//布局layout
@property (nonatomic,strong) NSArray *selectTags;
@end

@implementation WJFTableViewController

- (WJFTagCollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [WJFTagCollectionViewFlowLayout new];
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layout;
}

- (NSArray *)tags {
    return @[@"《上错花轿嫁对郎》",@"《敲敲爱上你》",@"《美人心计》",@"《被时光掩埋的秘密》",@"《最美的时光》",@"《兰陵缭乱》",@"《华胥引》",@"《错点鸳鸯&戏点鸳鸯》",@"《第三种爱情》",@"交错时光的爱恋》",@"《清宫绝恋》",@"《转身说爱你》",@"《大漠谣》",@"《云中歌》",@"大话西游2",@"梦三国",@"流星蝴蝶剑",@"宠物小精灵"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    
    [self.tableView registerClass:WJFTagsCell.class forCellReuseIdentifier:@"cellId"];
}

#pragma mark UITableViewDataSource/UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WJFTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[WJFTagsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    
    cell.tags = self.tags;
    cell.selectedTags = [NSMutableArray arrayWithArray:_selectTags];
    cell.layout = self.layout;
    cell.completion = ^(NSArray *selectTags,NSInteger currentIndex) {
        NSLog(@"selectTags:%@ currentIndex:%ld",selectTags, (long)currentIndex);
        _selectTags = selectTags;
    };
    [cell reloadData];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    float height = [WJFTagsCell getCellHeightWithTags:self.tags layout:self.layout tagAttribute:nil width:tableView.frame.size.width];
    return height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
