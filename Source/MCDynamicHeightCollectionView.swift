//
//  MCDynamicHeightCollectionView.swift
//  CampcotCollectionView
//
//  Created by Mussa Charles on 2021/02/21.
//  Copyright © 2021 Touchlane LLC. All rights reserved.
//

import Foundation
import Foundation

/* Credits: -
 1. https://medium.com/free-code-camp/how-to-make-height-collection-views-dynamic-in-your-ios-apps-7d6ca94d2212

 2. https://stackoverflow.com/a/59275675/7551807
*/

/// Goal is to make use of the existing library but for a very special use case. I needed the headers feature but fixed height collection view which resizes itself based on the size of it's contents.
/// This collection view will invalidate the intrinsicContentSize and will use the actual contentSize of collectionView. Works perfectly even for custom layouts.
 public class MCDynamicHeightCollectionView:UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        isScrollEnabled = false
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize){
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return contentSize
    }
    
    public override func reloadData() {
        super.reloadData()
        self.layoutIfNeeded()
    }
}
