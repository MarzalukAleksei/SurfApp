//
//  ViewController.swift
//  SurfApp
//
//  Created by ブラック狼 on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gridView: UICollectionView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var contentViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewHightConstraint: NSLayoutConstraint!
    
    var offSetContentView: CGFloat { button.bounds.height - DefaultData.bottonOffset }
    var gridCellState = 0
    var collectionCell: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingSettings()
        let layout = GridLayout()
        layout.delegate = self
        self.gridView.collectionViewLayout = layout
    }

    @IBAction func button(_ sender: Any) {
        massage(with: "Поздравляем!", massage: "Ваша заявка успешно отправлена!")
    }
    
    private func massage(with title: String, massage: String) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func loadingSettings() {
        contentView.layer.cornerRadius = contentView.bounds.width * 0.1
        image.image = DefaultData.image
        button.layer.cornerRadius = button.bounds.height / 2
//        collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: false)
        
        self.contentViewConstraint.constant = DefaultData.mainConstraint
        self.contentViewHightConstraint.constant = contentViewHightConstraint.constant - offSetContentView
        
    }
}

