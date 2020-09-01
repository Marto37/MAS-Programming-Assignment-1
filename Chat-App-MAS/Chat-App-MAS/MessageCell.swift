//
//  MessageCell.swift
//  Chat-App-MAS
//
//  Created by Malek Amiri on 9/1/20.
//  Copyright © 2020 Malek Amiri. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateMessage(message: Message) {
        senderLabel.text = message.sender
        contentLabel.text = message.content
        
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy hh:mm"
        let now = df.string(from: Date(timeIntervalSince1970: message.timestamp))
        timestampLabel.text = now
    }

}
