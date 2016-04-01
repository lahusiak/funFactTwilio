//
//  ViewController.swift
//  FunFactApp
//
//  Created by Laryssa Husiak on 3/24/16.
//  Copyright © 2016 Laryssa Husiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var networkOperation = NetworkOperation()

    @IBOutlet weak var funFactLabel: UILabel!
    
    let type: String = "random"
    let date: String = "year"
    let format: String = "json"
    
    override func viewDidLoad() {
        
        funFactLabel.text = "I'm a fun fact"
        funFactLabel.sizeToFit()
        
        super.viewDidLoad()
        retrieveFunFact()
    
        

        
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
        let toNumber = valueForPrivateInfo("toNumber")
        let message = "Hey! You did it!"
        
        let messageService = MessageService(acctSID: twilioSID, acctSecret: twilioSecret)
        
        messageService.postMessage(toNumber, fromNumber: fromNumber, message: message)

        
        
}

}
