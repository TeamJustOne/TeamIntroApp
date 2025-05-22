import UIKit

class MemberDetailViewController: UIViewController {
    
    var member: TeamMember?   // ViewController에서 전달받음
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    func setupUI() {
        guard let member = member else { return }
        
        var yOffset: CGFloat = 100
        
        let imageWidth: CGFloat = view.frame.width - 40
        let imageHeight: CGFloat = 200
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: yOffset, width: imageWidth, height: imageHeight)
        imageView.image = UIImage(named: member.imageName)
        imageView.contentMode = .scaleAspectFit  // 전체 이미지 보이도록 설정
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        view.addSubview(imageView)
        yOffset += imageHeight + 20
        
        view.addSubview(makeTitleLabel(text: "이름", y: yOffset))
        yOffset += 26
        view.addSubview(makeContentLabel(text: member.name, y: yOffset))
        yOffset += 30
        
        view.addSubview(makeTitleLabel(text: "🧠 MBTI", y: yOffset))
        yOffset += 26
        view.addSubview(makeContentLabel(text: member.mbti, y: yOffset))
        yOffset += 30
        
        view.addSubview(makeTitleLabel(text: "💪 장점", y: yOffset))
        yOffset += 26
        for strength in member.strengths {
            let label = makeContentLabel(text: "• \(strength)", y: yOffset)
            view.addSubview(label)
            yOffset += label.frame.height + 6
        }
        yOffset += 10
        
        view.addSubview(makeTitleLabel(text: "🎨 스타일", y: yOffset))
        yOffset += 26
        for style in member.collaborationStyle {
            let label = makeContentLabel(text: "• \(style)", y: yOffset)
            view.addSubview(label)
            yOffset += label.frame.height + 6
        }
        yOffset += 10
        
        view.addSubview(makeTitleLabel(text: "🌐 블로그", y: yOffset))
        yOffset += 26
        let blogLabel = makeContentLabel(text: member.blogURL.absoluteString, y: yOffset)
        blogLabel.isUserInteractionEnabled = true
        blogLabel.textColor = .black
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        blogLabel.addGestureRecognizer(tapGesture)
        view.addSubview(blogLabel)
        
        
        
    }
    
    func makeTitleLabel(text: String, y: CGFloat) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: y, width: view.frame.width - 40, height: 24)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = text
        return label
    }
    
    func makeContentLabel(text: String, y: CGFloat) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: y, width: view.frame.width - 40, height: 0)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = text
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
    
    @objc func labelTapped() {
        let webViewController = BlogWebViewController(url: member!.blogURL)
        navigationController?.pushViewController(webViewController, animated: true)
        }
}

