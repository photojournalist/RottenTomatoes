//
//  MoviesViewController.swift
//  RottenTomatoes
//
//  Created by Salim Madjd on 9/25/14.
//  Copyright (c) 2014 Salim Madjd. All rights reserved.
//

import UIKit
import QuartzCore
class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, APIControllerProtocol {

	var api: APIController?

	var refreshControl:UIRefreshControl!

	//var movies: [NSDictionary] = []

	var movies = [Movie]()

	@IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.delegate = self
		tableView.dataSource = self

		api = APIController(delegate: self)

		api!.getMovies()

		self.refreshControl = UIRefreshControl()
		self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refersh")
		self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
		self.tableView.addSubview(refreshControl)


/*

		var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=zexq9u4h4s8ebmappn8jg4e6&limit=20&country=US"

		var request = NSURLRequest(URL: NSURL(string: url))

		NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in

			var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary

			self.movies = object["movies"] as [NSDictionary]

			//self.tableView.reloadData()

			//println("\(object)")

		}



*/




        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {



		var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell


		var movie = movies[indexPath.row]



		cell.titleLabel.text = movie.title
		cell.synopsisLabel.text = movie.synopsis



		cell.posterView.setImageWithURL(NSURL(string: movie.imageURLSmall))

		cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
		UIView.animateWithDuration(0.25, animations: {
			cell.layer.transform = CATransform3DMakeScale(1,1,1)
		})

		//var movie = movies[indexPath.row]
		//cell.titleLabel.text = movie["title"] as? String
		//cell.synopsisLabel.text = movie["synopsis"] as? String

		//var posters = movie["posters"] as NSDictionary
		//var posterURL = posters["thumbnail"] as String

		//cell.textLabel!.text = "I'm in row \(indexPath.row) and section \(indexPath.section) "

		return cell
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}

	func didReceiveAPIResults(results: [NSDictionary]) {
	
		movies = Movie.moviesWithJSON(results)


		dispatch_async(dispatch_get_main_queue(), {
			//self.tableData = resultsArr
			self.tableView!.reloadData()
		})
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		var detailsViewController: DetailsViewController = segue.destinationViewController as DetailsViewController
		var movieIndex = tableView!.indexPathForSelectedRow()!.row
		var selectedMovie = self.movies[movieIndex]
		detailsViewController.movie = selectedMovie
	}

	func refresh(sender:AnyObject)
	{
		// Code to refresh table view
		api!.getMovies()
	}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
