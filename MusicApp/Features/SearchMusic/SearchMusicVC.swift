//
//  SearchMusicVC.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 18/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "searchMusicCell"

class SearchMusicVC: UICollectionViewController {

    @IBOutlet weak var searchingMusicText: UITextField!
    
    private var viewModel = SearchMusicVM()
    var searchTerm = "Jack"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = collectionView!.frame.width / 2
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        // Sticky Headers
        layout.sectionHeadersPinToVisibleBounds = true
        
        searchMusicAPICall()
    }
    
    
    func searchMusicAPICall() {
        
        if searchTerm == "Jack" {
            
            SVProgressHUD.show()
            
            viewModel.searchMusic(with: searchTerm) { (isSuccess) in
                if isSuccess {
                    print("Success")
                }
            }
        }
        
    }
}


extension SearchMusicVC {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
    return cell
  }
   
}
