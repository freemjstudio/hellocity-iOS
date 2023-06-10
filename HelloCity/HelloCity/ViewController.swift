//
//  ViewController.swift
//  HelloCity
//
//  Created by 우민지 on 2023/06/09.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // Create an array of card data
    let cardData = ["가족과 방문하기 좋은 충청도", "이맘때 더 이쁜 마포"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            
        // Create an ImageView
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "icon")
        iconImageView.contentMode = .scaleAspectFill
        view.addSubview(iconImageView)
        
        // Create constraints using SnapKit
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(15)
            make.width.equalTo(150)
        }
        
        let recommendLabel = UILabel()
        recommendLabel.text = "스페셜피플 추천여행지"
        recommendLabel.textColor = .black
        recommendLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        view.addSubview(recommendLabel)
        
        recommendLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(30)
        }
        
        let recommendAllBtn = UIButton()
        recommendAllBtn.setTitle("전체보기", for: .normal)
        recommendAllBtn.setTitleColor(.black, for: .normal)
        recommendAllBtn.backgroundColor = view.backgroundColor
        recommendAllBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        recommendAllBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(recommendAllBtn)
        
        recommendAllBtn.snp.makeConstraints { make in
            make.top.equalTo(recommendLabel.snp.top)
            make.bottom.equalTo(recommendLabel.snp.bottom)
            make.right.equalToSuperview().offset(-20)
        }
        
        
        // Create a HorizontalScrollView
        let recommendScrollView = UIScrollView()
        recommendScrollView.showsHorizontalScrollIndicator = false
        view.addSubview(recommendScrollView)

        recommendScrollView.snp.makeConstraints { make in
            make.top.equalTo(recommendLabel.snp.bottom).offset(30)
            make.left.right.equalToSuperview().offset(20)
            make.height.equalTo(350)
        }

        // Create a contentView to hold the card views
        let contentView = UIView()
        recommendScrollView.addSubview(contentView)

        // Create constraints for the contentView
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview() // Match the height of the scrollView
        }
        
        // Create cards inside the contentView
        var previousCard: UIView?
        for cardText in cardData {
            let cardView = UIView()
            cardView.backgroundColor = .white  // Set the card background color to white
            cardView.layer.cornerRadius = 20
            contentView.addSubview(cardView)
            

            // Create constraints for the cardView
            cardView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(300)
                if let previousCard = previousCard {
                    make.left.equalTo(previousCard.snp.right).offset(10)
                } else {
                    make.left.equalToSuperview().offset(10)
                }
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

        // Set the content size of the contentView
        contentView.snp.makeConstraints { make in
            make.right.equalTo(previousCard!) // Match the width to the last card view
        }
        
        // Set the content size of the scrollView
        recommendScrollView.contentSize = contentView.frame.size
        
        
        let categoryLabel = UILabel()
        categoryLabel.text = "카테고리"
        categoryLabel.textColor = .black
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        view.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(recommendScrollView.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(30)
        }
        
       
        let imageContainerView1 = UIView()
        view.addSubview(imageContainerView1)

        imageContainerView1.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(20)
            make.width.equalTo(view.snp.width).multipliedBy(0.4)
            make.height.equalTo(imageContainerView1.snp.width)
            make.left.equalToSuperview().offset(20)
        }

        let categoryImageView1 = UIImageView()
        categoryImageView1.image = UIImage(named: "sampleImage")
        categoryImageView1.contentMode = .scaleAspectFill
        categoryImageView1.clipsToBounds = true
        categoryImageView1.layer.cornerRadius = 20
        imageContainerView1.addSubview(categoryImageView1)

        let categoryLabel1 = UILabel()
        categoryLabel1.text = "Label 1"
        categoryLabel1.textAlignment = .center
        imageContainerView1.addSubview(categoryLabel1)

        categoryImageView1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        categoryLabel1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let imageContainerView2 = UIView()
        view.addSubview(imageContainerView2)

        imageContainerView2.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.4)
            make.height.equalTo(imageContainerView2.snp.width)
            make.left.equalTo(imageContainerView1.snp.right).offset(20)
            make.top.equalTo(imageContainerView1.snp.top)
            make.bottom.equalTo(imageContainerView1.snp.bottom)
        }

        let categoryImageView2 = UIImageView()
        categoryImageView2.image = UIImage(named: "sampleImage")
        categoryImageView2.contentMode = .scaleAspectFill
        categoryImageView2.clipsToBounds = true
        categoryImageView2.layer.cornerRadius = 20
        imageContainerView2.addSubview(categoryImageView2)

        let categoryLabel2 = UILabel()
        categoryLabel2.text = "Label 2"
        categoryLabel2.textAlignment = .center
        imageContainerView2.addSubview(categoryLabel2)

        categoryImageView2.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        categoryLabel2.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let imageContainerView3 = UIView()
        view.addSubview(imageContainerView3)

        imageContainerView3.snp.makeConstraints { make in
            make.top.equalTo(imageContainerView1.snp.bottom).offset(5)
            make.width.equalTo(view.snp.width).multipliedBy(0.4)
            make.height.equalTo(imageContainerView3.snp.width)
            make.left.equalToSuperview().offset(20)
        }

        let categoryImageView3 = UIImageView()
        categoryImageView3.image = UIImage(named: "sampleImage")
        categoryImageView3.contentMode = .scaleAspectFill
        categoryImageView3.clipsToBounds = true
        categoryImageView3.layer.cornerRadius = 20
        imageContainerView3.addSubview(categoryImageView3)

        let categoryLabel3 = UILabel()
        categoryLabel3.text = "Label 3"
        categoryLabel3.textAlignment = .center
        imageContainerView3.addSubview(categoryLabel3)

        categoryImageView3.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        categoryLabel3.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let imageContainerView4 = UIView()
        view.addSubview(imageContainerView4)

        imageContainerView4.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.4)
            make.height.equalTo(imageContainerView4.snp.width)
            make.left.equalTo(imageContainerView3.snp.right).offset(20)
            make.top.equalTo(imageContainerView3.snp.top)
            make.bottom.equalTo(imageContainerView3.snp.bottom)
        }

        let categoryImageView4 = UIImageView()
        categoryImageView4.image = UIImage(named: "sampleImage")
        categoryImageView4.contentMode = .scaleAspectFill
        categoryImageView4.clipsToBounds = true
        categoryImageView4.layer.cornerRadius = 20
        imageContainerView4.addSubview(categoryImageView4)

        let categoryLabel4 = UILabel()
        categoryLabel4.text = "Label 4"
        categoryLabel4.textAlignment = .center
        imageContainerView4.addSubview(categoryLabel4)

        categoryImageView4.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        categoryLabel4.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }

}

