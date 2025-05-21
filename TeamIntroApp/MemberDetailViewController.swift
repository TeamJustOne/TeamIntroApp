import UIKit

class MemberDetailViewController: UIViewController {

    var member: TeamMember?  // ViewController에서 전달받음

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupUI()
    }

    func setupUI() {
        guard let member = member else { return }

        var yOffset: CGFloat = 100
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: (view.frame.width - 100) / 2, y: yOffset, width: 100, height: 100)
        imageView.image = UIImage(named: member.imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        view.addSubview(imageView)
        yOffset += 120

        let nameLabel = makeLabel(text: "이름: \(member.name)", y: yOffset)
        yOffset += 30
        let mbtiLabel = makeLabel(text: "🧠 MBTI: \(member.mbti)", y: yOffset)
        yOffset += 26
        let prosLabel = makeLabel(text: "💪 장점: \(member.strengths.joined(separator: ", "))", y: yOffset)
        yOffset += 40
        let styleLabel = makeLabel(text: "🎨 스타일: \(member.collaborationStyle.joined(separator: ", "))", y: yOffset)
        yOffset += 40

        view.addSubview(nameLabel)
        view.addSubview(mbtiLabel)
        view.addSubview(prosLabel)
        view.addSubview(styleLabel)

    }

    func makeLabel(text: String, y: CGFloat) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: y, width: view.frame.width - 40, height: 20)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = text
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }

    }
