//
//  FirstViewController.swift
//  Minhas Atividades
//
//  Created by Caiua França on 24/02/16.
//  Copyright © 2016 Caiua França. All rights reserved.
//

import UIKit

var atividades = [String]()
var tempos = [Int]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    var timer = NSTimer()
    var segundos:Int = 0
    var minutos:Int = 0
    var horas:Int = 0
    var tempo = ""
    
    @IBOutlet weak var LabelTempo: UILabel!

    @IBAction func iniciaAtividade(sender: AnyObject) {
        if(atividades.count != 0){
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        } else {
            let alerta = UIAlertController(title: "Alerta", message: "Não Existem Atividades Cadastradas", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }
    func result(){
        segundos++
        if(segundos == 60){
            minutos++
            segundos = 0
        }
        if(minutos == 60){
            horas++
            minutos = 0
        }
        
        tempo = "\(horas):\(minutos):\(segundos)"
        
        LabelTempo.text = tempo
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return atividades.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = atividades[indexPath.row] + " - " + String(tempos[indexPath.row]) + " min"
        
        return cell        
    }
    
    @IBAction func pausarAtividade(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func pararAtividade(sender: AnyObject) {
        timer.invalidate()
        segundos = 0
        minutos = 0
        horas = 0
        tempo = "\(horas):\(minutos):\(segundos)"
        
        LabelTempo.text = tempo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            atividades.removeAtIndex(indexPath.row)
            tempos.removeAtIndex(indexPath.row)
                        
            table.reloadData()
        }
        
        
    }
    
}

