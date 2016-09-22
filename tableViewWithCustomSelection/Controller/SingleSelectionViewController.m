//
//  SingleSelectionViewController.m
//  tableViewWithCustomSelection
//
//  Created by deepakraj murugesan on 22/09/16.
//  Copyright © 2016 deepakraj murugesan. All rights reserved.
//

#import "SingleSelectionViewController.h"
#import "SingleSelectionTable.h"

@interface SingleSelectionViewController(){
    NSIndexPath *previousIndexPath, *currentIndexPath;

}
@property (weak, nonatomic) IBOutlet UITableView * singleSelectionTableView;
@property (nonatomic, strong)NSArray * singleSelectionArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightConstraint;

@end

@implementation SingleSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.singleSelectionArray = @[@{@"heading":@"Sunday"},@{@"heading":@"Monday"},@{@"heading":@"Tuesday"},@{@"heading":@"Wednesday"},@{@"heading":@"Thursday"},@{@"heading":@"Friday"},@{@"heading":@"Saturday"}];
  
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    previousIndexPath = nil;
    currentIndexPath = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.singleSelectionArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SingleSelectionTable * SingleSelectionCell = [tableView dequeueReusableCellWithIdentifier:@"single" forIndexPath:indexPath];
    SingleSelectionCell.singleSelectionCellData =self.singleSelectionArray[indexPath.row];
      self.tableViewHeightConstraint.constant =  [self.singleSelectionArray count] * 44;
    return SingleSelectionCell;
}

#pragma mark - onSelectionCondition
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentIndexPath = indexPath;
    
    SingleSelectionTable * singleSelectionCell = nil;
    if (![previousIndexPath isEqual: currentIndexPath]) {
        if (previousIndexPath) {
            singleSelectionCell = (SingleSelectionTable *) [tableView cellForRowAtIndexPath:previousIndexPath];
            singleSelectionCell.selected_img.hidden = YES;
            singleSelectionCell.unselected_img.hidden = NO;
        }
        previousIndexPath = currentIndexPath;
        
        singleSelectionCell = (SingleSelectionTable *) [tableView cellForRowAtIndexPath:currentIndexPath];
        singleSelectionCell.selected_img.hidden = NO;
        singleSelectionCell.unselected_img.hidden = YES;
        
        singleSelectionCell.selected_img.transform = CGAffineTransformMakeScale(0, 0);
        
        [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            singleSelectionCell.selected_img.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
    }
}

@end
