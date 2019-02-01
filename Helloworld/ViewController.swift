//
//  ViewController.swift
//  Example
//
//  Created by USER on 2018/5/22.
//  Copyright © 2018年 dd01. All rights reserved.
//

import UIKit
import DDKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBgView()
    }
    
    private func drawBgView() {
        let bgColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let contentSize = CGSize(width: view.width - 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(contentSize, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            _ = CGContext.saveGState(context)
            context.setFillColor(bgColor.cgColor)
            context.addArc(center: CGPoint(x: 20, y: 20), radius: 20, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(-Double.pi / 2), clockwise: false)
            context.fillPath()
            context.addRect(CGRect(x: 20, y: 0, width: contentSize.width - 40, height: contentSize.height))
            context.fillPath()
            context.addArc(center: CGPoint(x: contentSize.width - 150, y: 0), radius: 20, startAngle: 0, endAngle: CGFloat(-Double.pi), clockwise: false)
            context.setFillColor(UIColor.lightGray.cgColor)
            context.fillPath()
            context.addArc(center: CGPoint(x: contentSize.width - 20, y: 20), radius: 20, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(-Double.pi / 2), clockwise: true)
            context.setFillColor(bgColor.cgColor)
            context.fillPath()
            _ = CGContext.restoreGState(context)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let imageView = UIImageView(image: image)
            imageView.frame.origin = CGPoint(x: 20, y: 60)
            view.addSubview(imageView)
//            image?.draw(in: CGRect(x: 20, y: 100, width: image?.size.width ?? 0, height: image?.size.height ?? 0))
        }
    }
}
