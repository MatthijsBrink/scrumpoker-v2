// Tussen de 135 en 185 distance

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!

    var currentValue:CGFloat = 0.0 {
        didSet {
            if (currentValue > 100) {
                currentValue = 100
            }
            if (currentValue < 0) {
                currentValue = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let circleLayer = drawCircle()
        mainView.layer.addSublayer(circleLayer)
        rightLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        let mainLine = drawLine(x: 17, y: 165, width: 64, height: 5)
        mainLabel.layer.addSublayer(mainLine)
        
        let leftLine = drawLine(x: 3, y: 33, width: 13, height: 2)
        leftLabel.layer.addSublayer(leftLine)
        
        let rightLine = drawLine(x: 3, y: 33, width: 13, height: 2)
        rightLabel.layer.addSublayer(rightLine)
        
        self.view.addGestureRecognizer(XMCircleGestureRecognizer(midPoint: self.view.center, target: self, action: #selector(ViewController.rotateGesture(recognizer:))))
    }
    
    func drawCircle() -> CAShapeLayer {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.mainView.bounds.width / 2,y: self.mainView.bounds.height / 2), radius: CGFloat(self.mainView.bounds.width / 2), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = hexStringToUIColor(hex: "#F1F4F6").cgColor
        shapeLayer.lineWidth = 50.0
        return shapeLayer
    }
    
    func drawLine(x: Int, y: Int, width: Int, height: Int) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: x, y: y, width: width, height: height), cornerRadius: 0).cgPath
        layer.fillColor = hexStringToUIColor(hex: "#9B917A").cgColor
        return layer
    }
    
    func rotateGesture(recognizer:XMCircleGestureRecognizer)
    {
        if let rotation = recognizer.rotation {
            currentValue += rotation.degrees / 360 * 100
        }
        if let distance = recognizer.distance {
            
        }
    }
    
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
}
