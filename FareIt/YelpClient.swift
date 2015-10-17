//
//  YelpClient.swift
//  FareIt
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 FareIt. All rights reserved.
//
import UIKit
//import BDBOAuth1RequestOperationManager

enum SortMod: Int {
    case BestMatched = 0, Distance, HighestRated
}

class YelpClient: BDBOAuth1RequestOperationManager {
    var accessToken: String!
    var accessSecret: String!
    
    
    class var sharedInstance : YelpClient {
        struct Static {
            static var token : dispatch_once_t = 0
            static var instance : YelpClient? = nil
        }
        
        dispatch_once(&Static.token) {
            
            var keys: NSDictionary?
            
            if let path = NSBundle.mainBundle().pathForResource("keys", ofType: "plist") {
                keys = NSDictionary(contentsOfFile: path)
            }
            if keys != nil {
                let yelpConsumerSecret = keys?["consumerSecret"] as? String
                let yelpConsumerKey = keys?["consumerKey"] as? String
                let yelpToken = keys?["token"] as? String
                let yelpTokenSecret = keys?["tokenSecret"] as? String
                
                Static.instance = YelpClient(consumerKey: yelpConsumerKey!, consumerSecret: yelpConsumerSecret!, accessToken: yelpToken!, accessSecret: yelpTokenSecret!)
            }
            
        }
        return Static.instance!
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(consumerKey key: String!, consumerSecret secret: String!, accessToken: String!, accessSecret: String!) {
        self.accessToken = accessToken
        self.accessSecret = accessSecret
        var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret);
        
        let token = BDBOAuth1Credential(token: accessToken, secret: accessSecret, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
    
    
}