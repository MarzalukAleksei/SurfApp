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
            return DefaultData.getTargets().count
        } else {
            return DefaultData.rowsInCollectionView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView.viewWithTag(1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridViewCollectionCell
            let index = indexPath.row % DefaultData.getTargets().count
            cell.label.text = DefaultData.getTargets()[index]
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
            let index = indexPath.row % DefaultData.getTargets().count
            var cellIndex = -1
            if collectionCell != nil {
                cellIndex = collectionCell! % DefaultData.getTargets().count
            }
            cell.label.text = DefaultData.getTargets()[index]
            
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
            let index = indexPath.row % DefaultData.getTargets().count
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

extension ViewController: LayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeForGridAtIndexPath indexPath: IndexPath) -> CGSize {
        let index = indexPath.row % DefaultData.getTargets().count
        let label = DefaultData.getTargets()[index]
        let referenceSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: 44)
        let calculatedSize = (label as NSString).boundingRect(with: referenceSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0)], context: nil)
        return CGSize(width: calculatedSize.width + 48, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, insetsForItemsInSection section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, itemSpacingInSection section: Int) -> CGFloat {
        return 12
    }
    
    
}
