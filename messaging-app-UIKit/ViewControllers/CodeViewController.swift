//
//  CodeViewController.swift
//  messaging-app-UIKit
//
//  Created by 郭家銘 on 2021/1/14.
//

import UIKit

class CodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var sortButtonStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        footerView.layer.shadowOffset = CGSize(width: 0, height: -8)
        footerView.layer.shadowRadius = 32
        footerView.layer.shadowColor = UIColor(named: "DeepColor")?.cgColor
        footerView.layer.shadowOpacity = 0.1
        
        // tableview
        let tableView = UITableView()
        self.view.insertSubview(tableView, at: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: sortButtonStackView.bottomAnchor, constant: 24).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.register(CodeChatCell.self, forCellReuseIdentifier: "CodeChatCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CodeChatCell", for: indexPath) as! CodeChatCell
        cell.chatInfo = chats[indexPath.row]
        cell.setupViews()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    

}
