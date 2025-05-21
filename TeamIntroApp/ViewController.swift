//
//  ViewController.swift
//  TeamIntroApp
//
//  Created by estelle on 5/20/25.
//

import UIKit

struct Member: Codable {
    let imageName: String
    let name: String
    let MBTI: String
    let pros: [String]
    let ownStyle: [String]
    let blogURL: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func blogButtonTapped(_ sender: UIButton) {
        let memberListVC = TempForBlogMemberListViewController()
        self.navigationController?.pushViewController(memberListVC, animated: true)
    }
            super.viewDidLoad()

            if let members = loadMembers() {
                print("✅ JSON 로드 성공!")

                for member in members {
                    print("🔹 이름: \(member.name)")
                    print("   MBTI: \(member.MBTI)")
                    print("   장점(pros): \(member.pros.joined(separator: ", "))")
                    print("   스타일(ownStyle): \(member.ownStyle.joined(separator: ", "))")
                    print("   블로그 주소: \(member.blogURL)")
                    print("   이미지 이름: \(member.imageName)")
                    print("------------------------------------")
                }

            } else {
                print("❌ JSON 로드 실패")
            }
        }


    func loadMembers() -> [Member]? {
        guard let url = Bundle.main.url(forResource: "members", withExtension: "json") else {
            print("⚠️ JSON 파일을 찾을 수 없습니다.")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let members = try JSONDecoder().decode([Member].self, from: data)
            return members
        } catch {
            print("⚠️ JSON 디코딩 실패: \(error)")
            return nil
        }
    }
}


