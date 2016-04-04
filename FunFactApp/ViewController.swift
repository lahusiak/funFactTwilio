//
//  ViewController.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 3/24/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var funFactLabel: UILabel!
    
    @IBOutlet weak var phoneField: UITextField!
    
    let limitLength = 10
    
    let type: String = "random"
    let date: String = "year"
    let format: String = "json"
    
    override func viewDidLoad() {
        
        funFactLabel.text = "I'm a fun fact"
        funFactLabel.sizeToFit()
        
        
        
        phoneField.keyboardType = UIKeyboardType.DecimalPad
        
        super.viewDidLoad()
        
        //GET request to API for facts
        retrieveFunFact()
        
        self.phoneField.delegate = self
    
        
    }
    override func viewDidLayoutSubviews(){
        funFactLabel.numberOfLines = 0
        funFactLabel.sizeToFit()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrieveFunFact(){
        let factService = FactService()
        
        factService.getFact(type, date: date, format: format){
         
            (let fact) in
            
            if let funFact = fact {
            
                dispatch_async(dispatch_get_main_queue()){
                
                    if let fact = funFact.fact{
                        self.funFactLabel?.text = "\(fact)"
                    }
                
                }
            
            }
        
        }
    
    }


    @IBAction func showFunFact() {
//        funFactLabel.text = "Another fact"
        retrieveFunFact()
       
    }

    @IBAction func makeACall(sender: AnyObject) {

        print("Tapped button1")
        
        // Use your own details here
        let twilioSID = valueForPrivateInfo("twilioSID")
        let twilioSecret = valueForPrivateInfo("twilioSecret")
        let fromNumber = valueForPrivateInfo("fromNumber")
       
        let toNumber = "\(self.phoneField?.text)"
        
        print("This is toNumber \(toNumber)")
        let message = self.funFactLabel?.text
        
        let messageService = MessageService(acctSID: twilioSID, acctSecret: twilioSecret)
        
        messageService.postMessage(toNumber, fromNumber: fromNumber, message: message!)

        
        
}
    
    
    // UITextField Delegates
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField did end editing method called")
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("TextField should snd editing method called")
        return true;
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
//        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        
//            if (textField == phoneField)
//            {
//                let newString = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
//                let components = newString.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
//                
//                let decimalString = components.joinWithSeparator("") as NSString
//                let length = decimalString.length
//                let hasLeadingOne = length > 0 && decimalString.characterAtIndex(0) == (1 as unichar)
//                
//                if length == 0 || (length > 10 && !hasLeadingOne) || length > 11
//                {
//                    let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
//                    
//                    return (newLength > 10) ? false : true
//                }
//                var index = 0 as Int
//                let formattedString = NSMutableString()
//                
//                if hasLeadingOne
//                {
//                    formattedString.appendString("1 ")
//                    index += 1
//                }
//                if (length - index) > 3
//                {
//                    let areaCode = decimalString.substringWithRange(NSMakeRange(index, 3))
//                    formattedString.appendFormat("(%@)", areaCode)
//                    index += 3
//                }
//                if length - index > 3
//                {
//                    let prefix = decimalString.substringWithRange(NSMakeRange(index, 3))
//                    formattedString.appendFormat("%@-", prefix)
//                    index += 3
//                }
//                
//                let remainder = decimalString.substringFromIndex(index)
//                formattedString.appendString(remainder)
//                textField.text = formattedString as String
//                return false
//            }
//            else
//            {
//                return true
//            }
        return true
       }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }

}
