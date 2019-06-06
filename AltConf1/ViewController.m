//
//  ViewController.m
//  AltConf1
//
//  Created by Liviu Romascanu on 24/05/2019.
//  Copyright © 2019 Applicaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)unrecognizedSelectorClicked:(id)sender {
    NSObject *object =[NSString stringWithFormat:@"[Foo, Bar"];
    
    for (NSString *string in ((NSArray *)object))
    {
        NSLog(@"Array object: %@\n", string);
    }
}

- (IBAction)badMemAccessClicked:(id)sender {
    NSObject *primaryObject = [[NSObject alloc] init];
    NSObject __unsafe_unretained *secondaryObject = primaryObject;
    primaryObject = nil;
    NSLog(@"%@", secondaryObject);
}

- (IBAction)consumeMemoryClicked:(id)sender {
    NSMutableArray *imagesArray = [NSMutableArray new];
    for (NSInteger i = 0; i >= 0; i++) {
        [imagesArray addObject:[UIImage imageNamed:@"msm"]];
    }
}

- (IBAction)blockMainThreadClicked:(id)sender {
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t bQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t cQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t dQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSInteger i = 0; i >= 0; i++) {
        dispatch_async(aQueue, ^{
            UIImage *bigImage = [UIImage imageNamed:@"msm"];
            NSLog(@"image - %@", bigImage);
            bigImage = nil;
        });
        dispatch_async(bQueue, ^{
            UIImage *bigImage = [UIImage imageNamed:@"msm"];
            NSLog(@"image - %@", bigImage);
            bigImage = nil;
        });
        dispatch_async(cQueue, ^{
            UIImage *bigImage = [UIImage imageNamed:@"msm"];
            NSLog(@"image - %@", bigImage);
            bigImage = nil;
        });
        dispatch_async(dQueue, ^{
            UIImage *bigImage = [UIImage imageNamed:@"msm"];
            NSLog(@"image - %@", bigImage);
            bigImage = nil;
        });
        UIImage *bigImage = [UIImage imageNamed:@"msm"];
        NSLog(@"image - %@", bigImage);
        bigImage = nil;
    }
}

@end
