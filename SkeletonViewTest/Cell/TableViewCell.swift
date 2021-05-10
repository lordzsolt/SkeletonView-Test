//
//  TableViewCell.swift
//  SkeletonViewTest
//
//  Created by Zsolt Kovacs on 07.05.21.
//

import UIKit
import SkeletonView

class TableViewCell: UITableViewCell {
    @IBOutlet var skeletonableView: UIView!

    var skeletonViews: [UIView] {
        return [self, contentView, skeletonableView]
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        skeletonViews.forEach {
            $0.isSkeletonable = true
        }
    }
}
