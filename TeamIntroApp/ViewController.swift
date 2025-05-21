import UIKit
import Foundation

struct Member: Codable {
    let imageName: String
    let name: String
    let MBTI: String
    let pros: [String]
    let ownStyle: [String]
    let blogURL: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var members: [Member] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        members = loadMembers() ?? []

        setupTableView()
    }
    
    func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let member = members[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = member.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMember = members[indexPath.row]
        let detailVC = MemberDetailViewController()
        detailVC.member = selectedMember
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func loadMembers() -> [Member]? {
        guard let url = Bundle.main.url(forResource: "members", withExtension: "json") else {
            print("⚠️ JSON 파일을 찾을 수 없습니다.")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Member].self, from: data)
        } catch {
            print("⚠️ JSON 디코딩 실패: \(error)")
            return nil
        }
    }
}
