//
//  C2Alert.swift
//  C2Me
//
//  Created by Berk Kaya on 10.01.2018.
//  Copyright © 2018 Berk Kaya. All rights reserved.
//

import UIKit

public class C2Alert: UIView {
    
    public var image: UIImage?
    public var title: String?
    public var message: String?
    
    public var autoHideAfterSeconds: Double = 2.5
    public var hideOnBackgroundTouch = true
    
    public var dialogBackgroundColor: UIColor = .white
    public var dialogTitleTextColor: UIColor = .black
    public var dialogMessageTextColor: UIColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    public var dialogImageColor: UIColor = UIColor(red:0.47, green:0.72, blue:0.35, alpha:1.0)
    public var overlayColor: UIColor = .black
    public var overlayOpacity: CGFloat = 0.66
    
    public var paddingSingleTextOnly: CGFloat = 8
    public var paddingTopAndBottom: CGFloat = 24
    public var paddingFromSides: CGFloat = 32
    public var seperatorHeight: CGFloat = 6
    
    private var height: CGFloat = 0
    private var width: CGFloat = 0
    private var maxSize: CGSize = CGSize()
    private let marginFromSides: CGFloat = 80
        
    public lazy var imageSize: CGSize = CGSize(width: 75, height: 75)
    
    public var overlay = true
    public var blurOverlay = false
    
    //animation duration
    public var duration = 0.33

    private var onComplete: (() ->  Void)?
    
    @objc public var titleFont: UIFont =  UIFont.systemFont(ofSize: 18)
    @objc public var messageFont: UIFont = UIFont.systemFont(ofSize: 15)
    
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.alpha = 0
        return view
    }()
    
    public let dialogView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        view.alpha = 0
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    
    private func calculations() {
        height += paddingTopAndBottom
        maxSize = CGSize(width: frame.width - marginFromSides * 2, height: frame.height - marginFromSides)
    }
    
    public convenience init(title:String, message: String, image:UIImage) {
        self.init(frame: UIScreen.main.bounds)
        self.title = title
        self.message = message
        self.image = image
    }
    
    public convenience init(title:String, image:UIImage) {
        self.init(frame: UIScreen.main.bounds)
        self.title = title
        self.image = image
    }
    
    public convenience init(title: String, message: String) {
        self.init(frame: UIScreen.main.bounds)
        self.title = title
        self.message = message
    }
    
    public convenience init(message: String) {
        self.init(frame: UIScreen.main.bounds)
        paddingTopAndBottom = paddingSingleTextOnly
        paddingFromSides = paddingSingleTextOnly * 2
        self.message = message
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func didTappedOnBackgroundView(){
        if hideOnBackgroundTouch {
            dismiss()
        }
    }
    
    private func createOverlay() {
        backgroundView.frame = frame
        backgroundView.backgroundColor = overlayColor
        //background click recognizer
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(backgroundView)
        } else if let window = UIApplication.shared.delegate?.window??.rootViewController {
            window.view.addSubview(self)
        }
    }
    
    private func createBlurOverlay() {
        backgroundView.frame = frame
        //Blur Effect
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.addSubview(blurEffectView)
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(backgroundView)
        } else if let window = UIApplication.shared.delegate?.window??.rootViewController {
            window.view.addSubview(self)
        }
    }
    
    private func createTitle(title: String) {
        titleLabel.font = titleFont
        titleLabel.text = title
        titleLabel.frame.origin.y = height + 2
        let titleLabelSize = titleLabel.sizeThatFits(maxSize)
        handleSize(size: titleLabelSize)
        titleLabel.frame.size = titleLabelSize
        titleLabel.textColor = self.dialogTitleTextColor
        dialogView.addSubview(titleLabel)
    }
    
    private func createMessage(message: String) {
        messageLabel.font = messageFont
        messageLabel.text = message
        messageLabel.frame.origin.y = height
        let messageLabelSize = messageLabel.sizeThatFits(maxSize)
        messageLabel.frame.size = messageLabelSize
        messageLabel.textColor = self.dialogMessageTextColor
        handleSize(size: messageLabelSize)
        dialogView.addSubview(messageLabel)
    }
    
    private func createImage(image: UIImage) {
        imageView.image = image.withRenderingMode(.alwaysTemplate)
        imageView.frame.origin.y = height
        imageView.frame.size = imageSize
        imageView.tintColor = self.dialogImageColor
        handleSize(size: imageSize)
        dialogView.addSubview(imageView)
    }
    
    private func createDialog() {
        centerAll()
        height += paddingTopAndBottom
        dialogView.frame.size = CGSize(width: width, height: height)
        dialogView.backgroundColor = self.dialogBackgroundColor
        dialogView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(dialogView)
        self.dialogView.center = self.center
        self.dialogView.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(dialogView)
        } else if let window = UIApplication.shared.delegate?.window??.rootViewController {
            window.view.addSubview(self)
        }
    }
    
    private func centerAll() {
        if ((messageLabel.text) != nil) {
            messageLabel.frame.origin.x = (width - messageLabel.frame.width) / 2
        }
        
        if ((titleLabel.text) != nil) {
            titleLabel.frame.origin.x = (width - titleLabel.frame.width) / 2
        }
        
        if ((imageView.image) != nil) {
            imageView.frame.origin.x = (width - imageView.frame.width) / 2
        }
    }
    
    private func handleSize(size: CGSize) {
        if width < size.width + paddingFromSides * 2 {
            width = size.width + paddingFromSides * 2
        }
        if paddingTopAndBottom != paddingSingleTextOnly {
            height += seperatorHeight
        }
        height += size.height
    }
    
    private func showAnimation() {
        UIView.animate(withDuration: duration, animations: {
            if self.overlay {
                self.backgroundView.alpha = self.overlayOpacity
                self.dialogView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            self.dialogView.alpha = 1
        })
    }
    public func show(onComplete: (() ->  Void)? = nil) {
        if let complete = onComplete {
            self.onComplete = complete
        }
        calculations()
        
        if self.overlay {
            if blurOverlay {
                createBlurOverlay()
            } else {
                createOverlay()
            }
        }
        
        if let img = image {
            createImage(image: img)
        }
        if let title = title {
            createTitle(title: title)
        }
        if let message = message {
            createMessage(message: message)
        }
        createDialog()
        showAnimation()
        delayWithSeconds(autoHideAfterSeconds) {
            self.dismiss()
        }
    }
    
    public func dismiss(){
        UIView.animate(withDuration: duration, animations: {
            if self.overlay {
                self.backgroundView.alpha = 0
            }
            self.dialogView.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
            self.dialogView.alpha = 0
        }, completion: { (completed) in
            self.dialogView.removeFromSuperview()
            if (self.overlay)
            {
                self.backgroundView.removeFromSuperview()
            }
            self.removeFromSuperview()
            if let completionHandler = self.onComplete {
                completionHandler()
            }
        })
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
}
