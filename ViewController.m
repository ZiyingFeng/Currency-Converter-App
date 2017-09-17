//
//  ViewController.m
//  CurrencyConversion
//
//  Created by Ziying Feng on 2/1/17.
//  Copyright © 2017 Ziying Feng. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *input;


@property (weak, nonatomic) IBOutlet UIButton *convert;

@property (weak, nonatomic) IBOutlet UILabel *currencyEURoutput;

@property (weak, nonatomic) IBOutlet UILabel *currencyGBPoutput;

@property (weak, nonatomic) IBOutlet UILabel *currencyJPYoutput;


@end

@implementation ViewController

- (IBAction)button:(id)sender {
    self.convert.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
    [self.input resignFirstResponder];
}




- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    
    self.convert.enabled = YES;
    
    double inputValue = [self.input.text floatValue];
    
    double eurValue = inputValue * currencies.EUR;
    NSString *eurOutput = [NSString stringWithFormat:@"%.2f", eurValue];
    self.currencyEURoutput.text = eurOutput;
    
    double gbpValue = inputValue * currencies.GBP;
    NSString *gbpOutput = [NSString stringWithFormat:@"%.2f", gbpValue];
    self.currencyGBPoutput.text = gbpOutput;
    
    double jpyValue = inputValue * currencies.JPY;
    NSString *jpyOutput = [NSString stringWithFormat:@"%.2f", jpyValue];
    self.currencyJPYoutput.text = jpyOutput;
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.input.keyboardType = UIKeyboardTypeNumberPad;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
