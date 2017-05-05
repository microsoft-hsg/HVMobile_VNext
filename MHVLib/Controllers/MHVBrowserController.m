//
//  MHVBrowserController.m
//  MHVLib
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

#import "MHVCommon.h"
#import "MHVBrowserController.h"
#import <QuartzCore/QuartzCore.h>


#define RGBColor(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define MHVBLUE RGBColor(0, 176, 240)

@interface MHVBrowserController (MHVPrivate)

-(BOOL) createBrowser;
-(void) releaseBrowser;
-(BOOL) addBackButton;
-(void) backButtonClicked:(id) sender;
-(void) showActivitySpinner;
-(void) hideActivitySpinner;

@end

@implementation MHVBrowserController

@synthesize target = m_target;
@synthesize webView = m_webView;

-(void)dealloc
{
    [self releaseBrowser];
    
}

-(BOOL)start
{
    if (m_target)
    {
        return [self navigateTo:m_target];
    }
    
    [self abort];
    
    return FALSE;
}

-(BOOL)stop
{
    if (m_webView)
    {
        [m_webView stopLoading];
    }
    return TRUE;
}

-(BOOL)navigateTo:(NSURL *)url
{
    MHVCHECK_NOTNULL(url);
    
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    MHVCHECK_NOTNULL(request);
    
    [m_webView loadRequest:request];
    
    return TRUE;
    
LError:
    return false;
}

-(void)abort
{
    [self stop];
    [self.navigationController popViewControllerAnimated:TRUE];
}

//-----------------------
//
// WebView Delegate
//
//-----------------------
-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest: (NSURLRequest *)request
 navigationType: (UIWebViewNavigationType)navigationType 
{
    [self showActivitySpinner];
 	return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideActivitySpinner];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideActivitySpinner];
}

//-----------------------
//
// Controller Stuff
//
//-----------------------

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createBrowser];    
    [self addBackButton];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self start];
}

- (void)viewWillDisappear: (BOOL)animated 
{
    [self stop];
	[super viewWillDisappear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self releaseBrowser];
}

-(void)didReceiveMemoryWarning
{
    [self releaseBrowser];
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    switch (interfaceOrientation) 
    {
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            return FALSE;
            
        default:
            break;
    }
    
    return TRUE;
}

@end

@implementation MHVBrowserController (MHVPrivate)

-(BOOL)createBrowser
{
    [self releaseBrowser];
    
    UIView* superView = super.view;
    CGRect frame = superView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    
    m_webView = [[UIWebView alloc] initWithFrame:frame];
    MHVCHECK_NOTNULL(m_webView);
    
    m_webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    m_webView.delegate = self;
    
    [superView addSubview:m_webView];  
    
    return TRUE;
    
LError:
    return FALSE;
}

-(void)releaseBrowser
{
    if (m_webView)
    {
        [self stop];
        if (m_activityView)
        {
            [m_activityView removeFromSuperview];
        }
        m_webView.delegate = nil;
        [m_webView removeFromSuperview];
    }
    m_webView = nil;

    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

-(BOOL)addBackButton
{
    self.navigationItem.hidesBackButton = TRUE;

    NSString* buttonTitle = NSLocalizedString(@"Back", @"Back button text");
    
    UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithTitle:buttonTitle style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    MHVCHECK_NOTNULL(button);
    
    self.navigationItem.leftBarButtonItem = button;
    
    return TRUE;
    
LError:
    return FALSE;
}

-(void)showActivitySpinner
{    
    //
    // Find any existing indicators already in place
    //
    if (!m_activityView)
    {
        m_activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        if ([m_activityView respondsToSelector:@selector(setColor:)])
        {
            [m_activityView setColor:MHVBLUE];
        }
        else 
        {
            m_activityView = nil;
            // < iOS5... use older style. The large indication won't be visible on MHV pages
            m_activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        }
        m_activityView.center = m_webView.center;
        m_activityView.hidesWhenStopped = TRUE;
        
        [m_webView addSubview:m_activityView];
    }
    
    [m_activityView startAnimating];
}

-(void)backButtonClicked:(id)sender
{
    if (m_webView.canGoBack)
    {
        [m_webView goBack];
    }
    else 
    {
        [self.navigationController popViewControllerAnimated:TRUE];
    }
}

-(void)hideActivitySpinner
{
    if (m_activityView)
    {
        [m_activityView stopAnimating];
    }
}

@end