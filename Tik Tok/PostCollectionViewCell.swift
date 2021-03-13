//
//  PostCollectionViewCell.swift
//  Tik Tok
//
//  Created by Rhulani Ndhlovu on 2021/02/18.
//  Copyright © 2021 Codenamerhu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer
import AudioToolbox

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var songlabel: UILabel!
    
    var player = AVPlayer()
    
    override func prepareForReuse() {
        usernameLabel.text = nil
        titleLabel.text = nil
        songlabel.text = nil
    }
    
    func bindDtata(tok: TikToks) {
        usernameLabel.text = "@" + tok.username
        titleLabel.text = tok.title
        songlabel.text = tok.song
        
        let vidH = UIView()
        vidH.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.size.width, height: self.contentView.bounds.size.height)
        //vidH.backgroundColor = .cyan
        
        contentView.addSubview(vidH)
        contentView.sendSubviewToBack(vidH)
        
        
        let playerItem = AVPlayerItem(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
        
        self.player = AVPlayer(playerItem: playerItem)
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = vidH.bounds
        layer.videoGravity = .resizeAspectFill
        vidH.layer.addSublayer(layer)
        player.volume = 0
        player.play()
        
    }
}
