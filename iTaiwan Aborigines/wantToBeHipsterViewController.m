//
//  wantToBeHipsterViewController.m
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/16.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import "wantToBeHipsterViewController.h"

@interface wantToBeHipsterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *hipsterButtonOutlet1;
@property (weak, nonatomic) IBOutlet UIButton *hipsterButtonOutlet2;
@property (weak, nonatomic) IBOutlet UIButton *hipsterButtonOutlet3;

@end

@implementation wantToBeHipsterViewController

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
    [self setTitle:@"想 當 小 文 青"];
    
    [_hipsterButtonOutlet1 setTitle:@"文化館" forState:UIControlStateNormal];
    [_hipsterButtonOutlet2 setTitle:@"博物館" forState:UIControlStateNormal];
    [_hipsterButtonOutlet3 setTitle:@"特色工坊 / 工作室" forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
