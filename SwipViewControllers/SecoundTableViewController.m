//
//  SecondViewController.m
//  SwipeViewControllers
//
//  Created by Mizogaki Masahito on 11/11/14.
//  Copyright (c) 2014 Mizogaki Masahito. All rights reserved.

#import "SecoundTableViewController.h"
#import "TransparentToolbar.h"

@interface SecoundTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *secoundTableView;


@end

@implementation SecoundTableViewController

- (void)viewDidLoad {
    

}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
}

#pragma mark - UITableViewDelegate / numberOfSectionsInTableView (セクションの項目数を返す)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


#pragma mark - UITableViewDelegate / titleForHeaderInSection (指定されたセクションのセクション名を返す)
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"";
}


#pragma mark - UITableViewDelegate / numberOfRowsInSection (全体のセクションの数を返す)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


#pragma mark - UITableViewDelegate / cellForRowAtIndexPath (指定したインデックスパスのセルを作成し，そのインスタンスを返す)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [self.secoundTableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}


#pragma mark - UITableViewDelegate / didSelectRowAtIndexPath (セルを選択した時に実行される)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)backTopView:(id)sender {
    
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.secoundTableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
