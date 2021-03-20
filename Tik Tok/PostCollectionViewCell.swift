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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var songlabel: UILabel!
    @IBOutlet weak var titleHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var shareCount: UILabel!
    
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
        
        likesCount.text = nil
        commentsCount.text = nil
        shareCount.text = nil
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //videoLayer.frame = self.frame
        
        vidH.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
//        vidH.clipsToBounds = true
        vidH.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        videoLayer.backgroundColor = UIColor.clear.cgColor //UIColor.clear.cgColor
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        vidH.layer.addSublayer(videoLayer)
        
        contentView.addSubview(vidH)
        contentView.sendSubviewToBack(vidH)
    }
    
    
    func bindDtata(tok: TikToks) {
    
        viewsSizes()
        
        usernameLabel.text = "@" + tok.username
        titleLabel.text = tok.title
        songlabel.text = tok.song
        likesCount.text = tok.likes
        commentsCount.text = tok.comments
        shareCount.text = tok.shares
        
        
        if (tok.song.count > 20 || tok.song.count < 60) {
            titleHeightConstraint.constant = 38
        } else if (tok.song.count > 60 || tok.song.count < 100) {
            titleHeightConstraint.constant = 54
        } else if (tok.song.count > 100 || tok.song.count > 160) {
            titleHeightConstraint.constant = 98
        }
        
        self.videoURL = tok.video
        
    }
    
    func viewsSizes(){
        vidH.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.size.width, height: self.frame.size.height)
        videoLayer.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.size.width, height: self.frame.size.height)
    }
    
    func visibleVideoHeight() -> CGFloat {
            let videoFrameInParentSuperView: CGRect? = self.superview?.superview?.convert(vidH.frame, from: vidH)
            guard let videoFrame = videoFrameInParentSuperView,
                let superViewFrame = superview?.frame else {
                 return 0
            }
            let visibleVideoFrame = videoFrame.intersection(superViewFrame)
            return visibleVideoFrame.size.height
    }
    
}
