import UIKit
import WebKit

class BlogWebViewController: UIViewController {
    private let webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        loadWebView()
    }
    
    private func setupNavigationBar() {
        let openInSafariButton = UIBarButtonItem(
            image: UIImage(systemName: "safari"),
            style: .plain,
            target: self,
            action: #selector(openInSafari)
        )
        navigationItem.rightBarButtonItem = openInSafariButton
    }
    
    @objc private func openInSafari() {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadWebView() {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

class TempForBlogMemberListViewController: UIViewController {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "MemberCell")
        return table
    }()
    
    private let members: [TeamMember] = [
        TeamMember(imageName:"",name: "박주하", mbti: "", description: "", strengths: [], collaborationStyle: [],  blogURL: URL(string: "https://velog.io/@juha")!),
        TeamMember(imageName:"",name: "김우성", mbti: "", description: "", strengths: [], collaborationStyle: [],  blogURL: URL(string: "https://velog.io/@housedone")!),
        TeamMember(imageName:"",name: "이서린", mbti: "", description: "", strengths: [], collaborationStyle: [], blogURL: URL(string: "https://velog.io/@seorin")!),
        TeamMember(imageName:"",name: "김성연", mbti: "", description: "", strengths: [], collaborationStyle: [], blogURL: URL(string: "https://velog.io/@greenocean")!),
        TeamMember(imageName:"",name: "박범근", mbti: "", description: "", strengths: [], collaborationStyle: [], blogURL: URL(string: "https://velog.io/@luca__tuna")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "(임시화면) 팀원 리스트"
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TempForBlogMemberListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)
        let member = members[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = member.name
        content.secondaryText = "블로그 보기 → \(member.blogURL.absoluteString)"
        content.secondaryTextProperties.color = .systemBlue
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let member = members[indexPath.row]
        let webViewController = BlogWebViewController(url: member.blogURL)
        navigationController?.pushViewController(webViewController, animated: true)
    }
} 
