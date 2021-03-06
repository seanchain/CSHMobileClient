
//
//  Func.m
//  NewsReader
//
//  Created by Sean Chain on 2/17/15.
//  Copyright (c) 2015 Sean Chain. All rights reserved.
//

#import "Func.h"
#import <UIKit/UIKit.h>


@implementation Func


+ (id)webRequestWith:(NSString *)url and:(NSString*)postInfo
{
    NSString *myRequestString = [NSString stringWithString:postInfo];
    
    // Create Data from request
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:url]];
    [request setHTTPMethod: @"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody: myRequestData];
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    // Log Response
    NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    return response;
}

+ (void)showAlert:(NSString *)str
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

+(void)postRequestWithText:(NSString *)text withID:(NSString *)postid
{
    NSString *url = @"http://www.chensihang.com/blog/wp-comments-post.php";
    NSString *postInfo = [NSString stringWithFormat:@"author=111&email=seanchain@outlook.com&url=chensihang.com&comment=%@&comment_post_ID=%@&comment_parent=0",text, postid];
    NSString *myRequestString = [NSString stringWithString:postInfo];
    
    // Create Data from request
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:url]];
    [request setHTTPMethod: @"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody: myRequestData];
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    // Log Response
    NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@", response);
}

@end
