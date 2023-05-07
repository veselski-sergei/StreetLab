//
//  StreetDesignsController.swift
//  StreetLab
//
//  Created by Sergey Veselski on 07.05.2023.
//

import UIKit

class StreetDesignsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var streetDesigns: [StreetDesignModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        streetDesigns.append(StreetDesignModel(name: "Nevsky av.", image: "someImage", timestamp: "Today"))
        streetDesigns.append(StreetDesignModel(name: "Belgradskaya st.", image: "someImage", timestamp: "Yesterday"))
        streetDesigns.append(StreetDesignModel(name: "Turku st.", image: "someImage", timestamp: "Some time ago"))
        streetDesigns.append(StreetDesignModel(name: "Blagodatnaya st.", image: "someImage", timestamp: "Today"))

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCustomCell(StreetDesignCell.self)
    }
}

extension StreetDesignsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return streetDesigns.count   //-> designsForUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StreetDesignCell.cellIdentifier, for: indexPath) as! StreetDesignCell
        
        let model = streetDesigns[indexPath.row]
        
        cell.configure(with: model)
        
//        cell.textLabel?.text = "cwcwc"
//        cell.imageView?.image = #imageLiteral(resourceName: "gribi.jpeg")
        
        return cell
    }
    
    
}
