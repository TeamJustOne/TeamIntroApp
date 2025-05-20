//
//  ViewController.swift
//  TeamIntroApp
//
//  Created by estelle on 5/20/25.
//

import UIKit

class ListPageViewController: UIViewController {
    @IBOutlet var teamImageView: UIImageView!
    @IBOutlet var memberImageView1: UIImageView!
    @IBOutlet var memberImageView2: UIImageView!
    @IBOutlet var memberImageView3: UIImageView!
    @IBOutlet var memberImageView4: UIImageView!
    @IBOutlet var memberImageView5: UIImageView!
    @IBOutlet var slider: UISlider!
    
    // MARK: 사진 위치 조절을 위한 디버그 변수
    var yValue: CGFloat = 0.1 {
        didSet {
            member2()
        }
    }
    
    // MARK: 사진 위치 조절을 위한 디버그 슬라이더
    @IBAction func sliderChange(_ sender: UISlider!) {
        let step: Float = 0.1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        
        yValue = CGFloat(roundedValue)
        print("\(sender.value)")
    }
    
    // MARK: 사진 위치 조정 변수들
    func team() {
        let y: Double = yValue
        teamImageView.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member1() {
        //박주하
        var y: Double = 0.2
        memberImageView1.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member2() {
        //김우성
        var y: Double = -0.3
        memberImageView2.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member3() {
        //이서린
        let y: Double = yValue
        memberImageView3.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member4() {
        //김성연
        var y: Double = 0
        memberImageView4.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    func member5() {
        var y: Double = -0.4
        memberImageView5.layer.contentsRect = CGRect(
            x: 0,
            y: y,
            width: 1,
            height: 1-y
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team()
        member1()
        member2()
        member3()
        member4()
        member5()
        let teamImageTap = UITapGestureRecognizer(target: self, action: #selector(tapTeamImage))
        let memberImageTap1 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage1))
        let memberImageTap2 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage2))
        let memberImageTap3 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage3))
        let memberImageTap4 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage4))
        let memberImageTap5 = UITapGestureRecognizer(target: self, action: #selector(tapMemberImage5))

        teamImageView.isUserInteractionEnabled = true
        teamImageView.addGestureRecognizer(teamImageTap)
        
        memberImageView1.isUserInteractionEnabled = true
        memberImageView1.addGestureRecognizer(memberImageTap1)
        
        memberImageView2.isUserInteractionEnabled = true
        memberImageView2.addGestureRecognizer(memberImageTap2)
        
        memberImageView3.isUserInteractionEnabled = true
        memberImageView3.addGestureRecognizer(memberImageTap3)
        
        memberImageView4.isUserInteractionEnabled = true
        memberImageView4.addGestureRecognizer(memberImageTap4)
        
        memberImageView5.isUserInteractionEnabled = true
        memberImageView5.addGestureRecognizer(memberImageTap5)
    }
    
    @objc func tapTeamImage() {
        print("Tapped team Image")
    }
    
    @objc func tapMemberImage1() {
        print("Tapped member Image 1")
    }
    
    @objc func tapMemberImage2() {
        print("Tapped member Image 2")
    }
    
    @objc func tapMemberImage3() {
        print("Tapped member Image 3")
    }
    
    @objc func tapMemberImage4() {
        print("Tapped member Image 4")
    }
    
    @objc func tapMemberImage5() {
        print("Tapped member Image 5")
    }
}
