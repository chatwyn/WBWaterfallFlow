//
//  HomeTableViewController.swift
//  WBWaterfallFlow
//
//  Created by caowenbo on 16/2/20.
//  Copyright © 2016年 曹文博. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
   private lazy var tests:[String] = {
        return [String(FirstCollectionViewController),String(WaterFallFlowController)]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tests.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = tests[indexPath.row]
        
        return cell
    }
    
    // MARK: - Table view Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var collectionController:UIViewController?
        
        switch indexPath.row{
            
        case 0: collectionController = FirstCollectionViewController()
        case 1: collectionController = WaterFallFlowController()
            
        default: return
            
        }
        
        self.navigationController?.pushViewController(collectionController!, animated: true)
        
        
    }
    
}


