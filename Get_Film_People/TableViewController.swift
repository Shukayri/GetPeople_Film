//
//  TableViewController.swift
//  Get_Film_People
//
//  Created by Abdulmajeed Shukayri on 22/12/2021.
//

import UIKit

class TableViewController: UITableViewController {

    var films : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingFilms()
    }

    
    func loadingFilms(){
        FilmPeople.getAllFilms(completionHandler: {
            data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.films.append(jsonObject["title"] as! String)
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print("Error \(error)")
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFilmCell", for: indexPath)
        cell.textLabel?.text = films[indexPath.row]
        return cell
    }

}
