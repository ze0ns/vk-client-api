//  
//  customViewTest.swift
//  VK-Agent
//
//  Created by zeons on 23.07.2021.
//

import UIKit
class customViewTest: UIView{
    let gradientLayer = CAGradientLayer()  //Создаем градиент слой
    
    //когда хотим добавить статические элементы
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // Вызывается когда макет загружен
    override class func awakeFromNib() {
        super.awakeFromNib()
        //округляем вьюшку по краям указывая радиус
    }
    
    
    //Вызывается когда размеры макета подсчитаны и установлены , когда система уже подсчитала все что вы разместили на сториборд
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds //Ограничиваем градиент фарейм внутренними размерами слоя
        
        layer.cornerRadius = 10 //округляем вьюшку по краям указывая радиус
        layer.masksToBounds = false  //обрезаем по слою
        layer.borderWidth = 3
        layer.borderColor = UIColor.red.cgColor
        
        
        layer.shadowOffset = CGSize(width: 20, height: 20) //Тень, указываем смещение тени
        layer.shadowColor = UIColor.green.cgColor//CGColor(gray: 2, alpha: 1) //цвет тени, например в оттенке серого
        layer.shadowOpacity = 0.5 //указываем прозрачность тени
        layer.shadowRadius = 10 //радиус тени
        
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.white.cgColor] //указываем цвета градиента
        gradientLayer.locations = [0 as NSNumber,1 as NSNumber] // локации , где проходят цвета
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x:0, y:1) //указываем направление относительно вьюшки
        layer.addSublayer(gradientLayer)
        
        setGestures()
    }
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        guard let context1 = UIGraphicsGetCurrentContext(),let context = UIGraphicsGetCurrentContext()
//        else {
//            return
//        }
//        //context1.fill(CGRect(x: 20, y: 20, width: 160, height: 160)) //мы рисуем квадрат 50 на 50 и заполняем его
//        context1.fill(CGRect(origin: <#T##CGPoint#>, size: <#T##CGSize#>))
//        layer.cornerRadius = 9
//
//        context.setStrokeColor(UIColor.yellow.cgColor)
//        context.move(to: CGPoint(x: 30, y: 30))
//        context.addLine(to: CGPoint(x: 170, y: 30))
//        context.addLine(to: CGPoint(x: 170, y: 170))
//        context.addLine(to: CGPoint(x: 30, y: 170))
//        context.addLine(to: CGPoint(x: 30, y: 30))
//        context.setLineWidth(5)
//        context.closePath()
//        context.strokePath()
//
//    }
    
    //Создадим метод обрабатывающий жесты на нацей view
    private func setGestures(){
        let tap =  UITapGestureRecognizer(target: self, action: #selector(viewTapped))  //создаем сам жест, действия в методе viewTapped
        addGestureRecognizer(tap)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(viewOnSwipe))
        swipe.direction = .down
        addGestureRecognizer(swipe)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(viewRotate))
        addGestureRecognizer(rotate)
        
        
    }
    @objc private func viewTapped(){
        let scele = CGAffineTransform(scaleX: 0.8, y: 0.8) //Уменьшили размер
        let translation = CGAffineTransform(translationX: 0, y: -200) //Сдвинем вверх на 200
        transform = scele.concatenating(translation)//объеденили 2 действия по 1 жесту
        
    }
    
    @objc private func viewOnSwipe(){
        let translation = CGAffineTransform(translationX: 0, y: 200) //Сдвинем вниз на 200
        transform = translation
    }
    @objc private func viewRotate(){
        let rotate = CGAffineTransform(rotationAngle: 90)
        self.transform = rotate
    }
}
