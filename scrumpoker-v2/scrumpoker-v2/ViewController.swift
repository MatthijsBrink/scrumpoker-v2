import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: Properties
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var overlayImg: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prevent phone from sleeping while app is active
        UIApplication.shared.isIdleTimerDisabled = true
        
        //MARK: View properties
        mainLabel.sizeToFit()
        leftLabel.frame = CGRect(x: 10, y: 20, width: 50, height: 30)
        rightLabel.frame = CGRect(x: self.view.frame.width - 60, y: self.view.frame.height - 50, width: 50, height: 30)
        
        // Spinning label and image
        rightLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        rightImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        //MARK: Subviews
        let circleLayer = drawCircle()
        mainView.layer.addSublayer(circleLayer)
        self.view.bringSubview(toFront: overlayImg)
        
        //MARK: Sublayer
        drawLines()
        
        //MARK: Gesture Recognizers
        self.view.addGestureRecognizer(XMCircleGestureRecognizer(midPoint: self.view.center, target: self, action: #selector(ViewController.rotateGesture(recognizer:))))
        let overlayTap = UITapGestureRecognizer(target: self, action: #selector(hideOverlay))
        overlayTap.delegate = self
        view.addGestureRecognizer(overlayTap)

    }
    
    // Drawing the circle
    func drawCircle() -> CAShapeLayer {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.mainView.bounds.width / 2,y: self.mainView.bounds.height / 2), radius: CGFloat(self.mainView.bounds.width / 2), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = hexStringToUIColor(hex: "#F1F4F6").cgColor
        shapeLayer.lineWidth = 50.0
        return shapeLayer
    }
    
    // Function for drawing the lines
    func drawLine(x: Int, y: Int, width: Int, height: Int) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: x, y: y, width: width, height: height), cornerRadius: 0).cgPath
        layer.fillColor = hexStringToUIColor(hex: "#9B917A").cgColor
        return layer
    }
    
    // Drawing the label lines
    func drawLines(){
        let mainLine = drawLine(x: (Int(self.view.frame.size.width) / 2) - 23, y: (Int(self.view.frame.size.height) / 2) + (Int(mainLabel.frame.size.height) / 2), width: 46, height: 7)
        self.view.layer.addSublayer(mainLine)
        
        let leftLine = drawLine(x: 20, y: 33, width: 10, height: 3)
        leftLabel.layer.addSublayer(leftLine)
        
        let rightLine = drawLine(x: 20, y: 33, width: 10, height: 3)
        rightLabel.layer.addSublayer(rightLine)
    }
    
    // Function for changing label text while rotating circle
    func rotateGesture(recognizer:XMCircleGestureRecognizer)
    {
        let rotate = recognizer.angle
        if recognizer.distance != nil{
            if overlayImg.alpha == 0{
                if recognizer.distance! > 120 && recognizer.distance! < 220 {
                    mainImage.isHidden = true
                    leftImage.isHidden = true
                    rightImage.isHidden = true
                    if Int((rotate?.degrees)!) >= 270 && Int((rotate?.degrees)!) <= 295 {
                        mainLabel.text = "0"
                        leftLabel.text = "0"
                        rightLabel.text = "0"
                    }
                    if Int((rotate?.degrees)!) >= 295 && Int((rotate?.degrees)!) <= 320 {
                        mainLabel.text = "1/2"
                        leftLabel.text = "1/2"
                        rightLabel.text = "1/2"
                    }
                    if Int((rotate?.degrees)!) >= 320 && Int((rotate?.degrees)!) <= 345 {
                        mainLabel.text = "1"
                        leftLabel.text = "1"
                        rightLabel.text = "1"
                    }
                    if Int((rotate?.degrees)!) >= 345 && Int((rotate?.degrees)!) <= 360 || Int((rotate?.degrees)!) >= 0 && Int((rotate?.degrees)!) <= 10 {
                        mainLabel.text = "2"
                        leftLabel.text = "2"
                        rightLabel.text = "2"
                    }
                    if Int((rotate?.degrees)!) >= 10 && Int((rotate?.degrees)!) <= 35{
                        mainLabel.text = "3"
                        leftLabel.text = "3"
                        rightLabel.text = "3"
                    }
                    if Int((rotate?.degrees)!) >= 35 && Int((rotate?.degrees)!) <= 60{
                        mainLabel.text = "5"
                        leftLabel.text = "5"
                        rightLabel.text = "5"
                    }
                    if Int((rotate?.degrees)!) >= 60 && Int((rotate?.degrees)!) <= 85{
                        mainLabel.text = "8"
                        leftLabel.text = "8"
                        rightLabel.text = "8"
                    }
                    if Int((rotate?.degrees)!) >= 85 && Int((rotate?.degrees)!) <= 110{
                        mainLabel.text = "13"
                        leftLabel.text = "13"
                        rightLabel.text = "13"
                    }
                    if Int((rotate?.degrees)!) >= 110 && Int((rotate?.degrees)!) <= 135{
                        mainLabel.text = "20"
                        leftLabel.text = "20"
                        rightLabel.text = "20"
                    }
                    if Int((rotate?.degrees)!) >= 135 && Int((rotate?.degrees)!) <= 160{
                        mainLabel.text = "40"
                        leftLabel.text = "40"
                        rightLabel.text = "40"
                    }
                    if Int((rotate?.degrees)!) >= 160 && Int((rotate?.degrees)!) <= 185{
                        mainLabel.text = "100"
                        leftLabel.text = "100"
                        rightLabel.text = "100"
                    }
                    if Int((rotate?.degrees)!) >= 185 && Int((rotate?.degrees)!) <= 210{
                        mainLabel.text = "∞"
                        leftLabel.text = "∞"
                        rightLabel.text = "∞"
                    }
                    if Int((rotate?.degrees)!) >= 210 && Int((rotate?.degrees)!) <= 235{
                        mainLabel.text = "?"
                        leftLabel.text = "?"
                        rightLabel.text = "?"
                    }
                    if Int((rotate?.degrees)!) >= 235 && Int((rotate?.degrees)!) <= 270{
                        mainLabel.text = "   "
                        leftLabel.text = "   "
                        rightLabel.text = "   "
                        mainImage.isHidden = false
                        leftImage.isHidden = false
                        rightImage.isHidden = false
                    }
                }
                if recognizer.distance! < 70{
                    for gesture in view.gestureRecognizers!{
                        if let recognizer = gesture as? XMCircleGestureRecognizer{
                            view.removeGestureRecognizer(recognizer)
                            
                        }
                    }
                    showOverlay()
                }
            }
        }
    }
    
    // Function for using hex codes for colo(u)rs
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // Function for hiding the overlay with animation
    func hideOverlay(){
        UIImageView.animate(withDuration: 0.2, delay: 0, animations: {
            self.overlayImg.alpha = 0
            }, completion: { finished in
                self.overlayImg.alpha = 0
        })
        self.view.addGestureRecognizer(XMCircleGestureRecognizer(midPoint: self.view.center, target: self, action: #selector(ViewController.rotateGesture(recognizer:))))
    }
    
    //Function for showing the overlay with animation
    func showOverlay(){
        UIImageView.animate(withDuration: 0.2, delay: 0, animations: {
            self.view.bringSubview(toFront: self.overlayImg)
            self.overlayImg.alpha = 1
            }, completion: { finished in
                self.overlayImg.alpha = 1
        })
    }
}
