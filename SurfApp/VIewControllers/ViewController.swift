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
    
    let cells = ["IOS", "Android", "Desing", "QA", "Flutter", "PM"]
    let rowsInSection = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "36")
        button.layer.cornerRadius = button.bounds.height / 2
    }

    @IBAction func button(_ sender: Any) {
        massage()
    }
    
    private func massage() {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
}

