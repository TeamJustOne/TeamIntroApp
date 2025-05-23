//
//  TeamInfoViewController.swift
//  TeamIntroApp
//
//  Created by 김우성 on 5/21/25.
//

import UIKit

struct TeamInfo {
    let subtitle: String
    let description: String
}

class TeamInfoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    
    let repository: TeamRepository
    
    init(repository: TeamRepository = TeamRepositoryImpl()) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.repository = TeamRepositoryImpl()
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "팀 정보"
        
        /* Image View */
        imageView.image = UIImage(named:"TeamInfo")
        imageView.contentMode = .scaleAspectFill
        
        /* Scroll View */
        loadTeamInfo()
    }
    
    private func loadTeamInfo() {
        do {
            let styledText = try repository.loadStyledAttributedString()
            textView.attributedText = styledText
            textView.isEditable = false
            textView.isScrollEnabled = false
            textView.backgroundColor = .clear
            textView.textContainerInset = .zero
            textView.textContainer.lineFragmentPadding = 0
        } catch {
            print("❌ 팀 정보 로드 실패: \(error)")
        }
    }
}
