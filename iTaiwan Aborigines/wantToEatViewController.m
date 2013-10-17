//
//  wantToEatViewController.m
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/16.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import "wantToEatViewController.h"

@interface wantToEatViewController ()
@property (weak, nonatomic) IBOutlet UIButton *eatButtonOutlet1;
@property (weak, nonatomic) IBOutlet UIButton *eatButtonOutlet2;

@end

@implementation wantToEatViewController

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
    [self setTitle:@"想 吃"];
    
    [_eatButtonOutlet1 setTitle:@"餐廳" forState:UIControlStateNormal];
    [_eatButtonOutlet2 setTitle:@"原住民2010嚴選十大美食" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
