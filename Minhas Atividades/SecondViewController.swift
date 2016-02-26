//
//  SecondViewController.swift
//  Minhas Atividades
//
//  Created by Caiua França on 24/02/16.
//  Copyright © 2016 Caiua França. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textTempo: UITextField!
    
    @IBOutlet weak var textAtividade: UITextField!
    
    @IBAction func cadastrarAtividade(sender: AnyObject) {
    
        if((textTempo.text == "") || (textAtividade.text == "")){
            let alertaCadastro = UIAlertController(title: "Alerta", message: "Existem Campos em Branco", preferredStyle: UIAlertControllerStyle.Alert)
            alertaCadastro.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertaCadastro, animated: true, completion: nil)
        }else{
            atividades.append(textAtividade.text!.uppercaseString)
            tempos.append(Int(textTempo.text!)!)
            textAtividade.text = ""
            textTempo.text = ""
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if( textAtividade.resignFirstResponder() || textTempo.resignFirstResponder()){
            return true
        }else{
            return false
        }
    }



}

