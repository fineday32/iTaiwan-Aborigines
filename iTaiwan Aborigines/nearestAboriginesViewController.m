//
//  nearestAboriginesViewController.m
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/16.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import "nearestAboriginesViewController.h"

@interface nearestAboriginesViewController ()

@end

@implementation nearestAboriginesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *temp = @"XX";
    [self setTitle:[NSString stringWithFormat:@"現在最接近  %@族", temp]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
