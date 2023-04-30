//
//  ElementCell.swift
//  StreetLab
//
//  Created by Sergey Veselski on 01.05.2023.
//

import UIKit

class ElementCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public
    
    func configure(image: UIImage?, description: String?) {
        imageView.image = image
        descriptionLabel.text = description
    }
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 6
    }
}
