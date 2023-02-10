//
//  ViewController + Extension.swift
//  SurfApp
//
//  Created by ブラック狼 on 10.02.2023.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource/*, UICollectionViewDelegateFlowLayout */{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        if indexPath.row > cells.count - 1 {
            cell.label.text = cells[indexPath.row - cells.count]
        } else {
            cell.label.text = cells[indexPath.row]
        }
        cell.backgroundColor = UIColor(named: "BackgroundButtonColor")
        cell.layer.cornerRadius = cell.bounds.height * 0.12 // проверить
        return cell
    }
    
//    func collectionView(_: UICollectionView, layout: UICollectionViewLayout, insetForSectionAt: Int) -> UIEdgeInsets {
//        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
//        return insets
//    }
    
}
