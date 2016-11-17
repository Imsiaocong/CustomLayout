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
    var barHeight: CGFloat = 200.0
    var textField: DetailView!
    var getColor: Float!
    
    fileprivate var viewRect: CGRect!
    fileprivate var cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewRect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        self.collectionView = UICollectionView(frame: viewRect, collectionViewLayout: FlowLayout())
        self.collectionView.backgroundColor = UIColor(colorLiteralRed: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.view.addSubview(collectionView)
        self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        
        drawDetailView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawDetailView() {
        self.textField = DetailView(frame: CGRect(x: 0, y: barHeight, width: self.view.frame.size.width, height: self.view.frame.size.height - barHeight))
        self.textField.textDetail = "Detailssss!"
        self.textField.detailText.backgroundColor = UIColor(colorLiteralRed: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.addSubview(textField)
    }


}



extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
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
        print(cell.frame.origin.x)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Statements below:
        print(scrollView.contentOffset.x)
        
        let position_x: Float = Float(scrollView.contentOffset.x)
        let redElement: Float = position_x / 850.0
        
        if position_x >= 0.0 && position_x < 170.0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.textField.detailText.backgroundColor = UIColor(colorLiteralRed: redElement, green: 1.0, blue: 1.0, alpha: 1.0)
            })
        }
        if position_x >= 170.0 && position_x < 340.0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.textField.detailText.backgroundColor = UIColor(colorLiteralRed: redElement, green: 1.0, blue: 1.0, alpha: 1.0)
            })
        }
        if position_x >= 340.0 && position_x < 510.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.textField.detailText.backgroundColor = UIColor(colorLiteralRed: redElement, green: 1.0, blue: 1.0, alpha: 1.0)
            })
        }
        if position_x >= 510.0 && position_x < 680.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.textField.detailText.backgroundColor = UIColor(colorLiteralRed: redElement, green: 1.0, blue: 1.0, alpha: 1.0)
            })
        }
        if position_x >= 680.0 && position_x < 850.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.textField.detailText.backgroundColor = UIColor(colorLiteralRed: redElement, green: 1.0, blue: 1.0, alpha: 1.0)
            })
        }
        if position_x >= 850.0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.textField.detailText.backgroundColor = UIColor(colorLiteralRed: redElement, green: 1.0, blue: 1.0, alpha: 1.0)
            })
        }
        
        self.collectionView.backgroundColor = UIColor(colorLiteralRed: redElement, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
}



