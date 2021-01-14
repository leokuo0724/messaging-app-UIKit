//
//  StoryboardViewController.swift
//  messaging-app-UIKit
//
//  Created by 郭家銘 on 2021/1/14.
//

import UIKit

class StoryboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(self.view.bounds.width)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryboardChatCell", for: indexPath) as! StoryboardChatCell
    
        return cell
    }

}
