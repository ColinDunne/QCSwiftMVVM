//
//  UIButton+Extension.swift
//  QCSwiftMVVM
//
//  Created by Qian Chen on 2019/8/11.
//  Copyright © 2019 Qian Chen. All rights reserved.
//

import UIKit

extension UIButton {

    /**
     *
     */
    convenience init(qc_imageName: String, backImageName: String?) {
        self.init()
        
        setImage(UIImage(named: qc_imageName), for: .normal)
        setImage(UIImage(named: qc_imageName + "_highlighted"), for: .highlighted)
        
        if let backImageName = backImageName {
            setBackgroundImage(UIImage(named: backImageName), for: .normal)
            setBackgroundImage(UIImage(named: backImageName + "_highlighted"), for: .highlighted)
        }
        
        sizeToFit()
    }

}
