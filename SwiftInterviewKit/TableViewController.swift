//
//  TableViewController.swift
//  SwiftInterviewKit
//
//  Created by Boris Oks on 4/14/17.
//  Copyright © 2017 Boris Oks. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var items: [[String: AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.get(url: "https://netflixroulette.net/api/api.php?director=Quentin%20Tarantino") { (code, object) in
            if let array = object as? [[String: AnyObject]] {
                self.items = array
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard self.items.count >= indexPath.row else {
            return UITableViewCell()
        }
        
        let obj = items[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)

        cell.textLabel?.text = obj["show_title"] as? String ?? "Unknown title"

        if let imgURL = obj["poster"] as? String {
            cell.imageView?.loadImage(url: imgURL) { success in
                cell.setNeedsLayout()
            }
        }

        return cell
    }

}
