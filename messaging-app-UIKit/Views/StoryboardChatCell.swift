//
//  StoryboardChatCell.swift
//  messaging-app-UIKit
//
//  Created by 郭家銘 on 2021/1/14.
//

import UIKit

class StoryboardChatCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var chatContent: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var unReadCountView: UIView!
    @IBOutlet weak var onlineStatusView: UIView!
    
    var chatInfo: Chat?
    
    let selectedBG = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        onlineStatusView.layer.cornerRadius = onlineStatusView.bounds.height/2
        let onlineStatusSubView = onlineStatusView.subviews.first!
        onlineStatusSubView.layer.cornerRadius = onlineStatusSubView.bounds.height/2
        
        selectedBG.backgroundColor = UIColor(named: "PrimaryColor-0.1")
        selectedBG.layer.cornerRadius = 8
        self.selectedBackgroundView = selectedBG
    }
    
    func updateView() {
        guard let chatInfo = chatInfo else {
            return
        }
        nameLabel.text = chatInfo.userName
        avatarImageView.image = UIImage(named: chatInfo.avatarImageName)
        chatContent.text = chatInfo.lastMessage.content
        timeLabel.text = chatInfo.lastMessage.timestamp
        if chatInfo.unReadCount > 0 {
            unReadCountView.isHidden = false
            (unReadCountView.subviews.first as! UILabel).text = String(chatInfo.unReadCount)
        } else {
            unReadCountView.isHidden = true
        }
        
        // online status
        guard chatInfo.status != .None else {
            onlineStatusView.isHidden = true
            return
        }
        onlineStatusView.isHidden = false
        let onlineStatusSubView = onlineStatusView.subviews.first!
        switch chatInfo.status {
        case .Idle:
            onlineStatusSubView.backgroundColor = UIColor(named: "YellowColor")
        case .Offline:
            onlineStatusSubView.backgroundColor = .gray
        case .Online:
            onlineStatusSubView.backgroundColor = UIColor(named: "GreenColor")
        default:
            break
        }
    }

}
