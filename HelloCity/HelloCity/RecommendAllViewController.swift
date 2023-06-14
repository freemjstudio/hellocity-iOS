//
//  RecommendAllViewController.swift
//  HelloCity
//
//  Created by 최영주 on 2023/06/11.
//

import UIKit
import SnapKit

class RecommendAllViewController: UIViewController {
    
    let cardData = ["Card 1", "Card 2", "Card 3", "Card 4", "Card 5"]
    
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
        topLabel.text = "스페셜피플 추천 여행지"
        topLabel.textColor = .black
        topLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        view.addSubview(topLabel)
        
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-85)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(50)
        }
        
        let imageButton = UIButton()
        imageButton.setImage(UIImage(named: "filterImage"), for: .normal) // Set the image for the button
        imageButton.setTitleColor(.black, for: .normal) // Set the title color
        imageButton.titleLabel?.font = UIFont.systemFont(ofSize: 16) // Set the title font
        view.addSubview(imageButton)
        
        imageButton.snp.makeConstraints { make in
            make.top.equalTo(topLabel).offset(-30)
            make.height.equalTo(200)
            make.width.equalTo(200)
            make.left.equalToSuperview()
        }
        
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(imageButton.snp.bottom).offset(-80)
            make.left.right.bottom.equalToSuperview()
        }
        
        
        
        // Create a content view inside the scroll view
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview() // Match the width to the scroll view
        }

        
        // Create cards inside the content view
        var previousCard: UIView?
        for cardText in cardData {
            let cardView = UIView()
            cardView.backgroundColor = .white // Set the card background color to white
            cardView.layer.cornerRadius = 8
            contentView.addSubview(cardView)

            // Create constraints for the card view
            cardView.snp.makeConstraints { make in
                make.top.equalTo(previousCard?.snp.bottom ?? contentView.snp.top).offset(16)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(350) // Adjust the height of the card as needed
            }

            let imageView = UIImageView()
            imageView.image = UIImage(named: "sampleImage")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true // Ensure the image is clipped within the rounded corners
            imageView.layer.cornerRadius = 20
            cardView.addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview().inset(10)
                make.height.equalTo(250)
            }

            // Add a label to the cardView
            let label = UILabel()
            label.text = cardText
            label.textAlignment = .center
            label.textColor = .black
            cardView.addSubview(label)

            // Create constraints for the label
            label.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom)
                make.left.equalToSuperview().inset(10)
            }
            
            // Add a label to the cardView
            let postLabel = UILabel()
            postLabel.text = "Latest Post"
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
            
            // Add a label to the cardView
            let viewLabel = UILabel()
            viewLabel.text = "10000 views"
            viewLabel.textAlignment = .center
            viewLabel.textColor = .lightGray
            viewLabel.font = UIFont.systemFont(ofSize: 14)
            cardView.addSubview(viewLabel)
            
            // Create constraints for the label
            viewLabel.snp.makeConstraints { make in
                make.top.equalTo(postLabel.snp.top)
                make.bottom.equalTo(postLabel.snp.bottom)
                make.right.equalToSuperview().inset(15)
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
}
