//
//  CustomTextField.swift
//  OtusHomework1
//
//  Created by 7Winds on 04.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

typealias TextFieldCustomCompletion = (_ textField: UITextField, _ range: NSRange, _ string: String) -> Bool
typealias TextFieldCustomSimpleCompletion = (_ textField: UITextField) -> Void
typealias StringCompletion = (String) -> Void

class PhoneTextField: UITextField {
    
    private var onShouldReturnCompletion: TextFieldCustomSimpleCompletion?
    private var onShouldChangeCharactersCompletion: TextFieldCustomCompletion?
    private var onTextChangeCompletion: StringCompletion?
    
    private let numberAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black ]
    private let placeHolderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
    private let placeHolderMask = "+7 (000) 000-00-00"
    private var enteredText = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addTarget(self, action: #selector(textChange), for: .editingChanged)
        delegate = self
        autocorrectionType = .no
        keyboardType = .numberPad
        
    }
    
    func checkPlaceholder(text: String) -> String {
        var correctedPlaceholder = placeHolderMask
        if text.count > 0 {
            for _ in 1...text.count {
                correctedPlaceholder.removeFirst()
            }
        }
        return correctedPlaceholder
    }
    
    
    func correctText(text: String) -> String {
        var correctedString = ""
        let enteredNumber = text.filter { (char) -> Bool in
            let numbers = "0123456789"
            return numbers.contains(char)
        }
        for (index, char) in enteredNumber.enumerated() {
            switch index {
            case 0:
                correctedString.append("+")
                correctedString.append(char)
            case 1:
                correctedString.append(" (")
                correctedString.append(char)
            case 4:
                correctedString.append(") ")
                correctedString.append(char)
            case 7, 9:
                correctedString.append("-")
                correctedString.append(char)
            default:
                correctedString.append(char)
            }
        }
        return correctedString
    }
}

extension PhoneTextField {
    
    func onTextChange(completion: @escaping StringCompletion){
        onTextChangeCompletion = completion
    }
    
    func onShouldChangeCharacters(completion: @escaping TextFieldCustomCompletion){
        onShouldChangeCharactersCompletion = completion
    }
    
    func onShouldReturn(completion: @escaping TextFieldCustomSimpleCompletion){
        onShouldReturnCompletion = completion
    }
}

extension PhoneTextField {
    
    @objc private func textChange(_ textField: UITextField){
        guard let text = textField.text else { return }
        onTextChangeCompletion?(text)
        if enteredText.count == 11 {
            textField.text?.removeLast()
            textField.resignFirstResponder()
        } else {
            let userText = correctText(text: enteredText)
            let attributedText = NSMutableAttributedString(string: userText, attributes: numberAttributes)
            attributedText.append(NSAttributedString(string: checkPlaceholder(text: userText), attributes: placeHolderAttributes))
            textField.attributedText = attributedText
            if let newPosition = textField.position(from: textField.beginningOfDocument, offset: userText.count) {
                textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
            }
        }
    }
    
}

extension PhoneTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        if range.length == 0, range.location < 18 {
            enteredText.append(string)
        } else {
            if range.length == 1, range.location != 0 {
                enteredText.removeLast()
            }
        }
        if enteredText == "" {
            textField.text = ""
        }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 19
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        onShouldReturnCompletion?(textField)
        return true
    }
}

