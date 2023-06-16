//
//  CategoryDetailViewController.swift
//  HelloCity
//
//  Created by 최영주 on 2023/06/16.
//
import UIKit
import SnapKit

class CategoryDetailViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let imageScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "backButtonImage"), for: .normal) // Set the image for the back button
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(25) // Set the desired smaller size for the back button
        }
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
//            make.top.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(-150)
            
//            make.top.equalTo(view.safeAreaLayoutGuide).inset(-150)
            make.left.equalToSuperview().inset(-30)
            make.right.equalToSuperview().inset(-30)
            make.bottom.equalToSuperview()
            
        }
         
        // Add the image view at the top
        let imageView = UIImageView()
        imageView.image = UIImage(named: "guanghwamun")
        imageView.contentMode = .scaleAspectFit
        
        scrollView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(500)
        }
        
        // Create the first label beneath the image view
        let title = UILabel()
        title.text = "덕수궁 돌담길"
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 24)
        
        scrollView.addSubview(title)
        
        title.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(50)
        }
        
        let locationIcon = UIImageView()
        locationIcon.image = UIImage(named: "locationIcon")
        
        scrollView.addSubview(locationIcon)
        
        locationIcon.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(30)
            make.left.equalTo(title.snp.left)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        let location = UILabel()
        location.text = "서울특별시 중구 세종대로 99"
        location.textColor = .black
        
        scrollView.addSubview(location)
        location.snp.makeConstraints { make in
            make.left.equalTo(locationIcon.snp.right).offset(10)
            make.top.equalTo(locationIcon.snp.top)
            make.bottom.equalTo(locationIcon.snp.bottom)
        }
        
        // Create the horizontal scroll view
//        let imageScrollView = UIScrollView()
        imageScrollView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(imageScrollView)
        
        imageScrollView.snp.makeConstraints { make in
            make.top.equalTo(location.snp.bottom).offset(30)
            make.left.equalTo(locationIcon.snp.left)
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
       
        // Create the image view inside the scroll view
        let imageViewInScrollView = UIImageView()
        imageViewInScrollView.image = UIImage(named: "detailImage1")
        imageViewInScrollView.contentMode = .scaleAspectFit
        imageScrollView.addSubview(imageViewInScrollView)
        
        imageViewInScrollView.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalToSuperview()
        }
        
//        let verticalImageViewContainer = UIView()
//        
//        imageScrollView.addSubview(verticalImageViewContainer)
//        
//        verticalImageViewContainer.snp.makeConstraints { make in
//            make.top.bottom.equalToSuperview()
//            make.left.equalTo(imageViewInScrollView.snp.right).offset(10)
//            make.width.equalTo(200)
//            make.height.equalToSuperview()
//        }
//        
//        let imageViewInScrollView2 = UIImageView()
//        imageViewInScrollView.image = UIImage(named: "detailImage2")
//        imageViewInScrollView.contentMode = .scaleAspectFit
//        verticalImageViewContainer.addSubview(imageViewInScrollView2)
//        
//        imageViewInScrollView2.snp.makeConstraints { make in
//            make.top.left.equalToSuperview()
//            make.width.equalToSuperview()
//            make.height.equalToSuperview().dividedBy(2.1)
//        }
//        
//        
//        let imageViewInScrollView3 = UIImageView()
//        imageViewInScrollView.image = UIImage(named: "detailImage3")
//        imageViewInScrollView.contentMode = .scaleAspectFit
//        verticalImageViewContainer.addSubview(imageViewInScrollView3)

//        imageViewInScrollView3.snp.makeConstraints { make in
//            make.bottom.left.equalToSuperview()
//            make.top.equalTo(imageViewInScrollView2).offset(10)
//            make.width.equalToSuperview()
//            make.height.equalToSuperview().dividedBy(2.1)
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.frame.width, height: imageScrollView.frame.maxY)
    }
    
    @objc func backButtonTapped() {
        // Handle back button tap event
        navigationController?.popViewController(animated: true)
    }
    
}

