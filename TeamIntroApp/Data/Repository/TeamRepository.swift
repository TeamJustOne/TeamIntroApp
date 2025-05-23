import Foundation
import UIKit

protocol TeamRepository {
    func loadStyledAttributedString() throws -> NSAttributedString
}

final class TeamRepositoryImpl: TeamRepository {
    private let rtfFileName = "TeamInfo"
    
    func loadStyledAttributedString() throws -> NSAttributedString {
        guard let url = Bundle.main.url(forResource: rtfFileName, withExtension: "rtf"),
              let data = try? Data(contentsOf: url),
              let attributedString = try? NSAttributedString(data: data, options: [:], documentAttributes: nil) else {
            print("RTF 로딩 실패")
            
            throw RepositoryError.unowned
        }
        
        let mutableAttr = NSMutableAttributedString(attributedString: attributedString)
        mutableAttr.enumerateAttribute(.paragraphStyle, in: NSRange(location: 0, length: mutableAttr.length)) { value, range, _ in
            let style = (value as? NSMutableParagraphStyle) ?? NSMutableParagraphStyle()
            
            style.firstLineHeadIndent = 0   // 첫 줄은 그대로
            style.headIndent = 14           // 자동 줄바꿈 줄 들여쓰기
            style.lineSpacing = 4
            
            // \t 탭 폭 설정
            let tab = NSTextTab(textAlignment: .left, location: 14, options: [:])
            style.tabStops = [tab]
            style.defaultTabInterval = 14

            mutableAttr.addAttribute(.paragraphStyle, value: style, range: range)
        }
        return mutableAttr
    }
}
