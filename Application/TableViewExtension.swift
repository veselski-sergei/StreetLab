//
//  TableViewExtension.swift
//  StreetLab
//
//  Created by Sergey Veselski on 07.05.2023.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCustomCell(_ cell: CustomCell.Type) {
        self.register(cell.cellNib, forCellReuseIdentifier: cell.cellIdentifier)
    }
    
}
