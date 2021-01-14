//
//  XibChatCell.swift
//  messaging-app-UIKit
//
//  Created by 郭家銘 on 2021/1/14.
//

import UIKit

class XibChatCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var onlineStatusView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var unReadView: UIView!
    
    let selectedBG = UIView()
    
    var chatInfo: Chat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupSelectedBG() {
        selectedBG.backgroundColor = UIColor(named: "PrimaryColor-0.1")
        selectedBG.layer.cornerRadius = 8
        self.selectedBackgroundView = selectedBG
    }
    
    func updateView() {
        setupSelectedBG()
        guard let chatInfo = chatInfo else {
            return
        }
        avatarImageView.image = UIImage(named: chatInfo.avatarImageName)
        nameLabel.text = chatInfo.userName
        contentLabel.text = chatInfo.lastMessage.content
        timeLabel.text = chatInfo.lastMessage.timestamp
        
        if chatInfo.unReadCount > 0 {
            unReadView.isHidden = false
            (unReadView.subviews.first as! UILabel).text = String(chatInfo.unReadCount)
        } else {
            unReadView.isHidden = true
        }
        
        if chatInfo.status != .None {
            onlineStatusView.isHidden = false
            let dot = onlineStatusView.subviews.first
            switch chatInfo.status {
            case .Idle:
                dot?.backgroundColor = UIColor(named: "YellowColor")
            case .Online:
                dot?.backgroundColor = UIColor(named: "GreenColor")
            case .Offline:
                dot?.backgroundColor = .gray
            default:
                break
            }
        } else {
            onlineStatusView.isHidden = true
        }
    }

}
