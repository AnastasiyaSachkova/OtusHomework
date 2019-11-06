//
//  BenchmarkCollectionViewCell.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

class BenchmarkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var chartView: PieChartView!
    private var counter = 0
    weak var timer: TimerModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.delegate = nil
    }
        
    func set(data:FakeData) {
        title.text = data.name
        
    }

    func setupTimer() {
        guard let model = timer else { return }
        model.startOrStopTimer()
    }
    
    func removeTimer() {
        guard let model = timer else { return }
        model.removeTimer()
    }
    
    private func updateChartData(onInterval: CGFloat, offInterval: CGFloat) {
      
       let chartData = [
        Pie(title: "pie1", value: onInterval, color: UIColor.random),
        Pie(title: "pie2", value: offInterval, color: UIColor.random)
             ]
        chartView.update(values: chartData)
             chartView.setNeedsDisplay()
    }
    
}

extension BenchmarkCollectionViewCell: TimerModelDelegate {
    func updateTimerTick(sec: Int) {
        title.text = Double(sec).stringFromTimeInterval()//"\(sec)"
        updateChartData(onInterval: CGFloat(sec), offInterval: 1)
    }
}

extension TimeInterval{
    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        return String(format: "%0.2d:%0.2d",minutes,seconds)
        
    }
}
