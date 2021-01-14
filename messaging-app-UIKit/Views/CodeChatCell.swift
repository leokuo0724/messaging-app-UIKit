//
//  CodeChatCell.swift
//  messaging-app-UIKit
//
//  Created by 郭家銘 on 2021/1/14.
//

import UIKit

class CodeChatCell: UITableViewCell {
    
    let avatarImageView = UIImageView()
    let onlineStatusView = UIView()
    let nameLabel = UILabel()
    let timeLabel = UILabel()
    let contentLabel = UILabel()
    let unReadView = UIView()
    
    let selectedBG = UIView()
    
    var chatInfo: Chat?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupViews() {
        self.addSubview(avatarImageView)
        self.addSubview(onlineStatusView)
        self.addSubview(nameLabel)
        self.addSubview(timeLabel)
        self.addSubview(contentLabel)
        self.addSubview(unReadView)
        setupAvatarImageView()
        setupStatusView()
        setupNameLabel()
        setupContentLabel()
        setupTimeLabel()
        setupUnReadView()
        setupSelectedBG()
        
        updateView()
    }
    
    func setupSelectedBG() {
        selectedBG.backgroundColor = UIColor(named: "PrimaryColor-0.1")
        selectedBG.layer.cornerRadius = 8
        self.selectedBackgroundView = selectedBG
    }
    
    func setupAvatarImageView() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    func setupStatusView() {
        onlineStatusView.translatesAutoresizingMaskIntoConstraints = false
        onlineStatusView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        onlineStatusView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        onlineStatusView.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 0).isActive = true
        onlineStatusView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0).isActive = true
        onlineStatusView.backgroundColor = .white
        onlineStatusView.layer.cornerRadius = 12/2
        
        let dot = UIView()
        onlineStatusView.addSubview(dot)
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.topAnchor.constraint(equalTo: onlineStatusView.topAnchor, constant: 2).isActive = true
        dot.bottomAnchor.constraint(equalTo: onlineStatusView.bottomAnchor, constant: -2).isActive = true
        dot.leadingAnchor.constraint(equalTo: onlineStatusView.leadingAnchor, constant: 2).isActive = true
        dot.trailingAnchor.constraint(equalTo: onlineStatusView.trailingAnchor, constant: -2).isActive = true
        dot.backgroundColor = .gray
        dot.layer.cornerRadius = 10/2
    }
    func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 212).isActive = true
        nameLabel.font = UIFont(name: "PlusJakartaSans-Medium", size: 14)
        nameLabel.textColor = UIColor(named: "DeepColor")
    }
    func setupContentLabel() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        contentLabel.widthAnchor.constraint(equalToConstant: 212).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        contentLabel.font = UIFont(name: "PlusJakartaSans-Regular", size: 12)
        contentLabel.textColor = UIColor(named: "GrayColor")
    }
    func setupTimeLabel() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        timeLabel.font = UIFont(name: "PlusJakartaSans-Regular", size: 12)
        timeLabel.textColor = UIColor(named: "GrayColor")
        timeLabel.textAlignment = .right
    }
    func setupUnReadView() {
        unReadView.translatesAutoresizingMaskIntoConstraints = false
        unReadView.centerYAnchor.constraint(equalTo: contentLabel.centerYAnchor).isActive = true
        unReadView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        unReadView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        unReadView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        unReadView.layer.cornerRadius = 24/2
        unReadView.backgroundColor = UIColor(named: "PrimaryColor")
        
        // counts
        let countLabel = UILabel()
        unReadView.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerXAnchor.constraint(equalTo: unReadView.centerXAnchor).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: unReadView.centerYAnchor).isActive = true
        countLabel.font = UIFont(name: "PlusJakartaSans-Bold", size: 12)
        countLabel.textColor = .white
    }
    
    func updateView() {
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
