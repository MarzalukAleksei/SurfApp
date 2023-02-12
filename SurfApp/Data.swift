//
//  Dates.swift
//  SurfApp
//
//  Created by ブラック狼 on 12.02.2023.
//

import UIKit

struct DefaultData {
    static let image: UIImage = UIImage(named: "36")!
    static let rowsInCollectionView: Int = 10
    let mainConstraint: Int = 450
    var bottonOffset = 24
    var selectedCell = 0
    
    static func getTargets() -> [String] {
        var list: [String] = []
        
        guard let url = Bundle.main.url(forResource: "Targets", withExtension: "plist"),
              let fromPlist = NSArray(contentsOf: url) as? [String] else { return list }
        list = fromPlist
        
        return list
    }
}
