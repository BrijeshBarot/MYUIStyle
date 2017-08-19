//
//  UIStyle.swift
//  HSP
//
//  Created by Keyur Ashra on 10/04/17.
//  Copyright © 2017 Riontech. All rights reserved.
//

import UIKit

class UIStyle: NSObject {
    
    static func setButtonStyleRounded(view: UIView) {
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
    }
    
    static func setCornerRadius(view: UIView, radius: CGFloat, borderColor: String) {
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        view.layer.borderColor = hexStringToUIColor(hex: borderColor, alpha: 1.0).cgColor
        view.layer.borderWidth = 0.5
    }
    
    static func setButtonStyleDefault(view: UIView, backgroundColor: String, borderColor: String) {
        let cornerRadius:CGFloat = 3.0
        let borderWidth:CGFloat = 0.5
        view.backgroundColor = hexStringToUIColor(hex: backgroundColor, alpha: 1.0)
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
        view.layer.borderColor = hexStringToUIColor(hex: borderColor, alpha: 0.0).cgColor
        view.layer.borderWidth = borderWidth
    }
    
    static func setButtonStyleCustom(view: UIView,cornerRadius: CGFloat,boderColor: String,borderWidth: CGFloat) {
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
        view.layer.borderColor = hexStringToUIColor(hex: boderColor, alpha: 1.0).cgColor
        view.layer.borderWidth = borderWidth
    }
    
    static func setTextFieldStyleDefault(textfield: UITextField) {
        textfield.layer.borderColor = UIColor.clear.cgColor
    }
    
    static func setTextFieldStyleDefaultWhite(textfield: UITextField) {
        textfield.isUserInteractionEnabled = false
        textfield.layer.borderColor = UIColor.white.cgColor
        
    }
    
    static func setTextFeildBottomBorder(textfield: UITextField){
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: textfield.frame.size.height - width, width:  textfield.frame.size.width, height: textfield.frame.size.height)
        border.borderWidth = width
        textfield.layer.addSublayer(border)
        textfield.layer.masksToBounds = true
    }
    
    static func setTextFieldCreateMember(_ textfield: UITextField){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textfield.frame.size.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = .always
        textfield.borders(for: [.bottom])
    }
    
    static func setTextFieldLeftPaddingPoints(_ textfield: UITextField){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textfield.frame.size.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = .always
    }
    
    static func setTextFieldRightPaddingPoints(_ textfield: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textfield.frame.size.height))
        textfield.rightView = paddingView
        textfield.rightViewMode = .always
    }
    
    static func showEmptyView(message:String, viewController: UIViewController) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: viewController.view.bounds.size.width, height: viewController.view.bounds.size.height))
        
        messageLabel.text = message
        let bubbleColor = UIColor(red: CGFloat(57)/255, green: CGFloat(81)/255, blue: CGFloat(104)/255, alpha :1)
        messageLabel.textColor = bubbleColor
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "Nunito-Regular", size: 15)
        messageLabel.sizeToFit()
        viewController.view = messageLabel
    }
    
    static func showEmptyTableView(message:String, viewController: UITableView) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: viewController.frame.width, height: viewController.frame.height))
        messageLabel.text = message
        let bubbleColor = UIColor(red: CGFloat(57)/255, green: CGFloat(81)/255, blue: CGFloat(104)/255, alpha :1)
        
        messageLabel.textColor = bubbleColor
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "Nunito-Regular", size: 15)
        messageLabel.sizeToFit()
        
        viewController.tableFooterView = UIView()
        viewController.backgroundView = messageLabel;
        viewController.separatorStyle = .none;
        viewController.reloadData()
    }
    
    
    
    // MARK: - Draw Bottom Line
    static func drawBottomLine(optionView:UIView)->UIView{
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: optionView.frame.height-1, width: optionView.frame.width, height: 0.7)
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
        optionView.layer.addSublayer(bottomBorder)
        return optionView;
    }
    
    //SetShadow
    static func setShadow(view: UIView) {
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.0
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 2.0
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 1.0
    }
    
    //Adjust TextViewHeight
    static func adjustUITextViewHeight(arg : UITextView) {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    static func setUITextViewBorder(textView : UITextView) {
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 5.0
    }
    
    //UIViewAnimation
    static func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: { _ in
            view.isHidden = hidden
        }, completion: nil)
    }
    
    //FlipViews
    static func flipViews(fromView: UIView, toView: UIView,mainView: UIViewController) {
        
        toView.frame.origin.y = 0
        mainView.view.isUserInteractionEnabled = false
        UIView.transition(from: fromView, to: toView, duration: 0.5, options: .transitionFlipFromLeft, completion: { finished in
            
            fromView.frame.origin.y = -900
            
            mainView.view.isUserInteractionEnabled = true
        })
    }
    
    //SetPlaceHolderColor
    static func setPlaceholderColor(textField: UITextField, placeholderText: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSForegroundColorAttributeName: UIColor.red])
    }
    
    static func hexStringToUIColor (hex:String,alpha:Double) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
}

extension UIView {
    func borders(for edges:[UIRectEdge], width:CGFloat = 0.6, color: UIColor = UIColor.lightGray) {
        
        if edges.contains(.all) {
            layer.borderWidth = width
            layer.borderColor = color.cgColor
        } else {
            let allSpecificBorders:[UIRectEdge] = [.top, .bottom, .left, .right]
            for edge in allSpecificBorders {
                if let v = viewWithTag(Int(edge.rawValue)) {
                    v.removeFromSuperview()
                }
                
                if edges.contains(edge) {
                    let v = UIView()
                    v.tag = Int(edge.rawValue)
                    v.backgroundColor = color
                    v.translatesAutoresizingMaskIntoConstraints = false
                    addSubview(v)
                    var horizontalVisualFormat = "H:"
                    var verticalVisualFormat = "V:"
                    switch edge {
                    case UIRectEdge.bottom:
                        horizontalVisualFormat += "|-(0)-[v]-(0)-|"
                        verticalVisualFormat += "[v(\(width))]-(0)-|"
                    case UIRectEdge.top:
                        horizontalVisualFormat += "|-(0)-[v]-(0)-|"
                        verticalVisualFormat += "|-(0)-[v(\(width))]"
                    case UIRectEdge.left:
                        horizontalVisualFormat += "|-(0)-[v(\(width))]"
                        verticalVisualFormat += "|-(0)-[v]-(0)-|"
                    case UIRectEdge.right:
                        horizontalVisualFormat += "[v(\(width))]-(0)-|"
                        verticalVisualFormat += "|-(0)-[v]-(0)-|"
                    default:
                        break
                    }
                    
                    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalVisualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["v": v]))
                    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalVisualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["v": v]))
                }
            }
        }
    }
    
    
    func fadeIn() {
        // Move our fade out code from earlier
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

extension UITextField{
    func setPlaceHolderColor(){
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
    }
}


