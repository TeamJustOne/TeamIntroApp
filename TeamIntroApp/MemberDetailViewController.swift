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
        
        let yOffset: CGFloat = 100
        
        let imageWidth: CGFloat = view.frame.width - 40
        let imageHeight: CGFloat = 200
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: yOffset, width: imageWidth, height: imageHeight)
        imageView.image = UIImage(named: member.imageName)
        imageView.contentMode = .scaleAspectFit  // 전체 이미지 보이도록 설정
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        view.addSubview(imageView)
        
        let nameView = makeStackView(title: "이름", value: member.name)
        let mbtiView = makeStackView(title: "🧠 MBTI", value: member.mbti)
        let firstView = UIStackView()
        firstView.axis = .horizontal
        firstView.spacing = 20
        firstView.distribution = .fillEqually
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.addArrangedSubview(nameView)
        firstView.addArrangedSubview(mbtiView)
        view.addSubview(firstView)
                
        let strengthsView = makeStackView(title: "💪 장점", value: member.strengths.map {"• \($0)"}.joined(separator: "\n"))
        let styleView = makeStackView(title: "🎨 협업 스타일", value: member.collaborationStyle.map {"• \($0)"}.joined(separator: "\n"))
        let blogView = makeStackView(title: "🌐 블로그", value: member.blogURL.absoluteString)
        let secondView = UIStackView()
        secondView.axis = .vertical
        secondView.spacing = 20
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addArrangedSubview(strengthsView)
        secondView.addArrangedSubview(styleView)
        secondView.addArrangedSubview(blogView)
        view.addSubview(secondView)
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 20),
            secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        blogView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blogLabelTapped))
        blogView.addGestureRecognizer(tapGesture)
    }
    
    func makeContentLabel(text: String) -> UIView {
        let label = UILabel()
        label.text = text
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.backgroundColor = .clear
        
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
            
        containerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
        ])
            
        return containerView
    }
        
    func makeStackView(title: String, value: String) -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)

        let valueLabel = makeContentLabel(text: value)

        let stack = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }
        
    @objc func blogLabelTapped() {
        let webViewController = BlogWebViewController(url: member!.blogURL)
        navigationController?.pushViewController(webViewController, animated: true)
    }
}

