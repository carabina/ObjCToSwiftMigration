//
//  MainViewController.m
//  ObjCToSwiftMigration
//
//  Created by Lawrence F MacFadyen on 2016-06-04.
//  Copyright © 2016 LawrenceM. All rights reserved.
//

#import "MainViewController.h"
#import "ObjCViewController.h"
#import "ObjCToSwiftMigration-Swift.h"

@interface MainViewController () <PhraseUpdatedDelegate>

@property (weak, nonatomic) IBOutlet UILabel *phraseLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self setTitle:@"Phrase Of The Day"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)objCPressed:(id)sender {
    ObjCViewController *objCViewController = [[ObjCViewController alloc] init];
    objCViewController.delegate = self;
    objCViewController.previousPhrase = _phraseLabel.text;
    [self.navigationController pushViewController:objCViewController animated:YES];
    
}
- (IBAction)swiftPressed:(id)sender {
    SwiftViewController *swiftController = [[SwiftViewController alloc]init];
    swiftController.delegate = self;
    swiftController.previousPhrase = _phraseLabel.text;
    [self.navigationController pushViewController:swiftController animated:YES];
}

- (void)phraseUpdated:(NSString *)phrase
{
    _phraseLabel.text = phrase;
}

@end
