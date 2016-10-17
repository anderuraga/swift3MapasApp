//
//  Lugar.swift
//  Mapas
//
//  Created by Spot Matic SL on 17/10/16.
//  Copyright © 2016 Spot Matic SL. All rights reserved.
//

import UIKit

class Lugar: NSObject {
    
    var nombre : String!
    var direccion : String!;
    var tipo : String;
    var marker: String?
    var telefono : String?
    var web : String?
    
    
    init(nombre : String, direccion : String, tipo : String) {
        self.nombre = nombre
        self.direccion = direccion
        self.tipo = tipo
    }

}
