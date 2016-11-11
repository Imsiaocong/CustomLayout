//
//  DetailView.swift
//  CustomLayout
//
//  Created by Di Wang on 2016/11/11.
//  Copyright © 2016年 Di Wang. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    let headBarHeight = 200

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
