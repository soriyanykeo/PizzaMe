//
//  GetJSONRequestTests.swift
//  PizzaMe
//
//  Created by Soriyany keo on 6/27/16.
//  Copyright © 2016 Soriyany. All rights reserved.
//

import XCTest
@testable import PizzaMe
class GetJSONRequestTests: XCTestCase {
    var getJSonRequest:GetJSONRequest!
    
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    var dataTask: NSURLSessionDataTask?
    var url:String!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        url  = REQUESTURL + "q=select * from local.search where latitude='30.2175' and longitude='-97.8558' and query='pizza' | sort(field='Distance')&format=json&diagnostics=true&callback="
        getJSonRequest = GetJSONRequest(url: url)
    }
    func testParseServerDataDoesntCallCompletionWithBrokenJSON() {
        let brokenJsonData = "{".dataUsingEncoding(NSUTF8StringEncoding)
        getJSonRequest.parseServerData(brokenJsonData, response: nil, error: nil) { (result) in
            XCTAssertFalse(result == nil, "Completion closure must not be called with broken JSON data.")
        }
        
    }
    func testParseServerDataCallsCompletionWithProperJSON() {
        let goodJsonData = "{\"Title\": \"Chuck E Cheese's\"}".dataUsingEncoding(NSUTF8StringEncoding)
        getJSonRequest.parseServerData(goodJsonData, response: nil, error: nil) { (result) in
            XCTAssertTrue(result != nil, "Completion closure must not be called with proper JSON data.")
        }
    }
    
    func testDataTask() {
        if let encodedString = url.stringByAddingPercentEncodingWithAllowedCharacters(
            NSCharacterSet.URLFragmentAllowedCharacterSet()),
            url = NSURL(string: encodedString) {
            dataTask = defaultSession.dataTaskWithURL(url) {
                data, response, error in
                XCTAssertNil(error, "dataTaskWithURL error \(error)")
                
                if let httpResponse = response as? NSHTTPURLResponse {
                    XCTAssertEqual(httpResponse.statusCode, 200, "status code was not 200; was \(httpResponse.statusCode)");
                }
                //            XCTAssert(data, "data nil");
                XCTAssertNil(data, "data nil")
                self.dataTask!.resume()
            }
        }
    }
}