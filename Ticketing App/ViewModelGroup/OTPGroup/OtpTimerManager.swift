//
//  OtpTimerManager.swift
//  Ticketing App
//
//  Created by nikhil tiwari on 05/04/25.
//

import Foundation
import Combine

class OtpTimerManager: ObservableObject {
    @Published var countdown: Float = 30
    @Published var isCountdownRunning: Bool = false
    
    var timer: Timer?

    /// Starts the countdown timer
    func startTimer() {
        countdown = 30
        isCountdownRunning = true

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            if self.countdown > 0 {
                self.countdown -= 1
            }

            if self.countdown == 0 {
                self.timer?.invalidate()
                self.isCountdownRunning = false
            }
        }
    }

    /// Stops the countdown timer
    func stopTimer() {
        timer?.invalidate()
        isCountdownRunning = false
    }

    /// Returns the countdown formatted as MM : SS
    var formattedTime: String {
        let totalSeconds = Int(countdown)
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d : %02d", minutes, seconds)
    }
}
