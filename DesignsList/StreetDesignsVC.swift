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
        
        streetDesigns.append(StreetDesignModel(name: "Nevsky av.", image: "bus", timestamp: "Today"))
        streetDesigns.append(StreetDesignModel(name: "Belgradskaya st.", image: "car", timestamp: "Yesterday"))
        streetDesigns.append(StreetDesignModel(name: "Turku st.", image: "scooter", timestamp: "Some time ago"))
        streetDesigns.append(StreetDesignModel(name: "Blagodatnaya st.", image: "bicycle", timestamp: "Today"))
        
        tableView.rowHeight = 100

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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "DesignConstructorVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DesignConstructorVC") as! DesignConstructorVC
        
        let streetModel = streetDesigns[indexPath.row]
        vc.street = streetModel
//        vc.streetImageView.image = UIImage(systemName: model.image)
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
