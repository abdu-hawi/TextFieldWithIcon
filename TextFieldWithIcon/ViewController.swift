//
//  ViewController.swift
//  TextFieldWithIcon
//
//  Created by Abdu macOS 15 on 19/01/1442 AH.
//  Copyright © 1442 Abdu macOS 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myTextField:UITextField!
    
    var cameraBtn:UIButton!
    var stackView:UIStackView!
    var isShowNewPrice = true
    var sendBtn:UIButton!
    var isShowSendBtn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTextField.delegate = self
        myTextField.tintColor = #colorLiteral(red: 0.7529411765, green: 0.6470588235, blue: 0.2705882353, alpha: 1)
        myTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myTextField.leftViewMode = .always
        cameraBtn = UIButton(frame: CGRect(x: 20, y: 0, width: 50, height: 50))
        cameraBtn.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        cameraBtn.addTarget(self, action: #selector(cameraBtnClick), for: .touchUpInside)
        myTextField.leftView = cameraBtn
        showNewPrice()
    }
    
    @objc func cameraBtnClick(){
        print("camera click")
    }
    
    @objc func newPriceBtnClick(){
        print("newPriceBtnClick")
    }
    
    @objc func sendBtnClick(){
        print("sendBtnClick")
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text!.isEmpty || textField.text!.count < 1{
            print("isEmpty")
            if isShowNewPrice{
                showNewPrice()
            }
        }else{
            if isShowSendBtn {
                showSentBtn()
            }
        }
    }
    
    
    func showSentBtn(){
        if stackView != nil {
            stackView.removeFromSuperview()
        }
        isShowNewPrice = true
        isShowSendBtn = false
        sendBtn = UIButton(frame: CGRect(x: 0, y: myView.frame.height/2 - 50/2, width: 50, height: 50))
        sendBtn.setImage(UIImage(named: "ic_send"), for: .normal)
        sendBtn.addTarget(self, action: #selector(sendBtnClick), for: .touchUpInside)
        myView.addSubview(sendBtn)
        myTextField.frame = CGRect(x: sendBtn.frame.width + 4, y: myView.frame.height/2 - 55/2, width: myView.frame.width - 14 - sendBtn.frame.width, height: 55)
    }
    
    func showNewPrice() {
        if sendBtn != nil {
            sendBtn.removeFromSuperview()
        }
        isShowNewPrice = false
        isShowSendBtn = true
        let newPriceLabel = UILabel()
        newPriceLabel.text = "New price offer"
        newPriceLabel.textAlignment = .center
        newPriceLabel.font = UIFont.systemFont(ofSize: 10)
        newPriceLabel.textColor = #colorLiteral(red: 0.7529411765, green: 0.6470588235, blue: 0.2705882353, alpha: 1)
        newPriceLabel.frame = CGRect(x: 0, y: 0, width: newPriceLabel.intrinsicContentSize.width, height: newPriceLabel.intrinsicContentSize.height)
        let newPriceBtn =  UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        newPriceBtn.setImage(UIImage(named: "request_quotation"), for: .normal)
        newPriceBtn.addTarget(self, action: #selector(newPriceBtnClick), for: .touchUpInside)
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.frame = CGRect(x: 0, y: myView.frame.height/2 - 55/2, width: newPriceLabel.intrinsicContentSize.width, height: 55)
        stackView.addArrangedSubview(newPriceBtn)
        stackView.addArrangedSubview(newPriceLabel)
        myView.addSubview(stackView)
        myTextField.frame = CGRect(x: stackView.frame.width + 4, y: myView.frame.height/2 - 55/2, width: myView.frame.width - 14 - stackView.frame.width, height: 55)
    }

}

