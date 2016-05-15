//
//  MapViewController.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 12/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var userLocation = CLLocationCoordinate2D()
    
    var userRegion = MKCoordinateRegion()
    
    var locationManager = CLLocationManager() // håndterer positioner
    
    var relocation : Bool = false
    
    //private var minDist : CLLocationDistance = 100000.0 // afstand (til minimum)

    var meal = Meal()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets the delegate to be self
        locationManager.delegate = self
        
        // set the disired location to be best possible
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // We only want to use locationmanager when the app is used
        locationManager.requestWhenInUseAuthorization()
        
        
        print(meal.name)
        textSearch(meal.name)
        // Do any additional setup after loading the view.
        
    }

    func setRegion(){
        self.mapView.setRegion(self.userRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus){ // when authorization is changed
        print ("Authorization status changed to \(status.rawValue)")
        switch status {
        case .Authorized, .AuthorizedWhenInUse:
            locationManager.startUpdatingLocation() // method that start looking for a location
            print("started updating")
            mapView.showsUserLocation = true
            relocation = true
            
        default:
            locationManager.stopUpdatingLocation()
            print("stopped updating")
            mapView.showsUserLocation = false
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // last location updated
        let location = locations.last
        
        // The location of the user
        self.userLocation = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.userRegion = region
        self.mapView.setRegion(region, animated: true)
        
        if relocation{
            locationManager.stopUpdatingLocation()
            relocation = false
        }
    }//end locationManager
    
    func textSearch (searchString : String){ // egen funktion til at lede efter string fra UItextfiled via MapKit metode
        
        let request = MKLocalSearchRequest() // Core Location søgefunktion
        request.naturalLanguageQuery = searchString // hvad der skal søges efter udfra UItextfield indhold
        request.region = self.userRegion // området der søges udfra
        
        let search = MKLocalSearch(request: request) //udførslen af selve søgningen via MKLocalSearch
        search.startWithCompletionHandler { (response, error) in // processerer søgeresultater (respons.mapItems = liste af mapItems)
            guard let response = response else {
                print("Search error: \(error)")
                return
            }
            
            for item in response.mapItems { // looper igennem listen af mapItems
                print("Name = \(item.name!)") // printer resultaterne i konsollen
                
                let annotation = MKPointAnnotation() // lav annotation for hver item
                annotation.coordinate = item.placemark.coordinate // assign koordinat
                annotation.title = item.name // assign titel
                self.mapView.addAnnotation(annotation) // placer pin
                
            }
        }
        
    }// end textSearch

}
