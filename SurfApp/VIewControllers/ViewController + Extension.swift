//
//  ViewController + Extension.swift
//  SurfApp
//
//  Created by ブラック狼 on 10.02.2023.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let index = indexPath.row % list.count
        cell.label.text = list[index]
        cell.backgroundColor = UIColor(named: "BackgroundButtonColor")
        cell.layer.cornerRadius = cell.bounds.height * 0.12
        return cell
    }
    
    
}
