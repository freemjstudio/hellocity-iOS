//
//  CategoryListViewController.swift
//  HelloCity
//
//  Created by 최영주 on 2023/06/16.
//

import UIKit
import SnapKit

class CategoryListViewController: UIViewController {
    
    var categoryName: String?
    
    // Create an array of card data
    let cardData = [["덕인관 신세계 강남점", "기품있는 한식집"], ["평안도 족발집", "평점 5점의 전통있는 족발집"], ["미진", "명동의 명품 소바면 미슐랭이라는 타이틀까지"]]
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "backButtonImage"), for: .normal) // Set the image for the back button
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(25) // Set the desired smaller size for the back button
        }
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        
        let topLabel = UILabel()
        topLabel.text = "스페셜피플 추천 " + categoryName!
        topLabel.textColor = .black
        topLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        view.addSubview(topLabel)
        
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-85)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(50)
        }
        
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        // Create a content view inside the scroll view
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        
        // Create cards inside the content view
        var previousCard: UIView?
        for cardText in cardData {
            let cardView = UIView()
//            cardView.backgroundColor = .white // Set the card background color to white
            cardView.layer.cornerRadius = 8
            contentView.addSubview(cardView)

            // Create constraints for the card view
            cardView.snp.makeConstraints { make in
                make.top.equalTo(previousCard?.snp.bottom ?? contentView.snp.top).offset(16)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(250) // Adjust the height of the card as needed
            }
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
            cardView.addGestureRecognizer(tapGestureRecognizer)

            let imageView = UIImageView()
            imageView.image = UIImage(named: "food1")
            if (cardText[0] == "평안도 족발집") {
                imageView.image = UIImage(named: "food2")
            }
            if (cardText[0] == "미진") {
                imageView.image = UIImage(named: "food3")
            }
            
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true // Ensure the image is clipped within the rounded corners
            imageView.layer.cornerRadius = 20
            cardView.addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview().inset(10)
                make.height.equalTo(150)
            }

            // Add a label to the cardView
            let label = UILabel()
            label.text = cardText[0]
            label.textAlignment = .center
            label.textColor = .black
            cardView.addSubview(label)

            // Create constraints for the label
            label.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(15)
            }
            
            // Add a label to the cardView
            let postLabel = UILabel()
            postLabel.text = cardText[1]
            postLabel.textAlignment = .center
            postLabel.textColor = .lightGray
            postLabel.font = UIFont.systemFont(ofSize: 14)
            cardView.addSubview(postLabel)
            
            // Create constraints for the label
            postLabel.snp.makeConstraints { make in
                make.top.equalTo(label.snp.bottom)
                make.left.equalToSuperview().inset(15)
                make.bottom.equalToSuperview().inset(20)
            }
            
            previousCard = cardView
        }

        // Set the content size of the scroll view
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(previousCard?.snp.bottom ?? contentView.snp.bottom).offset(16)
        }
    }
    
    @objc func backButtonTapped() {
        // Handle back button tap event
        navigationController?.popViewController(animated: true)
    }
    
    @objc func viewTapped() {
        // Perform your desired action here, such as navigating to a new view controller
        let nextViewController = CategoryDetailViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
