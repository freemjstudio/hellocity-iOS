//
//  ResultViewController.swift
//  HelloCity
//
//  Created by 우민지 on 2023/06/15.
//

import Foundation
import UIKit
import SnapKit
import TMapSDK
import CoreLocation

class ResultViewController: UIViewController, TMapViewDelegate {

    let mapContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 393, height: 710))
    var mapView:TMapView?
    let apiKey:String = "pJk1X80PJSeT5eRQyRbB42Owe2j0sgs8AxHN7Wb0"
    
    // MAP Component
    var markers:Array<TMapMarker> = []
    var polylines:Array<TMapPolyline> = []
    let searchView = UIView()
    
    let comment = UILabel()
    let time = UILabel()
    var progress = UIImageView(image: UIImage(named: "progress"))

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        searchRoute()
    }
    
    func initializeView() {
        
        self.time.frame = CGRect(x: 20, y: 91, width: 59, height: 38)
        self.time.font = time.font.withSize(27)
        self.time.text = "50분"
        self.time.sizeToFit()
        self.progress.frame = CGRect(x: 20, y: 135, width: 350, height: 28)
        
        
        self.comment.frame = CGRect(x: 20, y: 53, width: 143, height: 27)
        self.comment.text = "스페셜 피플 추천 경로"
        self.comment.font = comment.font.withSize(14)
        self.comment.layer.cornerRadius = 5
        self.comment.layer.borderColor = UIColor.black.cgColor
        
        self.mapView = TMapView(frame: CGRect(x: 0, y: 0, width: 393, height: 710))
        self.mapView?.delegate = self
        self.mapView?.setApiKey(apiKey)
        mapContainerView.addSubview(self.mapView!)
        self.view.addSubview(mapContainerView)
        mapContainerView.backgroundColor = .white
        
        mapContainerView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 20
        searchView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        self.searchView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        self.view.addSubview(searchView)
        self.searchView.addSubview(comment)
        self.view.addSubview(time)
        self.searchView.addSubview(progress)
    }
    
    // MARK: - 경로탐색
    
    public func searchRoute() {
        let pathData = TMapPathData()
        var startPoint = CLLocationCoordinate2D(latitude: 37.5657, longitude: 127.0090)
        var endPoint = CLLocationCoordinate2D(latitude: 37.5806, longitude: 127.01783798815)
        
        pathData.findPathData(startPoint: startPoint, endPoint: endPoint) { (result, error)->Void in
            if let polyline = result {
                DispatchQueue.main.async {
                    let marker1 = TMapMarker(position: startPoint)
                    marker1.map = self.mapView
                    marker1.title = "출발지"
                    self.markers.append(marker1)
                    
                    let marker2 = TMapMarker(position: endPoint)
                    marker2.map = self.mapView
                    marker2.title = "목적지"
                    self.markers.append(marker2)
                    
                    polyline.map = self.mapView
                    self.polylines.append(polyline)
                    self.mapView?.fitMapBoundsWithPolylines(self.polylines)
                }
            }
        }
    }
    
    
}
