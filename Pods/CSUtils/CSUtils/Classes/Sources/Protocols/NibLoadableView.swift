//
//  NibLoadableView.swift
//  CSUtils
//
//  Created by Chrystian on 30/10/18.
//

import Foundation
import UIKit

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    public static var nibName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
