//
//  Movie.swift
//  RottenTomatoes
//
//  Created by Salim Madjd on 9/27/14.
//  Copyright (c) 2014 Salim Madjd. All rights reserved.
//

import Foundation

class Movie {

	var id: String
	var title: String
	var synopsis: String
	var imageURLSmall: String
	var imageURLLarge: String


	init(id: String, title: String, synopsis: String, imageURLSmall: String, imageURLLarge: String){

		self.id = id
		self.title = title
		self.synopsis = synopsis
		self.imageURLSmall = imageURLSmall
		self.imageURLLarge = imageURLLarge


	}


	class func moviesWithJSON(allResults: [NSDictionary]) -> [Movie] {

		// Create an empty array of Albums to append to from this list
		var movies = [Movie]()


		if allResults.count>0 {


			for result in allResults {


				var id = result["id"] as? String ?? ""
				var title = result["title"] as? String ?? ""
				var synopsis = result["synopsis"] as? String ?? ""
				var posters = result["posters"] as NSDictionary
				var imageURLSmall = posters["thumbnail"] as? String ?? ""
				var imageURLLarge = imageURLSmall.stringByReplacingOccurrencesOfString("tmb", withString: "ori", options: NSStringCompareOptions.LiteralSearch, range: nil)

				//println("Movie is: \(id) - title: \(title) - synopsis: \(synopsis) - imageURLSmall: \(imageURLSmall) - imageURLLarge: \(imageURLLarge)"  )


				




				var newMovie = Movie(id: id, title: title, synopsis: synopsis, imageURLSmall: imageURLSmall, imageURLLarge: imageURLLarge)

				movies.append(newMovie)

			}



		}



		return movies


	}





}



/*


[{"id":"771349837","title":"The Maze Runner","year":2014,"mpaa_rating":"PG-13","runtime":114,"critics_consensus":"","release_dates":{"theater":"2014-09-19"},"ratings":{"critics_rating":"Fresh","critics_score":63,"audience_rating":"Upright","audience_score":78},"synopsis":"When Thomas wakes up trapped in a massive maze with a group of other boys, he has no memory of the outside world other than strange dreams about a mysterious organization known as W.C.K.D. Only by piecing together fragments of his past with clues he discovers in the maze can Thomas hope to uncover his true purpose and a way to escape. Based upon the best-selling novel by James Dashner. (c) Fox","posters":{"thumbnail":"http://content7.flixster.com/movie/11/17/97/11179705_tmb.jpg","profile":"http://content7.flixster.com/movie/11/17/97/11179705_tmb.jpg","detailed":"http://content7.flixster.com/movie/11/17/97/11179705_tmb.jpg","original":"http://content7.flixster.com/movie/11/17/97/11179705_tmb.jpg"},"abridged_cast":[{"name":"Dylan O'Brien","id":"771375271","characters":["Thomas"]},{"name":"Kaya Scodelario","id":"770803276","characters":["Teresa"]},{"name":"Will Poulter","id":"770791291","characters":["Gally"]},{"name":"Thomas Brodie-Sangster","id":"771100380","characters":["Newt"]},{"name":"Aml Ameen","id":"364640368","characters":["Alby"]}],"alternate_ids":{"imdb":"1790864"},"links":{"self":"http://api.rottentomatoes.com/api/public/v1.0/movies/771349837.json","alternate":"http://www.rottentomatoes.com/m/the_maze_runner/","cast":"http://api.rottentomatoes.com/api/public/v1.0/movies/771349837/cast.json","reviews":"http://api.rottentomatoes.com/api/public/v1.0/movies/771349837/reviews.json","similar":"http://api.rottentomatoes.com/api/public/v1.0/movies/771349837/similar.json"}}



*/