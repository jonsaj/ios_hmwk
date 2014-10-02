//
//  ViewController.m
//  tablebasics
//
//  Created by ljsaj on 10/2/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (copy, nonatomic) NSArray *people;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.people = @[@"someone", @"anothersomeone", @"moresomeone", @"iditoth", @"guy ritchie", @"guy waldo", @"mitch", @"person", @"jon", @"emily", @"tim", @"eric", @"guy2", @"guy3", @"where's guy1?", @"name", @"anothername" ];
    UITableView *peepsTableView = (id)[self.view viewWithTag:1];
    UIEdgeInsets contentSkipInset = peepsTableView.contentInset;
    contentSkipInset.top = 20;
    [peepsTableView setContentInset:contentSkipInset];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *SweetTableIdentifier = @"SweetTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SweetTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SweetTableIdentifier];
    }
    
    UIImage *cellImage = [UIImage imageNamed:@"Cardboard-Box"];
    UIImage *cellHighImage = [UIImage imageNamed:@"Cardboard-Box_full"];
    cell.imageView.image = cellImage;
    cell.imageView.highlightedImage = cellHighImage;
    
    cell.textLabel.text = self.people[indexPath.row];
    if(indexPath.row < 7){
        cell.detailTextLabel.text = @"Idiot.";
    }
    else if(indexPath.row <10){
        cell.detailTextLabel.text = @"Cool Guy";
    }
    else{
        cell.detailTextLabel.text = @"Meh.";
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row/4;
}

@end
