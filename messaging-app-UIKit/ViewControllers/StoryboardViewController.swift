//
//  StoryboardViewController.swift
//  messaging-app-UIKit
//
//  Created by 郭家銘 on 2021/1/14.
//

import UIKit

class StoryboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        footerView.layer.shadowOffset = CGSize(width: 0, height: -8)
        footerView.layer.shadowRadius = 32
        footerView.layer.shadowColor = UIColor(named: "DeepColor")?.cgColor
        footerView.layer.shadowOpacity = 0.1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryboardChatCell", for: indexPath) as! StoryboardChatCell
        cell.chatInfo = chats[indexPath.row]
        cell.updateView()
    
        return cell
    }

}
