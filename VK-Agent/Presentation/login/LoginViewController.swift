//final обозначает что от этого класса нельзя наследоваться
//полезно для оптимизации приложения
//frame - размеры относительно родительской вьюшки (x,y,h,w)
//bounds = (x,y,h,w)
// CGRect - Задаем координаты и размеры нашей вьюшки
//    Constraints - позволяет задаваеть какаие отступы делать для вьюшек

import UIKit

final class Session{
    
    private init(){} //  Закрываем инит
    
    static let shared = Session() // Мы переиспользуем один и тот же объект
    
    var token: String = "" //Token VK
    var userId: Int = 0    //ID пользователя
}
final class LoginViewController: UIViewController {
    
    @IBOutlet private var titleImageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var titleLableUsername: UILabel!
    @IBOutlet private var titlePassword: UILabel!
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Подписываемся на 2 уведомления: Одно при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //Второе - когда клавиатура пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        //Необходимо отписаться от Нитификационного центра
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
      
    }
    
    @IBAction func backToLoginScreen(_ segue: UIStoryboardSegue ){
 

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //Делать нам переход или не делать, добавляем обработку- проверку для перехода.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "moveToMain" {
            guard
            let login = usernameTextField.text,
            let password = passwordTextField.text
            else {
                showErrorAlert(tittle: "Ошибка", message: "No login and password entered")
                return false
            }
//            if (login == "admin") && (password == "1"){
            if (login == "") && (password == "")
            
            {      print("Добро пожаловать")
                return true
            } else {
                showErrorAlert(tittle: "Ошибка", message: "Не верные имя или пароль")
                return false
            }
            
        }
        return false
    }
    
    @IBAction private func loginButtonAction(_ sender: UIButton) {
       
            print("Login buttton presset")
            loginLoading(true)
               
        
    }
    
    //Клавиатура появляется
    @objc private func keyboardWasShow(notification:Notification){
        
        //Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        //Добавляем отступ внзу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    //Клавиатура исчезает
    @objc private func keyboardWillBeHidden(notification:Notification){
        //Устанавливаем отступ равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    private func setViews(){
        loginButton.layer.cornerRadius = 8
        
        
        //Отслеживаем нажатие на экран - на наш СкролВью
        let tapGestruru = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGestruru)
    }
    
    private func showErrorAlert(tittle: String, message: String){
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.usernameTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}
extension LoginViewController{


 func loginLoading(_ animated: Bool) {
    super.viewWillAppear(true)
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: 100.0, startAngle: 0.0, endAngle:CGFloat(Double.pi * 2), clockwise: true)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = circlePath.cgPath
    shapeLayer.position = CGPoint(x: 100, y: 100)
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.blue.cgColor
    shapeLayer.lineWidth = 6.0
    let one : NSNumber = 1
    let two : NSNumber = 13
    shapeLayer.lineDashPattern = [one,two]
    shapeLayer.lineCap = CAShapeLayerLineCap.round
    view.layer.addSublayer(shapeLayer)

}
    
    
}
