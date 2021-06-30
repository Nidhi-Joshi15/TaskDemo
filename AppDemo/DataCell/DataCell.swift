//
//  DataCell.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 29/06/2021.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblDetail: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(data: DataModelProtocol?) {
        lblTitle?.text = data?.dataTitle
        lblDetail?.text = data?.dataDetail
    }
    
}
