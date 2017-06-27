//
//  ChatViewController.swift
//  parse_demo_01
//
//  Created by Charles Hieger on 6/26/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource {

   var chatMessages: [PFObject] = []

   @IBOutlet weak var chatMessageField: UITextField!

   @IBOutlet weak var tableView: UITableView!

   

   override func viewDidLoad() {
      super.viewDidLoad()

      tableView.dataSource = self

      // Auto size row height
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 50

      tableView.separatorStyle = .none
      fetchMessages()
      Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)

   }

   func fetchMessages() {
      let query = PFQuery(className: "Message_fbu2017")
      query.addDescendingOrder("createdAt")
      query.includeKey("user")
      query.findObjectsInBackground { (chatMessages: [PFObject]?, error: Error?) in
         if let error = error {
            print("Error fetching: \(error.localizedDescription) ")
         } else if let chatMessages = chatMessages {
            self.chatMessages = chatMessages
            self.tableView.reloadData()
         }
      }
   }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return chatMessages.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
      let chatMessage = chatMessages[indexPath.row]
      if let user = chatMessage["user"] as? PFUser {
         // User found! update username label with username
         cell.usernameLabel.text = user.username
      } else {
         // No user found, set default username
         cell.usernameLabel.text = "🤖"
      }
      cell.chatTextLabel.text = chatMessage["text"] as? String
      return cell
   }

   func onTimer() {
      print("fetching chat messages")
      fetchMessages()
   }

   @IBAction func didTapSend(_ sender: Any) {

      let chatMessage = PFObject(className: "Message_fbu2017")
      chatMessage["text"] = chatMessageField.text ?? ""
      chatMessage["user"] = PFUser.current()
      chatMessage.saveInBackground { (success, error) in
         if success {
            self.chatMessageField.text = ""
            print("The message was saved!")
         } else if let error = error {
            print("Problem saving message: \(error.localizedDescription)")
         }
      }

   }


   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
   
}
