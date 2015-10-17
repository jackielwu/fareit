//
//  Client.swift
//  FareIt
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 FareIt. All rights reserved.
//
import UIKit

enum SortMod: Int {
    case BestMatched = 0, Distance, HighestRated
}

class Client: BDBOAuth1RequestOperationManager {
    var accessToken: String!
    var accessSecret: String!
    
    init(consumerKey key: String!, consumerSecret secret: String!, accessToken: String!, accessSecret: String!) {
        self.accessToken = accessToken
        self.accessSecret = accessSecret
        var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret);
        
        var token = BDBOAuthToken(token: accessToken, secret: accessSecret, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
    
    func search(term: String, success: (AFHTTPRequestOperation!, AnyObject!) -> Void, failure: (AFHTTPRequestOperation!, NSError!) -> Void) -> AFHTTPRequestOperation! {
        var parameters = [
            "limit": 20
            "
        ]
        return self.GET("search", parameters: parameters, success: success, failure: failure)
    }
    
}