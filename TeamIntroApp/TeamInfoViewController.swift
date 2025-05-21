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
    @IBOutlet weak var stackView: UIStackView!
    
    private let sections: [TeamInfo] = [
        TeamInfo(subtitle: "", description: "• 우리는 다양한 실력을 가진 5명의 iOS 개발자로 구성된 팀입니다. \n• 3년차 실무 경험자부터 이제 막 시작한 초보 개발자까지, 서로의 배움과 성장을 도우며 함께 한 걸음씩 나아가고 있습니다."),
        TeamInfo(subtitle: "우리의 목표", description: "• 사용자 중심의 앱 개발을 목표로 합니다."),
        TeamInfo(subtitle: "약속", description: "✨ 우리는 서로의 성장을 진심으로 응원합니다. \n\t실력의 차이는 배움의 기회라 생각하며, 작은 성장도 함께 기뻐합니다. \n💬 질문을 망설이지 않고, 모르는 것을 부끄러워하지 않습니다. \n이해하고 넘어가기 위해 자유롭게 묻고, 함께 고민하며 더 나은 방향을 찾습니다. \n📚 우리는 경험을 공유하고, 지식을 나누는 데 인색하지 않습니다. \n혼자 아는 것이 아니라 팀 전체가 이해할 수 있도록 소통합니다. \n🧭 앱을 개발할 때는 항상 사용자의 입장에서 먼저 생각합니다. \n우리가 만든 기능이 어떻게 받아들여질지를 고민하며 디자인합니다. \n🔄 코드는 깔끔하게, 구조는 명확하게. \n나 자신보다 팀원을 위한 코드, 미래의 나를 위한 코드를 씁니다. \n🧪 새로운 기술을 두려워하지 않고, 실험하고 실패하며 배우는 데 열려 있습니다. \nMVC를 기반으로 하되, 더 나은 구조나 패턴이 있다면 언제든 탐색합니다. \n⏱️ 마감과 일정은 중요하지만, 코드 품질과 개발자의 지속 가능성도 똑같이 중요합니다. \n우리는 번아웃 없이 오래 함께 가는 팀이 되고자 합니다. \n🌐 블로그와 커뮤니티 활동을 통해 팀 외부에도 우리를 소개하고, 다른 개발자들과 생각을 나누며 계속해서 확장되는 팀이 되기를 바랍니다. \n💡 그리고 무엇보다도, 우리는 즐겁게 개발합니다. \n코딩이 스트레스가 아니라, 함께 웃고 몰입하는 순간이 되도록 노력합니다.")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "팀 정보"
        
        /* Image View */
        imageView.image = UIImage(named:"TeamInfo")
        imageView.contentMode = .scaleAspectFill
        
        /* Scroll View */
        addTeamInfoContent()
        
        // Do any additional setup after loading the view.
    }
    
    private func addTeamInfoContent() {
        let titleLabel = makeLabel(
            text: "그냥 1조? 1️⃣",
            font: .boldSystemFont(ofSize: 28),
            color: .label
        )
        stackView.addArrangedSubview(titleLabel)
        
        for section in sections {
            let subtitleLabel = makeLabel(
                text: section.subtitle,
                font: .boldSystemFont(ofSize: 24),
                color: .label
            )
            let descriptionLabel = makeLabel(
                text: section.description,
                font: .systemFont(ofSize: 17),
                color: .darkGray,
                numberOfLines: 0
            )
            
            stackView.addArrangedSubview(subtitleLabel)
            stackView.addArrangedSubview(descriptionLabel)
        }
    }
    
    private func makeLabel(
        text: String,
        font: UIFont,
        color: UIColor,
        numberOfLines: Int = 1
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        label.numberOfLines = numberOfLines
        label.textAlignment = .left
        label.lineBreakMode = .byCharWrapping
        return label
    }
    
}
