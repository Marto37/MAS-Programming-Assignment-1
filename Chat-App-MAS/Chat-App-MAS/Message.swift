//
//  Message.swift
//  Chat-App-MAS
//
//  Created by Marcelo Costa on 8/31/20.
//  Copyright © 2020 Malek Amiri. All rights reserved.
//

import Foundation
import Firebase

struct Message {
    let content: String
    let sender: String
    let timestamp: Double
}

extension Message {    
    func send() {
        let ref = Database.database().reference()
        
        let value = ["content": self.content,
                     "sender": self.sender,
                     "timestamp": self.timestamp] as [String : Any]
        
        ref.child("messages").childByAutoId().setValue(value)
    }
    
    static func listen(handler: @escaping (Message) -> ()) {
        let rootRef = Database.database().reference()
        let ref = rootRef.child("messages")
        
        ref.observe(.childAdded) { snapshot in
            if let data = snapshot.value as? [String: Any],
                let content = data["content"] as? String,
                let timestamp = data["timestamp"] as? TimeInterval,
                let sender = data["sender"] as? String

            {
                let message = Message(content: content, timestamp: timestamp, sender: sender)
                handler(message)
            }
        }
    }
}
