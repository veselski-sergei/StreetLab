//
//  DesignConstructorVC.swift
//  StreetLab
//
//  Created by Sergey Veselski on 30.04.2023.
//

import UIKit

class DesignConstructorVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var streetElemsCollectionView: UICollectionView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var streetName: UITextField!
    @IBOutlet weak var streetImageView: UIImageView!
    
    // MARK: - Variables
    var street: StreetDesignModel?
    
    // MARK: - Image source
    let imageNamesArray: [String] = ["bus",
                                     "car",
                                     "building",
                                     "scooter",
                                     "bicycle"]
    
    // MARK: - Actions
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let street = street {
            streetName.text = street.name
            streetImageView.image = UIImage(systemName: street.image)
        }
        
        
        
        backgroundView.layer.cornerRadius = 6
        streetElemsCollectionView.dataSource = self
        let elementCellNib = UINib(nibName: "ElementCell", bundle: nil)
        streetElemsCollectionView.register(elementCellNib, forCellWithReuseIdentifier: "ElementCell")
    }
    
    // MARK: - Orientation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.landscape)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.portrait)
    }
}

extension DesignConstructorVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /// здесь указываем кол-во элементов улицы - streetElems.count
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ElementCell", for: indexPath) as! ElementCell
        
        ///  количество ячеек статично и присваивать картинку и описание
        ///  можно будет подобным образом
        let imageName = imageNamesArray[indexPath.row % imageNamesArray.count]
        cell.configure(image: UIImage(systemName: imageName), description: imageName)
    
        return cell
    }
}
