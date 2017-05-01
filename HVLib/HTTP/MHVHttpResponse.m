//
// MHVHttpResponse.h
// HVLib
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

#import "MHVHttpResponse.h"

@implementation MHVHttpResponse

- (instancetype)initWithResponseData:(NSData *_Nullable)responseData
                          statusCode:(NSInteger)statusCode
{
    self = [super init];
    if (self)
    {
        _responseData = responseData;
        _statusCode = statusCode;
        _hasError = (statusCode >= 400);
        
        if (_hasError)
        {
            _errorText = [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
        }
    }
    return self;
}

- (NSString *)responseString
{
    return [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
}

@end
