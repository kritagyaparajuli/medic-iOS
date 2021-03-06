//
//  Extensions.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//

import Foundation
import UIKit
extension UIViewController{
    func customAlerView(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
}
extension UILabel{
    func isRegularLabel(text: String, fontSize: CGFloat, bold: Bool, color: UIColor){
        self.text = text
        self.textColor = color
        if (bold){
            self.font = UIFont(name: "Montserrat-Bold", size: fontSize)
        }else{
            self.font = UIFont(name: "Montserrat-Regular", size: fontSize)
        }
    }
}
extension UITextField {
    func isLoginTextField(placeholder: String){
        self.layer.borderColor =  UIColor(red: 209/255.0, green: 209/255.0, blue: 209/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 27.5
        self.heightAnchor.constraint(equalToConstant: 55.0).isActive = true
        self.placeholder = placeholder
        self.font = UIFont(name: "Inter", size: 14)
        self.backgroundColor = UIColor.systemBackground
        self.layer.masksToBounds = true
        //padding view
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.frame.size.height))
        self.leftView = paddingView
        leftViewMode = .always
        
    }
    func isPrimaryTextField(placeholder: String){
        self.layer.borderColor =  UIColor(red: 209/255.0, green: 209/255.0, blue: 209/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        self.placeholder = placeholder
        self.font = UIFont(name: "Inter", size: 14)
        self.backgroundColor = UIColor.systemBackground
        self.layer.masksToBounds = true
        //padding view
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.frame.size.height))
        self.leftView = paddingView
        leftViewMode = .always
        
    }
}
extension UIButton{
    func isPrimaryButton(title: String){
        self.layer.cornerRadius = 27.5
        self.setTitle(title, for: [])
        self.backgroundColor = UIColor(named: "PrimaryColor")
        self.heightAnchor.constraint(equalToConstant: 55.0).isActive = true
        self.setTitleColor(.white, for: [])
    }
    
    func isAddToCartButton(title: String){
        self.layer.cornerRadius = 14
        self.setTitle(title, for: [])
        self.backgroundColor = UIColor(named: "PrimaryColor")
        self.heightAnchor.constraint(equalToConstant: 28.0).isActive = true
        self.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        self.setTitleColor(.white, for: [])
        self.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 10)
        
    }
}






