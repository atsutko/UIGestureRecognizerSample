//
//  ViewController.swift
//  UIGestureRecognizerSample
//
//  Created by TakaoAtsushi on 2017/11/03.
//  Copyright © 2017年 TakaoAtsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var gestureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDouble(_:))) //Swift2.2以前
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDouble(sender:)))  //Swift3
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        // シングルタップ
        //let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapSingle(_:))) //Swift2.2以前
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapSingle(sender:)))  //Swift3
        singleTap.numberOfTapsRequired = 1
        //singleTap.numberOfTouchesRequired = 2  //こう書くと2本指じゃないとタップに反応しない
        
        //これを書かないとダブルタップ時にもシングルタップのアクションも実行される
        //singleTap.requireGestureRecognizerToFail(doubleTap)  //Swift2.2
        singleTap.require(toFail: doubleTap)  //Swift3
        
        view.addGestureRecognizer(singleTap)
        
        // ピンチを定義
        //let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(PinchCodeViewController.pinchView(_:)))  //Swift2.2以前
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinchView(sender:)))  //Swift3
        // viewにピンチを登録
        self.view.addGestureRecognizer(pinchGesture)
        
        // スワイプを定義
        //let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeCodeViewController.leftSwipeView(_:)))  //Swit2.2以前
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.leftSwipeView(sender:)))  //Swift3
        // レフトスワイプのみ反応するようにする
        leftSwipe.direction = .left
        // viewにジェスチャーを登録
        self.view.addGestureRecognizer(leftSwipe)
        
        
        // スワイプを定義
        //let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeCodeViewController.rightSwipeView(_:)))  //Swit2.2以前
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.rightSwipeView(sender:)))  //Swift3
        // ライトスワイプのみ反応するようにする
        rightSwipe.direction = .right
        // viewにジェスチャーを登録
        self.view.addGestureRecognizer(rightSwipe)
        
        
        // ローテイトを定義
        //let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(RotateCodeViewController.rotationView(_:)))  //Swift2.2以前
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.rotationView(sender:)))  //Siwft3
        
        // ローテイトをviewに登録
        self.view.addGestureRecognizer(rotationGesture)
        
        // ロングプレスを定義
        //let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(LongPressCodeViewController.longPressView(_:)))  //Swift2.2以前
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressView(sender:)))  //Swift3
        
        longPressGesture.minimumPressDuration = 3  //3秒間以上押された場合にロングプレスとする
        longPressGesture.numberOfTouchesRequired = 5 // 5本指で押した時のみ
        longPressGesture.allowableMovement = 30  //ロングプレスを判定する指が動いていい範囲、単位はpx
        
        self.view.addGestureRecognizer(longPressGesture)
        
        // エッジを定義
        //let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(EdgeCodeViewController.edgeView(_:)))   //Swift2.2
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(ViewController.edgeView(sender:)))   //Swift3
        
        edgeGesture.edges = .left  //左端をスワイプするのを検知する
        
        // viewにエッジを登録
        self.view.addGestureRecognizer(edgeGesture)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// シングルタップ時に実行される
    @objc func tapSingle(sender: UITapGestureRecognizer) {
        gestureLabel.text = "Single Tap!"
    }
    
    /// ダブルタップ時に実行される
    @objc func tapDouble(sender: UITapGestureRecognizer) {
        gestureLabel.text = "Double Tap!"
    }
    

    /// ピンチイン・ピンチアウト時に実行される
    @objc func pinchView(sender: UIPinchGestureRecognizer) {
        gestureLabel.text = "PinchIn or Out !"
      
    }
    /// レフトスワイプ時に実行される
    @objc func leftSwipeView(sender: UISwipeGestureRecognizer) {
        gestureLabel.text = "Left Swipe!"
    }
    
    /// ライトスワイプ時に実行される
    @objc func rightSwipeView(sender: UISwipeGestureRecognizer) {
        gestureLabel.text = "Right Swipe!"
    }
    
    /// ローテイト時に実行される
    @objc func rotationView(sender: UIRotationGestureRecognizer) {
        gestureLabel.text = "Rotate!"
    }
    
    /// ロングプレス時に実行される
    @objc func longPressView(sender: UILongPressGestureRecognizer) {
        gestureLabel.text = "Long Press!"
    }
    
    /// エッジ時に実行される
    @objc func edgeView(sender: UIScreenEdgePanGestureRecognizer) {
        gestureLabel.text = "Edge Swipe!"
    }
}

