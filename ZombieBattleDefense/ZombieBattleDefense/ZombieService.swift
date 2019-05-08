//
//  ZombieService.swift
//  ZombieBattleDefense
//
//  Created by Webb, Carter J on 4/17/19.
//  Copyright © 2019 Example. All rights reserved.
//

import Foundation
import MultipeerConnectivity

protocol ZombieServiceDelegate {
    func connectedDevicesChanged(manager : ZombieService, connectedDevices: [String])
    func zombieReceived(manager : ZombieService, zombieString: String)
}
class ZombieService: NSObject{
    
    var dataFlopper:String = ""
    {
       didSet
       {
            zombieGot?()
        }
    }
    var zombieGot: (()->())?
    var delegate: ZombieServiceDelegate?
    var endGame:(()->())?
    var connection:Bool{
        didSet{
            endGame?()
        }
    }
    var valueWasChanged: (()->())?
    var connected:Bool{
        didSet{
            valueWasChanged?()
        }
    }
    //data is sent
    func send(zombieString:String)
    {
        print("zombieData: \(zombieString) to \(session.connectedPeers.count) peers")
       
        if session.connectedPeers.count > 0 {
            do{
                try self.session.send(zombieString.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            } catch let error{
                
            }
        }
    }
    
    private let ZombieServiceType = "example-zombie"
    
    let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    let serviceAdvertiser: MCNearbyServiceAdvertiser
    let serviceBrowser: MCNearbyServiceBrowser
    
    lazy var session: MCSession = {
        let session = MCSession(peer: self.myPeerId, securityIdentity:nil, encryptionPreference: .optional)
        session.delegate = self
        return session
    }()
    override init()
    {
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: ["name":myPeerId.displayName], serviceType: ZombieServiceType)
        self.serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: /*may change later*/ZombieServiceType)
        connected=false
        connection=true
        super.init()
        self.serviceAdvertiser.delegate = self
        self.serviceBrowser.delegate=self
    }
    deinit{

    }
}
extension ZombieService: MCSessionDelegate{
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        switch state{
        case MCSessionState.connected:
            print("Connected to session: \(session)")
            connected=true
           
            
        case MCSessionState.connecting:
            print("Connecting to session: \(session)")
        default:
            print("Did not connect to session: \(session)")
            connection = !connection
        }
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices:
            session.connectedPeers.map{$0.displayName})
    }
   
    //data is received
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        let str = String(data: data, encoding: .utf8)!
        dataFlopper=str
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
  
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
 
    }

}
extension ZombieService: MCNearbyServiceAdvertiserDelegate
{
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser,didNotStartAdvertisingPeer error: Error){
      
    }
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping(Bool, MCSession?)-> Void){
        print("got invitation")
        invitationHandler(true, self.session)
        
        //AdvertiseViewController.connected(PeerID: peerID)
        serviceAdvertiser.stopAdvertisingPeer()
    }
}
extension ZombieService : MCNearbyServiceBrowserDelegate
{
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error){

    }
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("found advertiser")
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 60)
        serviceBrowser.stopBrowsingForPeers()
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("lostPeer: \(peerID)")
    }
}
