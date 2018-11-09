//
//  SwitchSettingsCell.swift
//  CSUtils
//
//  Created by Chrystian on 20/10/18.
//

import UIKit

class SwitchSettingsCell: UITableViewCell {
    
    @IBOutlet var lbCellText: UILabel!
    @IBOutlet var swOption: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(text: String) {
        self.lbCellText.text = text
    }
}
