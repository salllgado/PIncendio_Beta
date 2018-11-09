//
//  ToastView.swift
//  CSUtils
//
//  Created by Chrystian on 30/10/18.
//

import Foundation
import UIKit

open class ToastView: UIView, NibBounded {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lbText: UILabel!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(hugsContent: true)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView(hugsContent: true)
    }
    
    open func configure(message: String) {
        lbText.text = message
        containerView.backgroundColor = .red
        containerView.cornerRadius = containerView.frame.height/2
    }
}
