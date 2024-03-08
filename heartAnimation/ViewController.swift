//
//  ViewController.swift
//  heartAnimation
//
//  Created by Захар Литвинчук on 08.03.2024.
//

import UIKit

final class ViewController: UIViewController {

    let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нажми на меня!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        [heartImageView, button].forEach({ view.addSubview($0) })
        
        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            heartImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            heartImageView.widthAnchor.constraint(equalToConstant: 200),
            heartImageView.heightAnchor.constraint(equalToConstant: 200),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 20)
        ])

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        animateHeart()
    }

    func animateHeart() {
        UIView.animate(withDuration: 0.5, animations: {
            self.heartImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.heartImageView.transform = CGAffineTransform.identity
            }
        }
    }
}

