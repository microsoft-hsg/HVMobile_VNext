//
// MHVHttpServiceProtocol.h
// MHVLib
//
//  Copyright (c) 2017 Microsoft Corporation. All rights reserved.
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
@protocol MHVBlobSourceProtocol, MHVTaskProgressProtocol;
@class MHVHttpServiceResponse;

typedef void (^MHVHttpServiceCompletion)(MHVHttpServiceResponse *_Nullable response, NSError *_Nullable error);
typedef void (^MHVHttpServiceFileDownloadCompletion)(NSError *_Nullable error);
typedef void (^MHVHttpServiceDataDownloadCompletion)(NSData *_Nullable data, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@protocol MHVHttpServiceProtocol <NSObject>

/**
 Send a request to HealthVault service
 
 @param url the endpoint for the request
 @param body data to send as POST body
 @param completion response containing result of the operation, or error
 @return TaskProgress object that can be cancelled or used for observing progress. Can be nil if arguments are invalid
 */
- (id<MHVTaskProgressProtocol> _Nullable)sendRequestForURL:(NSURL *)url
                                                      body:(NSString *_Nullable)body
                                                completion:(MHVHttpServiceCompletion)completion;

/**
 Send a request to HealthVault service
 
 @param url the endpoint for the request
 @param body data to send as POST body
 @param headers HTTP headers to add to the request for authentication, etc.
 Dictionary key is HTTP header ie "Content-Type"
 @param completion response containing result of the operation, or error
 @return TaskProgress object that can be cancelled or used for observing progress. Can be nil if arguments are invalid
 */
- (id<MHVTaskProgressProtocol> _Nullable)sendRequestForURL:(NSURL *)url
                                                      body:(NSString *_Nullable)body
                                                   headers:(NSDictionary<NSString *, NSString *> *_Nullable)headers
                                                completion:(MHVHttpServiceCompletion)completion;

/**
 Download a blob from HealthVault service to a local file path
 
 @param url the endpoint for the request
 @param path local file path where the downloaded file will be stored
 For security, the file's protection attributes will be set to NSFileProtectionComplete
 @param completion error if the download failed
 @return TaskProgress object that can be cancelled or used for observing progress. Can be nil if arguments are invalid
 */
- (id<MHVTaskProgressProtocol> _Nullable)downloadFileWithUrl:(NSURL *)url
                                                  toFilePath:(NSString *)path
                                                  completion:(MHVHttpServiceFileDownloadCompletion)completion;

/**
 Download a blob from HealthVault service and return data
 
 @param url the endpoint for the request
 @param completion data if the download succeeded, or error
 @return TaskProgress object that can be cancelled or used for observing progress. Can be nil if arguments are invalid
 */
- (id<MHVTaskProgressProtocol> _Nullable)downloadDataWithUrl:(NSURL *)url
                                                  completion:(MHVHttpServiceDataDownloadCompletion)completion;

/**
 Upload to HealthVault blob storage
 
 @param blobSource data source for blob (NSData, file, etc)
 @param toUrl the endpoint for the request
 @param chunkSize size is given by HealthVault service when requesting to upload a blob
 @param completion response containing result of the operation, or error
 @return TaskProgress object that can be cancelled or used for observing progress. Can be nil if arguments are invalid
 */
- (id<MHVTaskProgressProtocol> _Nullable)uploadBlobSource:(id<MHVBlobSourceProtocol>)blobSource
                                                    toUrl:(NSURL *)url
                                                chunkSize:(NSUInteger)chunkSize
                                               completion:(MHVHttpServiceCompletion)completion;

@end

NS_ASSUME_NONNULL_END
