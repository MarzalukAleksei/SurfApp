//
//  ViewController.swift
//  SurfApp
//
//  Created by ブラック狼 on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    let list = ["IOS", "Android", "Desing", "QA", "Flutter", "PM"]
    var rowsInSection: Int { list.count * 1000 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingSettings()
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
        image.image = UIImage(named: "36")
        button.layer.cornerRadius = button.bounds.height / 2
        collectionView.scrollToItem(at: IndexPath(item: rowsInSection / 2, section: 0), at: .left, animated: false)
    }
}

