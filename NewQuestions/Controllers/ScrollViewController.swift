//
//  ScrollViewController.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 26/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    let allQuestions = QuestionData()
    
    var slides:[Slide] = [];
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        scrollView.delegate = self
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.questionLabel.text = allQuestions.list[0].questionText
        slide1.button1.setTitle(allQuestions.list[0].answerText[0], for: .normal)
        slide1.button2.setTitle(allQuestions.list[0].answerText[1], for: .normal)
        slide1.button3.setTitle(allQuestions.list[0].answerText[2], for: .normal)
        slide1.button4.setTitle(allQuestions.list[0].answerText[3], for: .normal)
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.questionLabel.text = allQuestions.list[1].questionText
        slide2.button1.setTitle(allQuestions.list[1].answerText[0], for: .normal)
        slide2.button2.setTitle(allQuestions.list[1].answerText[1], for: .normal)
        slide2.button3.setTitle(allQuestions.list[1].answerText[2], for: .normal)
        slide2.button4.setTitle(allQuestions.list[1].answerText[3], for: .normal)
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.questionLabel.text = allQuestions.list[2].questionText
        slide2.button1.setTitle(allQuestions.list[2].answerText[0], for: .normal)
        slide2.button2.setTitle(allQuestions.list[2].answerText[1], for: .normal)
        slide2.button3.setTitle(allQuestions.list[2].answerText[2], for: .normal)
        slide2.button4.setTitle(allQuestions.list[2].answerText[3], for: .normal)
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.questionLabel.text = allQuestions.list[3].questionText
        slide4.button1.setTitle(allQuestions.list[3].answerText[0], for: .normal)
        slide4.button2.setTitle(allQuestions.list[3].answerText[1], for: .normal)
        slide4.button3.setTitle(allQuestions.list[3].answerText[2], for: .normal)
        slide4.button4.setTitle(allQuestions.list[3].answerText[3], for: .normal)
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.questionLabel.text = allQuestions.list[4].questionText
        slide5.button1.setTitle(allQuestions.list[4].answerText[0], for: .normal)
        slide5.button2.setTitle(allQuestions.list[4].answerText[1], for: .normal)
        slide5.button3.setTitle(allQuestions.list[4].answerText[2], for: .normal)
        slide5.button4.setTitle(allQuestions.list[4].answerText[3], for: .normal)
        
        let slide6:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide6.questionLabel.text = allQuestions.list[5].questionText
        slide6.button1.setTitle(allQuestions.list[5].answerText[0], for: .normal)
        slide6.button2.setTitle(allQuestions.list[5].answerText[1], for: .normal)
        slide6.button3.setTitle(allQuestions.list[5].answerText[2], for: .normal)
        slide6.button4.setTitle(allQuestions.list[5].answerText[3], for: .normal)
        
        let slide7:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide7.questionLabel.text = allQuestions.list[6].questionText
        slide7.button1.setTitle(allQuestions.list[6].answerText[0], for: .normal)
        slide7.button2.setTitle(allQuestions.list[6].answerText[1], for: .normal)
        slide7.button3.setTitle(allQuestions.list[6].answerText[2], for: .normal)
        slide7.button4.setTitle(allQuestions.list[6].answerText[3], for: .normal)
        
        let slide8:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide8.questionLabel.text = allQuestions.list[7].questionText
        slide8.button1.setTitle(allQuestions.list[7].answerText[0], for: .normal)
        slide8.button2.setTitle(allQuestions.list[7].answerText[1], for: .normal)
        slide8.button3.setTitle(allQuestions.list[7].answerText[2], for: .normal)
        slide8.button4.setTitle(allQuestions.list[7].answerText[3], for: .normal)
        
        let slide9:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide9.questionLabel.text = allQuestions.list[8].questionText
        slide9.button1.setTitle(allQuestions.list[8].answerText[0], for: .normal)
        slide9.button2.setTitle(allQuestions.list[8].answerText[1], for: .normal)
        slide9.button3.setTitle(allQuestions.list[8].answerText[2], for: .normal)
        slide9.button4.setTitle(allQuestions.list[8].answerText[3], for: .normal)
        
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7, slide8, slide9]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)

    }
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        if(pageControl.currentPage == 0) {
            //Change background color to toRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1
            //Change pageControl selected color to toRed: 103/255, toGreen: 58/255, toBlue: 183/255, fromAlpha: 0.2
            //Change pageControl unselected color to toRed: 255/255, toGreen: 255/255, toBlue: 255/255, fromAlpha: 1
            
            let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.pageIndicatorTintColor = pageUnselectedColor
            
            
            let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            slides[pageControl.currentPage].backgroundColor = bgColor
            
            let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.currentPageIndicatorTintColor = pageSelectedColor
        }
    }
    
    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
