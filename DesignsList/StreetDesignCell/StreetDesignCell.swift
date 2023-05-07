//
//  StreetDesignCell.swift
//  StreetLab
//
//  Created by Sergey Veselski on 07.05.2023.
//

import UIKit

protocol CustomCell {
    static var cellIdentifier: String { get }
    
    static var cellNib: UINib? { get }
}

class StreetDesignCell: UITableViewCell, CustomCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    func configure(with design: StreetDesignModel) {
        leftLabel.text = design.name
        rightLabel.text = design.timestamp
        
        leftLabel.sizeToFit()
        rightLabel.sizeToFit()
    }
}

extension UITableViewCell {
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    static var cellNib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
