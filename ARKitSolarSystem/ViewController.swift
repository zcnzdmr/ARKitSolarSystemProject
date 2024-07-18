//
//  ViewController.swift
//  ARKitSolarSystem
//
//  Created by Özcan on 18.07.2024.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let world = SCNSphere(radius: 0.5) // Burda bir küre şeklini yani geometrisin verdik.
        
        let worldmaterial = SCNMaterial() // Burda önce materyal oluşturuyoruz ki bu texture sonra buna bir texture yani image vereceğiz.
        
        worldmaterial.diffuse.contents = UIImage(named: "art.scnassets/sun.png") // Burda materyalimize texture'ımızı veriyoruz.
        
        world.materials = [worldmaterial] // world 3D şekli küresi bu materyal ile kaplansın texture'ı bu olsun diyorum.
        
        let node = SCNNode()
        
        node.position = SCNVector3(x: 0.1, y: 0.1, z: -0.5) //
        
        node.geometry = world
        
        sceneView.scene.rootNode.addChildNode(node)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
