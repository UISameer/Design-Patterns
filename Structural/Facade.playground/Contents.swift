import Foundation

class AudioPlayer {
    
    func loadSong() {
        print("Loading song...")
    }
    
    func playSong() {
        print("Playing song...")
    }
    
    func pauseSong() {
        print("Pausing song...")
    }
    
    func stopSong() {
        print("Stopping song...")
    }
}


class AudioPlayerFacade {
    
    private let audioPlayer = AudioPlayer()
    
    func playMusic() {
        audioPlayer.loadSong()
        audioPlayer.playSong()
    }
    
    func stopMusic() {
        audioPlayer.stopSong()
    }
    
    func pauseMusic() {
        audioPlayer.pauseSong()
    }
}


let audioPlayerFacade = AudioPlayerFacade()
audioPlayerFacade.playMusic()
audioPlayerFacade.pauseMusic()
audioPlayerFacade.stopMusic()

