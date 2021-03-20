# Tik-Tok-Clone

Play/pause videos automatically in UITCollectionView when an UICollectionViewCell is in focus

* Autolayout UI that is similar to tik tok
* Automatic video play when video view is visible and option to easily pause/play any video
* Mute/Unmute videos
* Videos are cached in memory and will be removed when there is memory pressure
* The scroll of UICollectionView is super smooth since video assets are downloaded on background thread and played only when assets are 
completely downloaded ensuring the main thead is never blocked
* Option to provide different bit rate for videos
* Works when the app comes again from background
