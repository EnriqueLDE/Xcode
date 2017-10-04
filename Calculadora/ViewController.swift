//
//  ViewController.swift
//  Calculadora
//
//  Created by CETYS on 26/09/17.
//  Copyright © 2017 CETYS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pantalla: UILabel!
    @IBOutlet weak var miniPantalla: UILabel!
    
    var elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero : Bool = false
    var operando1 : Double = 0
    var operando2 : Double = 0
    var operacion : String = ""
    
    
    
    @IBAction func borrarPantalla() {
        pantalla.text = "0"
        miniPantalla.text = ""
        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero=false
    }
    
    
    
    @IBAction func numeroPulsado(_ sender: UIButton) {
        //Coge el texto que aparece en el botón y lo guardo en la variable. Después lo imprimo. Let declara una constante, va a tener siempre el mismo valor
        let digito : String! = sender.currentTitle
        
        //Para que en la pantalla los digitos aparezcan de forma consecutiva según los escriba.
        if elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero{
            pantalla.text = pantalla.text! + digito
        }else{
            pantalla.text = digito
            elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = true
        }
        print(digito)
    
    }
   
    
    @IBAction func operacionPulsada(_ sender: UIButton) {
        //NS (Next Step) es el conjunto de liberias propias de todo el sistema operativo de IOS
        let numero : NSString = pantalla.text! as NSString
        operando1 = numero.doubleValue
        
        
        //guardo la operación pulsada
        operacion = sender.currentTitle!
        
        miniPantalla.text = pantalla.text
        //pongo un 0 en la pantalla para escribir el 2 operando
        pantalla.text = "0"
        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = false
        
    }
    
    
    @IBAction func enterPulsado() {
        let numero : NSString = pantalla.text! as NSString
        operando2 = numero.doubleValue
        let resultado = realizaOperacion()
        pantalla.text = String(format: "%g", resultado)
    }
    
    
    
    @IBAction func porcentajePulsado() {
        let numero : NSString = pantalla.text! as NSString
        operando1 = numero.doubleValue
        let porcentaje = operando1 / 100
        pantalla.text = String(format: "%g", porcentaje)
    }
    
    
    func realizaOperacion() -> Double{
        var resultado : Double = 0
        if operacion == "+" {
            resultado = operando1 + operando2
        }
        if operacion == "-" {
            resultado = operando1 - operando2
        }
        if operacion == "*" {
            resultado = operando1 * operando2
        }
        if operacion == "/" {
            resultado = operando1 / operando2
        }
        
        return resultado
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

