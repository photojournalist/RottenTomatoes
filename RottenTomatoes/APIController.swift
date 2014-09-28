//
//  APIController.swift
//  RottenTomatoes
//
//  Created by Salim Madjd on 9/26/14.
//  Copyright (c) 2014 Salim Madjd. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
	func didReceiveAPIResults(results: [NSDictionary])
}

class APIController {

	let RTKey = "zexq9u4h4s8ebmappn8jg4e6"

	var delegate: APIControllerProtocol

	init(delegate: APIControllerProtocol) {
		self.delegate = delegate
	}

	func getMovies() {

			println("calling getMovies")

			let urlPath = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=\(RTKey)&limit=20&country=US"
			let url: NSURL = NSURL(string: urlPath)
			let session = NSURLSession.sharedSession()
			let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
				println("Task completed")
				if(error != nil) {
					// If there is an error in the web request, print it to the console
					println(error.localizedDescription)
				}
				var err: NSError?

				var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
				if(err != nil) {
					// If there is an error parsing JSON, print it to the console
					println("JSON Error \(err!.localizedDescription)")
				}
				let results: [NSDictionary] = jsonResult["movies"] as [NSDictionary]
				self.delegate.didReceiveAPIResults(results)


			})

			task.resume()
	}




}
