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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    
    func configure(with design: StreetDesignModel) {
        nameLabel.text = design.name
        timestampLabel.text = design.timestamp
        previewImage.image = UIImage(systemName: design.image)
    }
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 30
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
