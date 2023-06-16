//
//  SearchViewController.swift
//  HelloCity
//
//  Created by 최영주 on 2023/06/11.
//

import UIKit
import SnapKit
import TMapSDK
import CoreLocation

class SearchViewController: UIViewController, TMapViewDelegate, CLLocationManagerDelegate, TMapTapiDelegate{
    
    // singleton 으로 데이터 받아오기
    let getAPIData = GetAPIData.shared
    var locationManager = CLLocationManager()
    
    let mapContainerView = UIView()
    // T Map
    var mapView:TMapView?
    let apiKey:String = "pJk1X80PJSeT5eRQyRbB42Owe2j0sgs8AxHN7Wb0"
    var nowLat:CLLocationDegrees = 37.5665
    var nowLong:CLLocationDegrees = 127.0092
    var mPosition:CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 37.5665, longitude: 127.0092)


    let searchView = UIView()
    var startTextField = UITextField(frame: CGRect(x: 76, y: 64, width: 233, height: 25))
    var endTextField = UITextField(frame: CGRect(x: 76, y: 135, width: 233, height: 25))
    
    lazy var endButton : UIButton = {
        let button = UIButton()
        button.setTitle("목적지를 입력하세요", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(changeBtnTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    
    let startTextPlaceHolder = "출발지를 입력하세요"
    let endTextPlaceHolder = "목적지를 입력하세요"
    
    var lineBar = UIView(frame: CGRect(x: 25, y: 0, width: 299, height: 0))
    var startIcon = UIImageView()
    
    lazy var startButton : UIButton = {
        let button = UIButton()
        button.setTitle("출발지를 입력하세요", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(movePosition), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    var endIcon = UIImageView()
    lazy var changeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "multiple_stop"), for: .normal)
        button.addTarget(self, action: #selector(changeBtnTapped), for: .touchUpInside)
        return button
    }() // lazy 를 사용하면 처음 사용 될 때 데이터를 생성하는 것을 의미
     
    
    // MAP Component 
    var markers:Array<TMapMarker> = []
    var polylines:Array<TMapPolyline> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Call API
        // getAPIData.getHotelList()
        
        // MARK: - SearchView
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 20
        searchView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        
        lineBar.layer.borderWidth = 5.0
        lineBar.layer.borderColor = UIColor.blue.cgColor
        //UIColor(red: 226, green: 226, blue: 226, alpha: 100).cgColor
        
        startIcon.image = UIImage(named: "location")
        startIcon.frame = CGRect(x: 30, y: 67, width: 20, height: 20)
        endIcon.image = UIImage(named: "drop")
        endIcon.frame = CGRect(x: 30, y: 137, width: 20, height: 20)
        lineBar.frame = CGRect(x: 25, y: 110, width: 299, height: 0)
        startButton.frame = CGRect(x: 76, y: 64, width: 233, height: 25)
        changeButton.frame = CGRect(x: 330, y: 93, width: 34, height: 34)
        endButton.frame = CGRect(x: 76, y: 135, width: 233, height: 25)

        self.searchView.addSubview(startIcon)
        self.searchView.addSubview(startTextField)
    //    self.searchView.addSubview(lineBar)
        self.searchView.addSubview(endButton)
        self.searchView.addSubview(endIcon)
        self.searchView.addSubview(changeButton)
        
        startTextField.attributedPlaceholder = NSAttributedString(string: "출발지를 입력하세요",  attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
        endTextField.placeholder = endTextPlaceHolder
        
        TMapApi.setSKTMapAuthenticationWithDelegate(self, apiKey: apiKey)
        
        // MARK: - MapView Setting
        self.mapView = TMapView(frame: mapContainerView.frame)
        self.mapView?.delegate = self
        self.mapView?.setApiKey(apiKey)
        mapContainerView.addSubview(self.mapView!)
        
        self.view.addSubview(mapContainerView)
        
        self.searchView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        self.view.addSubview(searchView)
        
        mapContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
  
    }
    
    
    @objc func changeBtnTapped(sender: UIButton) {
         print("btn Tapped ! ")
         let nextVC = RecentSearchViewController()
         self.navigationController?.pushViewController(nextVC, animated: true)
     }
    
    @objc func movePosition(sender: UIButton) {
        self.mapView?.setCenter(mPosition)
        self.mapView?.setZoom(11)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        if let location = locations.first {
            print("위도 : \(location.coordinate.latitude)")
            print("경도 : \(location.coordinate.longitude)")
            nowLat = CLLocationDegrees(location.coordinate.latitude)
            nowLong = CLLocationDegrees(location.coordinate.longitude)
        }
    }

    
    
    
}

//extension ViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard string != "\n" else {
//
//            return false
//        }
//        return true
//    }
//}
