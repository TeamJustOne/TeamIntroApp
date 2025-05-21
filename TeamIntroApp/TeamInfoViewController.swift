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
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "팀 정보"
        
        /* Image View */
        imageView.image = UIImage(named:"TeamInfo")
        imageView.contentMode = .scaleAspectFill
        
        /* Scroll View */
        addRTFTextView(filename: "TeamInfo")
        
        // Do any additional setup after loading the view.
    }
    
    private func addRTFTextView(filename: String) {
        guard let styledText = loadStyledAttributedString(from: filename) else { return }
        
        textView.attributedText = styledText
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
    }
    
    private func loadStyledAttributedString(from filename: String) -> NSAttributedString? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "rtf"),
              let data = try? Data(contentsOf: url),
              let attributedString = try? NSAttributedString(data: data, options: [:], documentAttributes: nil) else {
            print("RTF 로딩 실패")
            
            return nil
        }
        
        let mutableAttr = NSMutableAttributedString(attributedString: attributedString)
        mutableAttr.enumerateAttribute(.paragraphStyle, in: NSRange(location: 0, length: mutableAttr.length)) { value, range, _ in
            let style = (value as? NSMutableParagraphStyle) ?? NSMutableParagraphStyle()
            style.firstLineHeadIndent = 0
            style.headIndent = 20
            style.lineSpacing = 4
            mutableAttr.addAttribute(.paragraphStyle, value: style, range: range)
        }
        return mutableAttr
    }
    
}
