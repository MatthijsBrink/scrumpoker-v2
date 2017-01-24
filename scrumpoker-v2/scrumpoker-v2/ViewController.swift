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
        let shapeLayer = drawCircle()
        mainView.layer.addSublayer(shapeLayer)
        
        
        self.view.addGestureRecognizer(XMCircleGestureRecognizer(midPoint: self.view.center, target: self, action: #selector(ViewController.rotateGesture(recognizer:))))
    }
    
    func drawCircle() -> CAShapeLayer {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.mainView.bounds.width / 2,y: self.mainView.bounds.height / 2), radius: CGFloat(self.mainView.bounds.width / 2), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 50.0
        return shapeLayer
    }
    
    func rotateGesture(recognizer:XMCircleGestureRecognizer)
    {
        if let rotation = recognizer.rotation {
            currentValue += rotation.degrees / 360 * 100
        }
        if let distance = recognizer.distance {
            
        }
    }
}
