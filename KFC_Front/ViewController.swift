//
//  ViewController.swift
//  KFC_Front
//
//  Created by 김태현 on 2022/08/15.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    //상태바 하얀색으로
    override var preferredStatusBarStyle:UIStatusBarStyle { return .lightContent }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var kfcLogo: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    let imageView = [UIImageView]()
    let images = [UIImage(named: "스크롤1"), UIImage(named: "스크롤2"), UIImage(named: "스크롤3"), UIImage(named: "스크롤4"), UIImage(named: "스크롤5"), UIImage(named: "스크롤6"), UIImage(named: "스크롤7"), UIImage(named: "스크롤8"), UIImage(named: "스크롤9"), UIImage(named: "스크롤10")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
        
        
       
    
    }


    
    
    
    
    
    // 스크롤뷰
    private func addContentScrollView() {
           
           for i in 0..<images.count {
               let imageView = UIImageView()
               let xPos = self.view.frame.width * CGFloat(i)
               imageView.contentMode = .scaleAspectFill
               imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
               imageView.image = images[i]
               scrollView.addSubview(imageView)
               scrollView.contentSize.width = imageView.frame.width * CGFloat(i+1)
           }
           
       }
       
       private func setPageControl() {
           pageControl.numberOfPages = images.count
           
       }
       
       private func setPageControlSelectedPage(currentPage:Int) {
           pageControl.currentPage = currentPage
       }
       
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let value = scrollView.contentOffset.x/scrollView.frame.size.width
           setPageControlSelectedPage(currentPage: Int(round(value)))
       }

   }
