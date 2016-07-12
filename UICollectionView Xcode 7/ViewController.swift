//
//  ViewController.swift
//  UICollectionView Xcode 7
//
//  Created by PJ Vea on 7/1/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let appleProducts = ["豆乳パスタ", "塩味パスタ", "クリームうどん", "豆乳坦々そうめん"]
    let imageArray = [UIImage(named: "dely1"), UIImage(named: "dely2"), UIImage(named: "dely3"), UIImage(named: "dely4")]
    let urllink = ["1cd2992a-d133-4ead-9960-8dc82027f51a", "e8d49666-fa98-45fb-b177-9d0f1244be31", "7278403c-24b2-4854-890e-5fe5cc735aee", "8e21512f-9003-4bb0-9f8a-fc74a3af0d52"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // ヘッダーnib登録
        let nib:UINib = UINib(nibName: "TopHeader", bundle: nil)
        idontknow.registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "MyHeader")
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var header:MyCollectionReusableView? = nil
        
        if (kind == UICollectionElementKindSectionHeader) {
            
            header = self.idontknow.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "MyHeader", forIndexPath: indexPath) as? MyCollectionReusableView
            
            switch(indexPath.section){
            case 0:
                return header!
            default:
                header?.headerLabel.text = "セクション名"
                return header!
            }
        }else{
            return header!
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        switch(section){
        case 0:
            return CGSize(width: 0, height: 0)
        default:
            return CGSize(width: self.view.bounds.width, height: 20)
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.appleProducts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        cell.titleLabel?.text = self.appleProducts[indexPath.row]
                
        return cell
        
    }

    
}

