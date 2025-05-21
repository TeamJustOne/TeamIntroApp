//
//  SplashViewController.swift
//  TeamIntroApp
//
//  Created by estelle on 5/20/25.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.showMainView()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let circleLabel = UILabel()
        circleLabel.text = "TJO"
        circleLabel.textAlignment = .center
        circleLabel.backgroundColor = .darkGray
        circleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        circleLabel.textColor = .white
        circleLabel.layer.cornerRadius = 25
        circleLabel.layer.borderWidth = 2
        circleLabel.layer.borderColor = UIColor.darkGray.cgColor
        circleLabel.layer.masksToBounds = true
        circleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circleLabel)
        
        let titleLabel = UILabel()
        titleLabel.text = "Team Just One"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            circleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -12),
            circleLabel.widthAnchor.constraint(equalToConstant: 50),
            circleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func showMainView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! ViewController
        let navVC = UINavigationController(rootViewController: mainVC)
        
        if let sceneDelegate = UIApplication.shared.connectedScenes
            .first?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navVC
        }
    }

}
