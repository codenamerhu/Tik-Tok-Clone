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
        let videoFrameInParentSuperView: CGRect? = self.superview?.superview?.convert(vidH.frame, from: vidH)
        guard let videoFrame = videoFrameInParentSuperView,
            let superViewFrame = superview?.frame else {
             return 0
        }
        let visibleVideoFrame = videoFrame.intersection(superViewFrame)
        print("(visibleVideoFrame)")
        return visibleVideoFrame.size.height
        
//        return contentView.bounds.height
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var songlabel: UILabel!
    let vidH = UIImageView()
    
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
        vidH.imageURL = nil
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vidH.frame = self.bounds
        //videoLayer.frame = self.frame
        
        vidH.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
//        vidH.clipsToBounds = true
        vidH.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        videoLayer.backgroundColor = UIColor.red.cgColor //UIColor.clear.cgColor
//        videoLayer.videoGravity = .resizeAspectFill
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        vidH.layer.addSublayer(videoLayer)
        
        contentView.addSubview(vidH)
        contentView.sendSubviewToBack(vidH)
    }
    
    
    func bindDtata(tok: TikToks) {
        usernameLabel.text = "@" + tok.username
        titleLabel.text = tok.title
        songlabel.text = tok.song
        
        
        self.videoURL = tok.video
        videoLayer.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.size.width, height: self.frame.size.height)
        print("self \(frame.size.height) \(vidH.frame)")
//        vidH.layer.addSublayer(videoLayer)
        //vidH.layer.addSublayer(layer)
        //player.volume = 0
        
    }
    
}
