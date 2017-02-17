//
//  batch.m
//  RNBatch
//
//  Created by ThomasOlivier on 17/02/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "BatchManager.h"
@import Batch;

#import <React/RCTLog.h>

@implementation BatchManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initReactApplication:(RCTResponseSenderBlock)callback)
{
  // Start Batch SDK.
  [Batch startWithAPIKey:@"YOUR-KEY"];
  [BatchPush registerForRemoteNotifications];
  
  callback(@[[NSNull null], @"SUCCESS"]);
}

RCT_EXPORT_METHOD(logUser:(NSString*)userId callback:(RCTResponseSenderBlock) callback)
{
  RCTLogInfo(@"Logging-in the user with userId %@", userId);
  
  BatchUserDataEditor *editor = [BatchUser editor];
  [editor setIdentifier:userId];
  [editor save];
  
  callback(@[[NSNull null], @"SUCCESS logging-in user %@", userId]);
}

RCT_EXPORT_METHOD(buttonPushed:(RCTResponseSenderBlock) callback)
{
  [BatchUser trackEvent:@"btn_pushed"];
  
  callback(@[[NSNull null], @"SUCCESS"]);
}

@end
