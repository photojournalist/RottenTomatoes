//
//  DetailsViewController.swift
//  RottenTomatoes
//
//  Created by Salim Madjd on 9/27/14.
//  Copyright (c) 2014 Salim Madjd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

	@IBOutlet weak var synapsis: UILabel!

	@IBOutlet weak var movieTitle: UINavigationItem!
	@IBOutlet weak var poster: UIImageView!

	var movie: Movie?

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		self.synapsis.text = movie?.synopsis

		self.movieTitle.title = movie?.title
		var posterURL = movie?.imageURLLarge

		self.poster.setImageWithURL(NSURL(string: posterURL!))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
