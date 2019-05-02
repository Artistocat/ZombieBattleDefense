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
    func connected(peerID: MCPeerID)
    func zombieChanged(manager : ZombieService, zombieString: String)
}
class ZombieService: NSObject{
    
    
    var delegate: ZombieServiceDelegate?
    var valueWasChanged: (()->())?
    var connected:Bool{
        didSet{
            valueWasChanged?()
        }
    }
    //data is sent
    func send(zombieString:String)
    {
        NSLog("%@", "zombieData: \(zombieString) to \(session.connectedPeers.count) peers")
        if session.connectedPeers.count > 0 {
            do{
                try self.session.send(zombieString.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            } catch let error{
                NSLog("%@", "Error for sending: \(error)")
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
        super.init()
        self.serviceAdvertiser.delegate = self
        //self.serviceAdvertiser.startAdvertisingPeer()
        
        self.serviceBrowser.delegate=self
        //self.serviceBrowser.startBrowsingForPeers()
    }
    deinit{
        //self.serviceAdvertiser.stopAdvertisingPeer()
        //self.serviceBrowser.stopBrowsingForPeers()
    }
}
extension ZombieService: MCSessionDelegate{
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        switch state{
        case MCSessionState.connected:
            print("Connected to session: \(session)")
            connected=true
            delegate?.connected(peerID: peerID)
            
        case MCSessionState.connecting:
            print("Connecting to session: \(session)")
        default:
            print("Did not connect to session: \(session)")
        }
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices:
            session.connectedPeers.map{$0.displayName})
    }
   
    //data is received
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveData: \(data.count) bytes")
        
        let str = String(data: data, encoding: .utf8)!
        self.delegate?.zombieChanged(manager: self, zombieString: str)
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveStream")
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        NSLog("%@", "didStartReceivingResourceWithName")
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        NSLog("%@", "didFinishReceivingResourceWithName")
    }

}
extension ZombieService: MCNearbyServiceAdvertiserDelegate
{
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser,didNotStartAdvertisingPeer error: Error){
        NSLog("%@", "didNotStartAdvertisingPeer: \(error)")
    }
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping(Bool, MCSession?)-> Void){
        print("got invitation")
        //NSLog("%@", "didReceiveInvitationFromPeer \(peerID)")
        invitationHandler(true, self.session)
        self.delegate?.connected(peerID: peerID)
        //AdvertiseViewController.connected(PeerID: peerID)
        serviceAdvertiser.stopAdvertisingPeer()
    }
}
extension ZombieService : MCNearbyServiceBrowserDelegate
{
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error){
        NSLog("%@", "didNotStartBrowsingForPeers: \(error)")
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
