// Copyright (C) 2019 Parrot Drones SAS
//
//    Redistribution and use in source and binary forms, with or without
//    modification, are permitted provided that the following conditions
//    are met:
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in
//      the documentation and/or other materials provided with the
//      distribution.
//    * Neither the name of the Parrot Company nor the names
//      of its contributors may be used to endorse or promote products
//      derived from this software without specific prior written
//      permission.
//
//    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
//    PARROT COMPANY BE LIABLE FOR ANY DIRECT, INDIRECT,
//    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
//    OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
//    AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
//    OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
//    SUCH DAMAGE.
import Foundation

/// Core implementation of the dolly slide animation
public class DollySlideCore: AnimationCore, DollySlideAnimation {
    public let speed: Double

    public let angle: Double

    public let horizontalDistance: Double

    public let mode: AnimationMode

    /// Constructor
    ///
    /// - Parameters:
    ///   - speed: speed, in meters per second
    ///   - angle: angle, in degrees
    ///   - verticalDistance: vertical in distance, in meters
    ///   - mode: execution mode
    public init(speed: Double, angle: Double, horizontalDistance: Double, mode: AnimationMode) {
        self.speed = speed
        self.angle = angle
        self.horizontalDistance = horizontalDistance
        self.mode = mode
        super.init(type: .dollySlide)
        matcher = self
    }
}

/// Extension of DollySlideCore that implements AnimationCoreMatcher
extension DollySlideCore: AnimationCoreMatcher {
    public func matchesConfig(_ config: AnimationConfig) -> Bool {
        guard let cfg = config as? DollySlideAnimationConfig else {
            return false
        }
        return (cfg.speed == nil || cfg.speed! ≈≈ speed) &&
            (cfg.angle == nil || cfg.angle! ≈≈ angle) &&
            (cfg.horizontalDistance == nil || cfg.horizontalDistance! ≈≈ horizontalDistance) &&
            (cfg.mode == nil || cfg.mode == mode)

    }

    func equalsTo(_ other: AnimationCore) -> Bool {
        guard let anim = other as? DollySlideCore else {
            return false
        }
        return speed == anim.speed && angle == anim.angle && horizontalDistance == anim.horizontalDistance &&
            mode == anim.mode
    }
}
