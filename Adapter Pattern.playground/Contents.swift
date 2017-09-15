

// We have Old music system and we want to add a bluetooth technolgy to play and stop old music system . So instead of making New Bluetooth Music system , we made a Adapter Class that will make Old music system work with bluetooth .

// i Target
protocol MusicSystem {
    
    func play()
    func stop()
}


//Adaptee Class
class OldMusicSystem:MusicSystem{
    
    func play(){
        print("Old Music system Playing")
    }
    
    func stop(){
        print("Old Music system Stoped")
    }
    
    init() {
        
    }
}



// Adapter Class
class BluetoothMusicSystem:MusicSystem{
    
    var oldSystem:OldMusicSystem
    
    init(musicSystem:OldMusicSystem) {
        self.oldSystem = musicSystem
    }
    
    func play(){
        self.oldSystem.play()
    }
    
    func stop(){
        self.oldSystem.stop()
    }
 
}


//Client
let oldMusicSystem = OldMusicSystem()
let bluetoothMusicSystem = BluetoothMusicSystem(musicSystem: oldMusicSystem)
bluetoothMusicSystem.play()
bluetoothMusicSystem.stop()



