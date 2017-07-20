//
//  MHVThingCache.h
//  MHVLib
//
// Copyright (c) 2017 Microsoft Corporation. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>
#import "MHVThingCacheProtocol.h"

@protocol MHVThingCacheDatabaseProtocol, MHVConnectionProtocol, MHVNetworkObserverProtocol;

@interface MHVThingCache : NSObject <MHVThingCacheProtocol>

/**
 Create the Thing Cache
 
 @param database The Database for the cache
 @param connection The connection object for the current authenticated person
 @param automaticStartStop Whether the cache should automatically sync and reset based on connection.personInfo 
 @return The cache object
 */
- (instancetype)initWithCacheDatabase:(id<MHVThingCacheDatabaseProtocol>)database
                           connection:(id<MHVConnectionProtocol>)connection
                      networkObserver:(id<MHVNetworkObserverProtocol>)networkObserver
                   automaticStartStop:(BOOL)automaticStartStop;

@end
