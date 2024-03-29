//
//  ViewController.swift
//  MapKitApp
//
//  Created by Merve on 29.01.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var mapKitView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateMapView()
    }
    
    private func configurateMapView() {
     
        let initialLocation = CLLocation(latitude: 40.2234, longitude: 27.2423)
        mapKitView.centerToLocation(initialLocation)

        // belirli bir noktalaya kadar uzaklaşılabiliyor. Sınırlandırmak için.
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapKitView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    @IBAction func myHomeTapped(_ sender: UIButton) {

        mapKitView.centerToLocation(CLLocation(latitude: 40.2234, longitude: 27.2423))
    }

    @IBAction func myWorkPlaceTapped(_ sender: UIButton) {

        mapKitView.centerToLocation(CLLocation(latitude: 40.145723830801444, longitude: 26.402719997731456))
    }

    @IBAction func MerveHomeTapped(_ sender: UIButton) {

        mapKitView.centerToLocation(CLLocation(latitude: 40.145723830801444, longitude: 26.402719997731456))
    }

    @IBAction func AnkaraLocationTapped(_ sender: UIButton) {

        mapKitView.centerToLocation(CLLocation(latitude: 39.9306636270827, longitude: 32.859638507418296))
    }

    @IBAction func istLocalitonTapped(_ sender: UIButton) {

        mapKitView.centerToLocation(CLLocation(latitude: 40.8986111, longitude: 29.3091667))
    }

    @IBAction func izmirLocationTapped(_ sender: UIButton) {

        mapKitView.centerToLocation(CLLocation(latitude: 38.42077518110413, longitude: 27.142506136960577))
    }
}

private extension MKMapView {

  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 5000
  ) {

      let annotation = MKPointAnnotation()
      let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: regionRadius,
        longitudinalMeters: regionRadius)
      annotation.coordinate = location.coordinate
      addAnnotation(annotation)
      setRegion(coordinateRegion, animated: true)
  }
}
