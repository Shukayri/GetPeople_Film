//
//  ViewController.swift
//  Get_Film_People
//
//  Created by Abdulmajeed Shukayri on 22/12/2021.
//

import UIKit

class ViewController: UITableViewController {
    var people : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingPeople()
        // Do any additional setup after loading the view.
    }
    
    func loadingPeople(){
        FilmPeople.getAllPeople(completionHandler: {
            data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.people.append(jsonObject["name"] as! String)
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
        people.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPeopleCell", for: indexPath)
        
        cell.textLabel?.text = people[indexPath.row]
        
        return cell
    }
}

