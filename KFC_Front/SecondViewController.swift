//
//  SecondViewController.swift
//  KFC_Front
//
//  Created by 김태현 on 2022/08/18.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    // 쿠폰 뷰 테두리
    @IBOutlet var couponViewBorder: [UIView]!
    
    // 바코드 옆 점선
    @IBOutlet var dottedLine: [UIView]!
    // 이미지뷰 테두리
    @IBOutlet var imageViewBorder: [UIImageView]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        segmentedControl.customizeAppearance(for: 1)
        
        }
        
    // 기본 UI 업데이트
    func setupUI() {
        firstView.isHidden = false
        secondView.isHidden = true
        thirdView.isHidden = true
        fourthView.isHidden = true
        
        // 바코드 옆 점선 view
        for i in dottedLine {
            
            drawDottedLine(start: CGPoint(x: i.bounds.minX, y: i.bounds.minY), end: CGPoint(x: i.bounds.maxX, y: i.bounds.maxY), view: i)
        }
        
        // 이미지뷰 테두리 넣기
        for i in imageViewBorder {
            i.layer.borderColor = UIColor.systemGray4.cgColor
            i.layer.borderWidth = 1
        }
        
        // 큰 쿠폰뷰 테두리 넣기
        for i in couponViewBorder {
            i.layer.borderColor = UIColor.systemGray4.cgColor
            i.layer.borderWidth = 1
        }
        
        
        
    }
    
    
    
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
            fourthView.isHidden = true
        case 1:
            firstView.isHidden = true
            secondView.isHidden = false
            thirdView.isHidden = true
            fourthView.isHidden = true
        case 2:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = false
            fourthView.isHidden = true
        case 3:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
            fourthView.isHidden = false
        default:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
            fourthView.isHidden = true
        }
    }
        
        
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [5, 5] // 7 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
    
}



extension UISegmentedControl {
    
    func customizeAppearance(for height: Int) {
        
        setTitleTextAttributes([NSAttributedString.Key.font:UIFont(name:"Helvetica Neue", size:17.0)!,NSAttributedString.Key.foregroundColor:UIColor.gray], for:.normal)
        setTitleTextAttributes([NSAttributedString.Key.font:UIFont(name:"Helvetica Neue", size:17.0)!,NSAttributedString.Key.foregroundColor:UIColor.white], for:.selected)
        setDividerImage(UIImage().colored(with: .clear, size: CGSize(width: 1, height: height)), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        setBackgroundImage(UIImage().colored(with: .clear, size: CGSize(width: 1, height: height)), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage().colored(with: UIColor.init(red: 226/255.0, green: 0, blue: 32/255.0, alpha: 1.0), size: CGSize(width: 1, height: height)), for: .selected, barMetrics: .default);
        
        for borderview in subviews {
            let upperBorder: CALayer = CALayer()
            upperBorder.backgroundColor = UIColor.init(red: 226/255.0, green: 0, blue: 32/255.0, alpha: 1.0).cgColor
            upperBorder.frame = CGRect(x: 0, y: borderview.frame.size.height-1, width: borderview.frame.size.width, height: 1)
            borderview.layer.addSublayer(upperBorder)
        }
        
    }
}

extension UIImage {
    
    func colored(with color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
