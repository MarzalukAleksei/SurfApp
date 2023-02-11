//
//  ViewController.swift
//  SurfApp
//
//  Created by ブラック狼 on 10.02.2023.
//

import UIKit

enum State {
    case open
    case close
    
    var opposite: State {
        return self == .open ? .close : .open
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gridView: UICollectionView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var contentViewConstraint: NSLayoutConstraint!
    
    let list = ["IOS", "Android", "Desing", "QA", "Flutter", "PM"]
    var rowsInView: Int { list.count * 10 }
    var state: State = .close
    var runningAnimators: [UIViewPropertyAnimator] = []
    var viewOffSet: CGFloat = 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingSettings()
    }
    
    func animateView(state: State, duration: TimeInterval) {
        guard runningAnimators.isEmpty else { return }
        
        let basicAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn)
        basicAnimator.addAnimations {
            switch state {
            case .open:
                self.contentViewConstraint.constant = 0
            case .close:
                self.contentViewConstraint.constant = self.viewOffSet
            }
            self.view.layoutIfNeeded()
        }
        runningAnimators.append(basicAnimator)
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
        collectionView.scrollToItem(at: IndexPath(item: rowsInView / 2, section: 0), at: .left, animated: false)
        
        self.contentViewConstraint.constant = 400
        self.gridView.alpha = 0
        self.view.layoutIfNeeded()
        
        let panGesture = UIPanGestureRecognizer(target: self,
                                                action: #selector(self.drag(_:)))
        self.contentView.addGestureRecognizer(panGesture)
    }
    @objc func drag(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            animateView(state: state.opposite, duration: 0.3)
        case .changed:
            let translation = gesture.translation(in: contentView)
            let fraction = abs(translation.y / viewOffSet)
            
            runningAnimators.forEach { animator in
                animator.fractionComplete = fraction
            }
        case .ended:
            runningAnimators.forEach { $0.continueAnimation(withTimingParameters: nil, durationFactor: 0)}
        case _:
            break
        }
    }
}

