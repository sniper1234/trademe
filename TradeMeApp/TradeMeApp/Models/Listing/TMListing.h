//
//  TMListing.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMListing : NSObject

/**
 * The ID of the listing.
 */
@property (strong, nonatomic) NSNumber *listingId;

/**
 * The listing title.
 */
@property (strong, nonatomic) NSString *title;

@end
