//
//  LineSpacing+UILabel.swift
//  i-Oudio-S
//
//  Created by 윤예지 on 2021/05/17.
//

import Foundation
import UIKit

extension UILabel {
    func setLineSpace(spacing: CGFloat) {
        if let text = self.text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = spacing
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, attributeString.length))
            
            self.attributedText = attributeString
        }
        
    }
}
