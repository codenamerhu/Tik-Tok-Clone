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

class PostCollectionViewCell: UICollectionViewCell, ASAutoPlayVideoLayerContainer  {
    func visibleVideoHeight() -> CGFloat {
        let videoFrameInParentSuperView: CGRect? = self.superview?.superview?.convert(contentView.frame, from: contentView)
        guard let videoFrame = videoFrameInParentSuperView,
            let superViewFrame = superview?.frame else {
             return 0
        }
        let visibleVideoFrame = videoFrame.intersection(superViewFrame)
        return visibleVideoFrame.size.height
    }
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var songlabel: UILabel!
    let vidH = UIView()
    
    var player: AVPlayer?
    
    var playerController: ASVideoPlayerController?
    var videoLayer: AVPlayerLayer = AVPlayerLayer()
    var videoURL: String? {
        didSet {
            if let videoURL = videoURL {
                ASVideoPlayerController.sharedVideoPlayer.setupVideoFor(url: videoURL)
            }
            videoLayer.isHidden = videoURL == nil
        }
    }
    
    override func prepareForReuse() {
        usernameLabel.text = nil
        titleLabel.text = nil
        songlabel.text = nil
        player?.pause()
        player = nil
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vidH.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.size.width, height: self.contentView.bounds.size.height)
        videoLayer.frame = CGRect(x: 0, y: 0, width: self.vidH.bounds.size.width, height: self.vidH.bounds.size.height)
        
        vidH.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
        vidH.clipsToBounds = true
        vidH.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        videoLayer.backgroundColor = UIColor.clear.cgColor
//        videoLayer.videoGravity = .resizeAspectFill
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoLayer.frame = vidH.bounds
        vidH.layer.addSublayer(videoLayer)
        
        contentView.addSubview(vidH)
        contentView.sendSubviewToBack(vidH)
        //selectionStyle = .none
    }
    
    
    func bindDtata(tok: TikToks) {
        usernameLabel.text = "@" + tok.username
        titleLabel.text = tok.title
        songlabel.text = tok.song
        
        player = AVPlayer()
        
        
        
        //vidH.backgroundColor = .cyan
        
        
        
        
        let playerItem = AVPlayerItem(url: URL(string: "https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4")!)
//
        self.player = AVPlayer(playerItem: playerItem)
        

        //let layer = AVPlayerLayer(player: player)
        //layer.frame = vidH.bounds
        
        self.videoURL = tok.video //"https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4"
//        videoLayer.videoGravity = .resizeAspectFill
//        vidH.layer.addSublayer(videoLayer)
        //vidH.layer.addSublayer(layer)
        //player.volume = 0
        //player?.play()
        
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let horizontalMargin: CGFloat = 20
//        let width: CGFloat = bounds.size.width - horizontalMargin * 2
//        let height: CGFloat = (width * 0.9).rounded(.up)
//        videoLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
//    }
    
    
    func playVid(){
        player?.play()
        print("v: pplay")
    }
    
    func pauseVid(){
        player?.pause()
        print("v: ppause")
    }
}
