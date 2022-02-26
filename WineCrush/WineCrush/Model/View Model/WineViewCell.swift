//
//  viewModel.swift
//  WineCrush
//
//  Created by Adam Mabrouki on 24/02/2022.
//

import Foundation
import UIKit

class WineViewCell: UITableViewCell {
    

    @IBOutlet weak var wineLabel: UILabel!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var wine: ProductMatch? {
        didSet {
        guard let wine = wine else { return }
            wineLabel.text = wine.title  
    }
    
    }
}
//
//
//extension UIImageView {
//    func load(url:URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//
//}
//
//
//extension Int {
//
//    /// Convert Int to time in String
//    var convertIntToTime: String {
//        if self == 0 {
//            let timeNull = "--"
//            return timeNull
//        } else {
//            let minutes = self % 60
//            let hours = self / 60
//            let timeFormatString = String(format: "%01dh%02d", hours, minutes)
//            let timeFormatStringMin = String(format: "%02dm", minutes)
//            let timeFormatNoMin = String(format: "%01dh", hours)
//            let timeFormatStringLessTenMin = String(format: "%01dm", minutes)
//            if self < 60 {
//                if minutes < 10 {
//                return timeFormatStringLessTenMin
//                }
//                return timeFormatStringMin
//            } else if minutes == 0 {
//                return timeFormatNoMin
//            } else {
//                return timeFormatString
//            }
//        }
//    }
//}
