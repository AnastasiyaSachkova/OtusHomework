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
        setChart()
    }

    func setupTimer() {
        guard let model = timer else { return }
        model.startOrStopTimer()
    }
    
    func removeTimer() {
        guard let model = timer else { return }
        model.removeTimer()
    }
    
    private func setChart() {
        chartView.setSize(diameter: frame.height/4, spacing: 5)
        //updateChartData(onInterval: viewModel.intervalOn, offInterval: viewModel.intervalOff)
    }
    
    private func updateChartData(onInterval: CGFloat, offInterval: CGFloat) {
       
    }
}


extension BenchmarkCollectionViewCell: TimerModelDelegate {
    func updateTimerTick(sec: Int) {
        title.text = "\(sec)"
    }
}
