//
//  ViewController.swift
//  TeamIntroApp
//
//  Created by estelle on 5/20/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func blogButtonTapped(_ sender: UIButton) {
        let memberListVC = TempForBlogMemberListViewController()
        self.navigationController?.pushViewController(memberListVC, animated: true)
    }

}

