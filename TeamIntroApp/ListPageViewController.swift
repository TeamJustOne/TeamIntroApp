import UIKit

class ListPageViewController: UIViewController {
    @IBOutlet var teamImageView: UIImageView!
    @IBOutlet var memberImageView1: UIImageView!
    @IBOutlet var memberImageView2: UIImageView!
    @IBOutlet var memberImageView3: UIImageView!
    @IBOutlet var memberImageView4: UIImageView!
    @IBOutlet var memberImageView5: UIImageView!
    
    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var memberNameLabel1: UILabel!
    @IBOutlet var memberNameLabel2: UILabel!
    @IBOutlet var memberNameLabel3: UILabel!
    @IBOutlet var memberNameLabel4: UILabel!
    @IBOutlet var memberNameLabel5: UILabel!
    
    var members: [TeamMember] = []
    private var memberImageViews: [UIImageView] = []
    private var memberNameLabels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupArrays()
        members = loadMembersFromJSON() ?? []

        setupTeamImage()
        setupMemberImages()
        setupGesture()
    }
    
    private func setupArrays() {
        memberImageViews = [
            memberImageView1, memberImageView2, memberImageView3, memberImageView4, memberImageView5
        ]
        
        memberNameLabels = [
            memberNameLabel1, memberNameLabel2, memberNameLabel3, memberNameLabel4, memberNameLabel5
        ]
    }
    
    private func setupTeamImage() {
        teamImageView.image = UIImage(named: "TeamInfo")
        teamNameLabel.text = "그냥1조"
        adjustContentsRect(for: teamImageView, y: -0.1)
    }
    
    private func setupMemberImages() {
        let yValues: [CGFloat] = [0.2, 0.2, -0.5, -0.3, -0.4]
        
        for (i, imageView) in memberImageViews.enumerated() {
            if i == 0 || i == 3 {
                imageView.contentMode = .scaleAspectFit
            }
            
            if i < yValues.count {
                adjustContentsRect(for: imageView, y: yValues[i])
            }
            
            if members.indices.contains(i) {
                imageView.image = UIImage(named: members[i].imageName)
                memberNameLabels[i].text = members[i].name
            }
        }
    }
    
    private func setupGesture() {
        teamImageView.addGestureRecognizer(makeTapGesture(selector: #selector(tapTeamImage)))
        teamImageView.isUserInteractionEnabled = true
        
        for (i, imageView) in memberImageViews.enumerated() {
            imageView.addGestureRecognizer(makeTapGesture(selector: Selector("tapMemberImage\(i + 1)")))
            imageView.isUserInteractionEnabled = true
        }
    }
    
    private func makeTapGesture(selector: Selector) -> UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: selector)
    }
    
    private func adjustContentsRect(for imageView: UIImageView, y: CGFloat) {
        imageView.layer.contentsRect = CGRect(x: 0, y: y, width: 1, height: 1 - y)
    }
    
    @objc func tapTeamImage() {
        let storyboard = UIStoryboard(name: "TeamInfo", bundle: nil)
        
        if let teamInfoVC = storyboard.instantiateViewController(withIdentifier: "TeamInfoViewController") as? TeamInfoViewController {
            navigationController?.pushViewController(teamInfoVC, animated: true)
        } else {
            print("TeamInfoViewController를 인스턴스화할 수 없습니다.")
        }
    }
    
    @objc func tapMemberImage1() {
        pushMemberDetail(i: 0)
    }
    
    @objc func tapMemberImage2() {
        pushMemberDetail(i: 1)
    }
    
    @objc func tapMemberImage3() {
        pushMemberDetail(i: 2)
    }
    
    @objc func tapMemberImage4() {
        pushMemberDetail(i: 3)
    }
    
    @objc func tapMemberImage5() {
        pushMemberDetail(i: 4)
    }
    
    private func pushMemberDetail(i: Int) {
        guard members.indices.contains(i) else { return }
        let detailVC = MemberDetailViewController()
        detailVC.member = members[i]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func loadMembersFromJSON() -> [TeamMember]? {
        guard let url = Bundle.main.url(forResource: "members", withExtension: "json") else {
            print("❌ member.json 파일을 찾을 수 없습니다.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let members = try JSONDecoder().decode([TeamMember].self, from: data)
            return members
        } catch {
            print("❌ JSON 디코딩 실패: \(error)")
            return nil
        }
    }
}
