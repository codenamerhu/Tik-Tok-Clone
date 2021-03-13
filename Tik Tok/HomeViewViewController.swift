//
//  HomeViewViewController.swift
//  Tik Tok
//
//  Created by Rhulani Ndhlovu on 2021/02/18.
//  Copyright © 2021 Codenamerhu. All rights reserved.
//

import UIKit

class HomeViewViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var localFilesViewModel = LocalFilesViewModel()
    
    var tiktokAr = [TikToks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        localFilesViewModel.readJsonFile() { (toks, error) in
           
            
            for t in toks!.toks {
                self.tiktokAr.append(t)
            }
            
             self.collectionView.reloadData()
        }
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        self.collectionView.isPagingEnabled = true

    }
    /*
    func snapToNearestCell(scrollView: UIScrollView) {
         let middlePoint = Int(scrollView.contentOffset.x + UIScreen.main.bounds.width / 2)
         if let indexPath = self.collectionView.indexPathForItem(at: CGPoint(x: middlePoint, y: 0)) {
              self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
         }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.snapToNearestCell(scrollView: scrollView)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.snapToNearestCell(scrollView: scrollView)
    } */

}

extension HomeViewViewController : UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let itemWidth = view.bounds.width
            let itemHeight = view.bounds.height //+ 40
            return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension HomeViewViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        localFilesViewModel.numberOfItemsInCollection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "post", for: indexPath) as! PostCollectionViewCell
        
        cell.bindDtata(tok: tiktokAr[indexPath.row])
        
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
}

extension HomeViewViewController : UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
        {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
