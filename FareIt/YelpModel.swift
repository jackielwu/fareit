//
//  YelpModel.swift
//  FareIt
//
//  Created by Apple on 10/18/15.
//  Copyright © 2015 FareIt. All rights reserved.
//

import Foundation

struct YelpBusiness {
    var id: String
    var name: String
    var imageURL: NSURL? = nil          // image_url
    var location: NSDictionary          // location
    var distance: Double                // distance (meters)
    
    init(json: NSDictionary) {
        self.id = json["id"] as! String
        self.name = json["name"] as! String
        if let imageURL = json["image_url"] as? String {
            self.imageURL = NSURL(string: imageURL)
        }
        
        self.location = json["location"] as? NSDictionary ?? [:]
        self.distance = (json["distance"] as? Double) ?? 0
        
    }
    
}

class YelpModel: BDBOAuth1RequestOperationManager {
    let CONSUMER_KEY =      "Al5eoPyUXhWGRyh89Rbepg           "
    let CONSUMER_SECRET =   "EwztJGQFW1vEJRcNorqbBseaTVG8"
    let TOKEN =             "bCGCzT7eiyuTZQOqgTySkVH5OTqGVJMy"
    let TOKEN_SECRET =      "J4peEC8ZbWiD0n-meSMaNKOWBrQ"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    init() {
        let baseURL = NSURL.init(string: "https://api.yelp.com/v2/")
        super.init(baseURL: baseURL, consumerKey: CONSUMER_KEY, consumerSecret: CONSUMER_SECRET)
        let token = BDBOAuth1Credential(token: TOKEN, secret: TOKEN_SECRET, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
    
    
    
    func search(term: NSString, done: (businesses: [YelpBusiness], error: NSError?) -> Void) {
        let latitude = "37.756941"
        let longitude = "-122.42109"
        let parameters = [
            "term": term,
            "ll": "\(latitude),\(longitude)",
            "location": "West Lafayette",
        ]
        self.GET("search",
            parameters: parameters,
            success: {
                (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                var list: [YelpBusiness] = []
                for jsonBusiness in (response["businesses"] as! NSArray) {
                    list.append(YelpBusiness(json: jsonBusiness as! NSDictionary))
                }
                done(businesses: list, error: nil)
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                done(businesses: [], error: error)
            }
        )
    }
}