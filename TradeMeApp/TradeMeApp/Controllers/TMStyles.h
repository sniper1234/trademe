//
//  TMStyles.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 4/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMStyles : NSObject {
    
    /**
     * Standard listing tile style.
     */
    IBOutletCollection(UILabel) NSArray *listingTitleStyle;
}

@end
