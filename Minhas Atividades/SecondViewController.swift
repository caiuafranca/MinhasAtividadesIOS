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
            print("É Necessario inputar um Valor")
        }else{
            atividades.append(textAtividade.text!)
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


}

