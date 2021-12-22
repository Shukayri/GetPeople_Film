//
//  FilmPeople.swift
//  Get_Film_People
//
//  Created by Abdulmajeed Shukayri on 22/12/2021.
//

import Foundation

class FilmPeople{

    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let myUrl = URL(string: "https://swapi.dev/api/films/?format=json")
        let mySession = URLSession.shared
        let myTask = mySession.dataTask(with: myUrl!, completionHandler: completionHandler)
        myTask.resume()
    }
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let myUrl = URL(string: "https://swapi.dev/api/people/?format=json")
        let mySession = URLSession.shared
        let myTask = mySession.dataTask(with: myUrl!, completionHandler: completionHandler)
        myTask.resume()
    }
}
