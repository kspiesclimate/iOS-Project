//
//  FieldsViewController.swift
//  testOpMngmt
//
//  Created by Tracey Ewart on 10/15/15.
//  Copyright © 2015 Katie Spies. All rights reserved.
//

import UIKit
import MapKit

class FieldsViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var fieldListData = [
        ["thumbnail":"thumb1", "name":"Homestead 45", "acres":"45", "lat":39.432411, "long":-84.817024],
        ["thumbnail":"thumb1", "name":"Back 40", "acres":"210", "lat":41.238100, "long":-85.853047],
        ["thumbnail":"thumb1", "name":"East of Highway", "acres":"120", "lat":41.260878, "long":-85.975274]
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        
        // set initial location in Inidana
        let initialLocation = CLLocation(latitude: 40.267194, longitude: -86.134902)
        
        centerMapOnLocation(initialLocation)
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        var fieldListDictionary = fieldListData[indexPath.row]
        let lat = fieldListDictionary["lat"] as! Double
        let long = fieldListDictionary["long"] as! Double
        
        let tappedLocation = CLLocation(latitude: lat, longitude: long)
        
        centerMapOnLocation(tappedLocation)
      
        print(lat)
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldListData.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("fieldCell")  as! FieldCell
        
        var fieldListDictionary = fieldListData[indexPath.row]
        let name = fieldListDictionary["name"] as! String
        let acres = fieldListDictionary["acres"] as! String
        let thumbnail = fieldListDictionary["thumbnail"] as! String

        
        cell.nameLabel.text = name
        cell.acresLabel.text = acres
        cell.thumbView.image = UIImage(named: thumbnail)
        
        return cell
    }
    

    let regionRadius: CLLocationDistance = 150000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
