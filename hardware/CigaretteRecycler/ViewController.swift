import UIKit
import CoreImage
import GPUImage
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var renderView: RenderView!
    @IBOutlet weak var faceDetectSwitch: UISwitch!

    let saturationFilter = SaturationAdjustment()
    let blendFilter = AlphaBlend()
    let histogram = Histogram(type:.red)
    let motionDetector = MotionDetector()
    let chroma = ChromaKeying()
    var camera:Camera!
    var counter = 0
    var total = 128
    var lastC = 0
    
    @IBOutlet weak var counter1: UILabel!
    
    @IBOutlet weak var counter2: UILabel!
    @IBOutlet weak var qr: UIImageView!
    
    func timestamp() -> Int {
        return (Int(Date().timeIntervalSince1970))
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    func motionDetection (pos: Position, alpha: Float) {
        print("Motion \(pos) \(alpha)")
        if(pos.x < 0.10 && pos.y > 0.03 && pos.y < 0.10) {
            DispatchQueue.main.async {
                if(self.lastC + 10 < self.timestamp()) {
                    self.counter = 0
                    self.qr.image = self.generateQRCode(from: "Cigarette recycler \(self.total)")
                }
                if(self.lastC == self.timestamp()) { return }
                self.lastC = self.timestamp()
                self.counter1.text = "\(self.total)"
                self.counter2.text = "\(self.counter)"
                self.total =  self.total + 1
                self.counter = self.counter + 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            motionDetector.motionDetectedCallback = motionDetection;
            camera = try Camera(sessionPreset:.hd1280x720)
            camera.runBenchmark = false
            camera --> motionDetector --> renderView
            camera.startCapture()
        } catch {
            fatalError("Could not initialize rendering pipeline: \(error)")
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}
