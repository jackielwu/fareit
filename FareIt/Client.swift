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
    
    
    class var sharedInstance : Client {
        struct Static {
            static var token : dispatch_once_t = 0
            static var instance : Client? = nil
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
                
                Static.instance = Client(consumerKey: yelpConsumerKey!, consumerSecret: yelpConsumerSecret!, accessToken: yelpToken!, accessSecret: yelpTokenSecret!)
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
        
        let token = BDBOAuthToken(token: accessToken, secret: accessSecret, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
    
    func searchWithTerm(term: String, success: (AFHTTPRequestOperation!, AnyObject!) -> Void, failure: (AFHTTPRequestOperation!, NSError!) -> Void) -> AFHTTPRequestOperation! {
        var parameters = []
        return self.GET("search", parameters: parameters, success: success, failure: failure)
    }
    
}
>>>>>>> origin/master
