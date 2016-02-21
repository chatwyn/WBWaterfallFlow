//
//  WaterFallFlowController.swift
//  WBWaterfallFlow
//
//  Created by caowenbo on 16/2/20.
//  Copyright © 2016年 曹文博. All rights reserved.
//

import UIKit

class WaterFallFlowController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(collectionView)
        
    }
    
    
    // MARK: - lazy loading
    private lazy var collectionView:UICollectionView = {
        
        let layout = WaterFallFlowLayout()
        layout.delegate = self
        let collectionView = UICollectionView.init(frame: UIScreen.mainScreen().bounds, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: String(UICollectionViewCell))
        
        return collectionView
    }()
    
    private lazy var items:[Square] = {
        return Square.squares()
    }()
    
    
}

// MARK: - UICollectionViewDataSource
extension WaterFallFlowController:UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(UICollectionViewCell), forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        
        var label =  cell.viewWithTag(10) as? UILabel
        
        if label == nil {
            label = UILabel()
            label?.tag = 10
            cell.contentView.addSubview(label!)
        }
        
        label!.text = String(indexPath.item)
        label!.sizeToFit()
        
        return cell
    }
}

// MARK: - WaterFallFlowLayoutDelegate
extension WaterFallFlowController:WaterFallFlowLayoutDelegate{
    
    func waterflowLayout(waterFallFlowLayout: WaterFallFlowLayout, heigtForItemAtIndex: Int, itemWidth: CGFloat) -> CGFloat {
        
        let item = items[heigtForItemAtIndex]
        let height = itemWidth * item.h / item.w
        
        return height
    }
    
}


