//
//  ViewController.swift
//  StreetLab
//
//  Created by Sergey Veselski on 30.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    
    @IBAction func didTapDemoButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Rotate your phone",
                                      message: "Please, rotate the screen horizontally",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Done, sir", style: .default) { _ in
            let storyboard = UIStoryboard(name: "DesignConstructorVC", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DesignConstructorVC") as! DesignConstructorVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Back", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func didTapDesignsButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "StreetDesignsVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StreetDesignsVC") as! StreetDesignsVC
        navigationController?.pushViewController(vc, animated: true)
    }
}
