//
//  ViewController.swift
//  Chat-App-MAS
//
//  Created by Malek Amiri on 8/31/20.
//  Copyright © 2020 Malek Amiri. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var messageTextView: UITextField!
    
    @IBOutlet weak var messagesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendButtonWasPressed(_ sender: Any) {
        let messageContent = messageTextView.text ?? ""
        
        if messageContent.count == 0 {
            return
        }
        
        let name = "Marcelo"
        
        let timestamp = Date().timeIntervalSince1970
        
        Message(content: messageContent, sender: name, timestamp: timestamp).send()
    }
    
}

