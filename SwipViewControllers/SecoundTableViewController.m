//
//  SecondViewController.m
//  SwipeViewControllers
//
//  Created by Mizogaki Masahito on 11/11/14.
//  Copyright (c) 2014 Mizogaki Masahito. All rights reserved.

#import "SecoundTableViewController.h"
#import "SecoundViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface SecoundTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *secoundTableView;
@property (weak, nonatomic) IBOutlet UIButton *topButton;

@end

@implementation SecoundTableViewController

- (void)viewDidLoad {
    
    self.secoundTableView.delegate = self;
    self.secoundTableView.dataSource = self;
    
    self.topButton.layer.cornerRadius = 22.5;
    self.topButton.clipsToBounds = true;
}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @" ";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [self.secoundTableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SecoundViewController class])] animated:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (IBAction)topCellButton:(id)sender {
    
    [self.secoundTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                 atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


@end
