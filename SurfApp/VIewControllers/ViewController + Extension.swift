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
//            return DefaultData.rowsInCollectionView + 2
            return DefaultData.rowsInCollectionView
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
            if index == gridCellState {
                cell.backgroundColor = UIColor(named: "TappedButtonColor")
                cell.label.textColor = .white
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            let index = indexPath.row % list.count
            var cellIndex = -1
            if collectionCell != nil {
                cellIndex = collectionCell! % list.count
            }
            cell.label.text = list[index]
//            if indexPath.row == 0 {
//                collectionView.scrollToItem(at: IndexPath(item: DefaultData.rowsInCollectionView, section: 0), at: .right, animated: false)
//            } else if indexPath.row == DefaultData.rowsInCollectionView + 1 {
//                collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: false)
//            }
            if cellIndex == index {
                cell.backgroundColor = UIColor(named: "TappedButtonColor")
            } else {
                cell.backgroundColor = UIColor(named: "BackgroundButtonColor")
            }
            cell.layer.cornerRadius = cell.bounds.height * 0.20
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView.viewWithTag(0) {
            let index = indexPath.row % list.count
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            if collectionCell == indexPath.row {
                collectionCell = nil
            } else {
                collectionCell = indexPath.row
            }
            collectionView.reloadData()
        }
    }
}

