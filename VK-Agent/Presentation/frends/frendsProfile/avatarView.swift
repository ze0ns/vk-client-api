import UIKit
class avatarView: UIView{
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
        setGestures()
        layer.cornerRadius = frame.width / 2    //делаем круг
        layer.masksToBounds = false  //обрезаем по слою
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5
        layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor

    }

    
    
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
