//
//  UIButtonExtension.swift
//  iOS-calculate
//
//  Created by Esther Alcoceba Gutiérrez de León on 4/9/21.
//

import UIKit

private let orange = UIColor(red: 254/255, green: 148/255, blue: 0/255, alpha: 1)

extension UIButton {  // con este bloque de código, todas las funciones que creemos dentro se añadiran a las                         funcionalidades que tiene UIButton
    
    // Borde redondo
    func round() {  // No necesitamos poner selft porque ya estamos dentro del botón  // Layer -> capa
        layer.cornerRadius = bounds.height / 2  // El radio de curvatura del botón será la altura entre 2
        clipsToBounds = true  // Decimos que si el botón se ve deformado ese área también se ajuste a la curvatura del botón
    }
    
    //  Rebote
    func bounce(){  // Accedemos a la propiedad de animación y le decimos que dure la animación 1.1 seg
        UIView.animate(withDuration: 0.1, animations: {  // Código que se invoca cuando se anima la vista
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)  // Aumentamos escala
        }) { (completion) in  // Se invoca cuando termina la animación
            UIView.animate(withDuration: 0.1, animations: {  // Le pedimos que vuelva al tamaño original
                self.transform = .identity
            })
        }
    }
    
    // Brillar
    func shine(){  // Accedemos a la propiedad de animación y le decimos que dure la animación 1.1 seg
        UIView.animate(withDuration: 0.1, animations: {  // Código que se invoca cuando se anima la vista
            self.alpha = 0.5 // Accedemos a la opacidad del botón y la reducimos a la mitad
        }) { (completion) in  // Se invoca cuando termina la animación
            UIView.animate(withDuration: 0.1, animations: {  // Le pedimos que vuelva a la opacidad original
                self.alpha = 1
            })
        }
    } 
    
    
    // Salta
    func jump(){  // Accedemos a la propiedad de animación y le decimos que dure la animación 1.1 seg
        UIView.animate(withDuration: 0.1, animations: {  // Código que se invoca cuando se anima la vista
            self.transform = CGAffineTransform(translationX: 0, y: 10)  // Se mueve 0px en eje x y 10px en y
        }) { (completion) in  // Se invoca cuando termina la animación
            UIView.animate(withDuration: 0.1, animations: {  // Le pedimos que vuelva a su posición original
                self.transform = .identity
            })
        }
    }
    
    
    // Apariencia selección de operación
    func selectOperation( selected: Bool){
        backgroundColor = selected ? .white : orange  // Si está seleccionado el fondo es blanco, si no naranja
        setTitleColor(selected ? orange : .white, for: .normal)  // Si está seleccionado el texto será naranja, si no blanco
    }
    
}
