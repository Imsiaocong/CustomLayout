//
//  ViewController.swift
//  CustomLayout
//
//  Created by Di Wang on 2016/11/10.
//  Copyright © 2016年 Di Wang. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    var detailView: DetailView!
    fileprivate var viewRect: CGRect!
    fileprivate var cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.detailView = DetailView()
        
        self.viewRect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        self.collectionView = UICollectionView(frame: viewRect, collectionViewLayout: FlowLayout())
        self.collectionView.backgroundColor = UIColor.black
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        self.view.addSubview(detailView)
        self.view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 50
        cell.photos.image = UIImage(named: "0")
        return cell
    }
}

extension CollectionViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCollectionViewCell
        print("\(cell.frame.origin.x + (cell.frame.size.width / 2))" + " \(collectionView.center.x)")
    }
}



