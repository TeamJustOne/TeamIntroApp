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
    @IBOutlet var teamImage: UIImageView!
    
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamInfo: UILabel!
    
    @IBOutlet var objectTitle: UILabel!
    @IBOutlet var objectDescription: UILabel!
    @IBOutlet var promiseTitle: UILabel!
    
    @IBOutlet var promise1: UILabel!
    @IBOutlet var promise2: UILabel!
    @IBOutlet var promise3: UILabel!
    @IBOutlet var promise4: UILabel!
    @IBOutlet var promise5: UILabel!
    @IBOutlet var promise6: UILabel!
    @IBOutlet var promise7: UILabel!
    @IBOutlet var promise8: UILabel!
    @IBOutlet var promise9: UILabel!
    
    enum FontSet {
        private static var isPad: Bool {
            UIDevice.current.userInterfaceIdiom == .pad
        }

        private static func scaled(_ size: CGFloat, weight: UIFont.Weight, style: UIFont.TextStyle) -> UIFont {
            let baseFont = UIFont.systemFont(ofSize: isPad ? size + 10 : size, weight: weight)
            return UIFontMetrics(forTextStyle: style).scaledFont(for: baseFont)
        }

        static let teamTitle = scaled(30, weight: .bold, style: .title1)
        static let title = scaled(25, weight: .semibold, style: .title2)
        static let body = scaled(20, weight: .regular, style: .body)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "팀 정보"
        teamImage.image = UIImage(named: "TeamInfo")
        configureAllText()
    }

    private func configure(_ label: UILabel, text: String, font: UIFont) {
        label.text = text
        label.font = font
        label.adjustsFontForContentSizeCategory = true
    }
    
    private func configureAllText() {
        configure(teamName, text: "1️⃣ 그냥1조", font: FontSet.teamTitle)
        configure(teamInfo, text: "우리는 다양한 실력을 가진 5명의 iOS 개발자로 구성된 팀으로 서로의 배움과 성장을 도우며 함께 한 걸음씩 나아가고 있다.", font: FontSet.body)
        configure(objectTitle, text: "🥅 목표", font: FontSet.title)
        configure(objectDescription, text: "사용자 중심의 앱 개발을 목표로 합니다.", font: FontSet.body)
        configure(promiseTitle, text: "🤙 약속", font: FontSet.title)

        let promises: [(UILabel, String)] = [
            (promise1, "• 우리는 서로의 성장을 진심으로 응원합니다. 실력의 차이는 배움의 기회라 생각하며, 작은 성장도 함께 기뻐합니다."),
            (promise2, "• 질문을 망설이지 않고, 모르는 것을 부끄러워하지 않습니다. 이해하고 넘어가기 위해 자유롭게 묻고, 함께 고민하며 더 나은 방향을 찾습니다."),
            (promise3, "• 우리는 경험을 공유하고, 지식을 나누는 데 인색하지 않습니다. 혼자 아는 것이 아니라 팀 전체가 이해할 수 있도록 소통합니다."),
            (promise4, "• 앱을 개발할 때는 항상 사용자의 입장에서 먼저 생각합니다. 우리가 만든 기능이 어떻게 받아들여질지를 고민하며 디자인합니다."),
            (promise5, "• 코드는 깔끔하게, 구조는 명확하게. 나 자신보다 팀원을 위한 코드, 미래의 나를 위한 코드를 씁니다."),
            (promise6, "• 새로운 기술을 두려워하지 않고, 실험하고 실패하며 배우는 데 열려있습니다. MVC를 기반으로 하되, 더 나은 구조나 패턴이 있다면 언제든 탐색합니다."),
            (promise7, "• 마감과 일정은 중요하지만, 코드 품질과 개발자의 지속 가능성도 똑같이 중요합니다. 우리는 번아웃 없이 오래 함께 가는 팀이 되고자 합니다."),
            (promise8, "• 블로그와 커뮤니티 활동을 통해 팀 외부에도 우리를 소개하고, 다른 개발자들과 생각을 나누며 계속해서 확장되는 팀이 됩니다."),
            (promise9, "• 그리고 무엇보다도 우리는 즐겁게 개발합니다. 코딩이 스트레스가 아니라 함께 웃고 몰입하는 순간이 되도록 노력합니다.")
        ]
        
        promises.forEach { configure($0.0, text: $0.1, font: FontSet.body) }
    }
}
