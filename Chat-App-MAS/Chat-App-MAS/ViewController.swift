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
    var name: String = "Anonymous"
    var temp: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        
        Message(content: "\(name) just joined the chat! It is \((temp - 273.15).truncate(places: 2))°C where they are.", sender: "Weather Master", timestamp: Date().timeIntervalSince1970).send()
        
        Message.listen { (message) in
            self.messages.append(message)
            self.messagesTableView.reloadData()
        }
        
        
    }

    @IBAction func sendButtonWasPressed(_ sender: Any) {
        let messageContent = messageTextView.text ?? ""
        
        if messageContent.count == 0 {
            return
        }
                
        let timestamp = Date().timeIntervalSince1970
        
        Message(content: messageContent, sender: self.name, timestamp: timestamp).send()
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

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
