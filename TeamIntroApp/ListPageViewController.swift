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
    
    @IBOutlet var slider: UISlider!
    
    var members: [TeamMember] = []
    
//    var yValue: CGFloat = 0.1 {
//        didSet {
//            member5()
//        }
//    }
//
//    @IBAction func sliderChange(_ sender: UISlider!) {
//        let step: Float = 0.1
//        let roundedValue = round(sender.value / step) * step
//        sender.value = roundedValue
//
//        yValue = CGFloat(roundedValue)
//        print("\(sender.value)")
//    }
    
    @objc func tapTeamImage() {
        // segue 연결
        print("Tapped team Image")
        
        let storyboard = UIStoryboard(name: "TeamInfo", bundle: nil)
        
        if let teamInfoVC = storyboard.instantiateViewController(withIdentifier: "TeamInfoViewController") as? TeamInfoViewController {
            navigationController?.pushViewController(teamInfoVC, animated: true)
        } else {
            print("TeamInfoViewController를 인스턴스화할 수 없습니다.")
        }
    }
    
    @objc func tapMemberImage1() {
        let memberDetailVC = MemberDetailViewController()
        memberDetailVC.member = members[0]
        navigationController?.pushViewController(memberDetailVC, animated: true)
    }
    
    @objc func tapMemberImage2() {
        let memberDetailVC = MemberDetailViewController()
        memberDetailVC.member = members[1]
        navigationController?.pushViewController(memberDetailVC, animated: true)
    }
    
    @objc func tapMemberImage3() {
        let memberDetailVC = MemberDetailViewController()
        memberDetailVC.member = members[2]
        navigationController?.pushViewController(memberDetailVC, animated: true)
    }
    
    @objc func tapMemberImage4() {
        let memberDetailVC = MemberDetailViewController()
        memberDetailVC.member = members[3]
        navigationController?.pushViewController(memberDetailVC, animated: true)
    }
    
    @objc func tapMemberImage5() {
        let memberDetailVC = MemberDetailViewController()
        memberDetailVC.member = members[4]
        navigationController?.pushViewController(memberDetailVC, animated: true)
    }
    
    func team() {
        let y: Double = -0.1
        teamImageView.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member1() {
        // 이서린
        let y = 0.2
        memberImageView1.contentMode = .scaleAspectFit
        memberImageView1.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member2() {
        // 박주하
        let y = 0.2
        memberImageView2.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member3() {
        // 박범근
        let y: Double = -0.5
        memberImageView3.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member4() {
        // 김성연
        let y: Double = -0.3
        memberImageView1.contentMode = .scaleAspectFit
        memberImageView4.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member5() {
        // 김우성
        let y: Double = -0.4
        memberImageView5.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        members = loadMembersFromJSON() ?? []
        team()
        member1()
        member2()
        member3()
        member4()
        member5()
        
        teamImageView.image = UIImage(named: "TeamInfo")
        teamNameLabel.text = "그냥1조"
        
        if members.count >= 5 {
            // 이미지 설정
            memberImageView1.image = UIImage(named: members[0].imageName)
            memberNameLabel1.text = members[0].name
            
            memberImageView2.image = UIImage(named: members[1].imageName)
            memberNameLabel2.text = members[1].name
            
            memberImageView3.image = UIImage(named: members[2].imageName)
            memberNameLabel3.text = members[2].name
            
            memberImageView4.image = UIImage(named: members[3].imageName)
            memberNameLabel4.text = members[3].name
            
            memberImageView5.image = UIImage(named: members[4].imageName)
            memberNameLabel5.text = members[4].name
        }
        
        let teamImageTap = UITapGestureRecognizer(target: self, action: #selector(tapTeamImage))
        let memberImageTap1 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage1))
        let memberImageTap2 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage2))
        let memberImageTap3 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage3))
        let memberImageTap4 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage4))
        let memberImageTap5 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage5))
        
        teamImageView.isUserInteractionEnabled = true
        teamImageView.addGestureRecognizer(teamImageTap)
        
        memberImageView1.isUserInteractionEnabled = true
        memberImageView1.addGestureRecognizer(memberImageTap1)
        
        memberImageView2.isUserInteractionEnabled = true
        memberImageView2.addGestureRecognizer(memberImageTap2)
        
        memberImageView3.isUserInteractionEnabled = true
        memberImageView3.addGestureRecognizer(memberImageTap3)
        
        memberImageView4.isUserInteractionEnabled = true
        memberImageView4.addGestureRecognizer(memberImageTap4)
        
        memberImageView5.isUserInteractionEnabled = true
        memberImageView5.addGestureRecognizer(memberImageTap5)
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
