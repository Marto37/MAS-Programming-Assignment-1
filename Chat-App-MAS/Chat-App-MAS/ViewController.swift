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
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        
        let message = Message.listen { (message) in
            messages.append(message)
            messagesTableView.reloadData()
        }

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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? MessageCell else {
            return UITableViewCell()
        }
        
        cell.populateMessage(message: messages[indexPath.row])
        
        return cell
    }
    
    
}

