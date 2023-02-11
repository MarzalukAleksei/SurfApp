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
            return rowsInView
        } else {
            return rowsInView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView.viewWithTag(1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridViewCollectionCell
            let index = indexPath.row % list.count
            cell.label.text = list[index]
            cell.backgroundColor = UIColor(named: "BackgroundButtonColor")
            cell.layer.cornerRadius = cell.bounds.height * 0.20
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
    
}

