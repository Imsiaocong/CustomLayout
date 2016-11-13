//
//  DetailView.swift
//  CustomLayout
//
//  Created by Di Wang on 2016/11/12.
//  Copyright © 2016年 Di Wang. All rights reserved.
//

import UIKit

@IBDesignable class DetailView: UIView {

    var view: UIView!
    
    @IBOutlet weak var detailText: UITextView!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var textDetail: String {
        get {
            return detailText.text
        }
        set (newValue) {
            return detailText.text = newValue
        }
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DetailView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view);
    }

}
