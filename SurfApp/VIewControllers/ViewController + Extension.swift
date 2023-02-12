//
//  ViewController + Extension.swift
//  SurfApp
//
//  Created by ブラック狼 on 10.02.2023.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView.viewWithTag(1) {
            return DefaultData.rowsInCollectionView * 10
        } else {
            return DefaultData.rowsInCollectionView * 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView.viewWithTag(1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridViewCollectionCell
            let index = indexPath.row % list.count
            cell.label.text = list[index]
            cell.backgroundColor = UIColor(named: "BackgroundButtonColor")
            cell.label.textColor = .black
            cell.layer.cornerRadius = cell.bounds.height * 0.20
            if index == gridCell {
                cell.backgroundColor = UIColor(named: "TappedButtonColor")
                cell.label.textColor = .white
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            let index = indexPath.row % list.count
            cell.label.text = list[index]
            cell.backgroundColor = UIColor(named: "BackgroundButtonColor")
            cell.layer.cornerRadius = cell.bounds.height * 0.20
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView.viewWithTag(0) {
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
        let index = indexPath.row % list.count
        if collectionCell != nil || index != collectionCell {
            collectionCell = index
        } else {
            collectionCell = nil
        }
    }
}

