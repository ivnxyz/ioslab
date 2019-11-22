//
//  ControladorAlumnos.swift
//  
//
//  Created by Iván Martínez on 21/11/19.
//

import UIKit

class ControladorAlumnos: UIViewController {
  // Conexiones de los objetos donde se va a desplazar la informacion
    @IBOutlet weak var fotoAlumno: UIImageView!
    @IBOutlet weak var nombreAlumno:UILabel!
    @IBOutlet weak var numCuenta:UILabel!
    @IBOutlet weak var materias:UILabel!
    
    var fotoAlumController:UIImage!
    var nombreAlumController:String!
    var numCuentaController:String!
    var materiasController:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //Hacemos la conexion entre los dos conjuntos del variables
        self.fotoAlumno.image = fotoAlumController!
        self.nombreAlumno.text = nombreAlumController
        self.numCuenta.text = numCuentaController
        self.materias.text = materiasController
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
