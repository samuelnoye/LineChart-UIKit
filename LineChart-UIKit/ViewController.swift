//
//  ViewController.swift
//  BarChart-UIKit
//
//  Created by Samuel Noye on 23/05/2022.
//

import UIKit
import Charts
import TinyConstraints

class ViewController: UIViewController, ChartViewDelegate {

    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.isUserInteractionEnabled = false
        chartView.setNeedsDisplay()
        chartView.setScaleEnabled(true)
        chartView.chartDescription?.enabled = true
        chartView.legend.enabled = false
        chartView.dragEnabled = false
        chartView.backgroundColor = .systemPink
        chartView.rightAxis.enabled = false
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(10, force: false)
        yAxis.removeAllLimitLines()
        yAxis.axisMinimum = 0
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.setLabelCount(10, force: false)
        xAxis.labelTextColor = .white
        xAxis.axisLineColor = .white
        xAxis.granularity = 1
        xAxis.granularityEnabled = true
     
        
        
        
        
        chartView.animate(xAxisDuration: 2.5)
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(lineChartView)
        lineChartView.delegate = self
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        setData()
    }

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData(){
        //Get optimal speed data
        var optimalValues = [ChartDataEntry]()
        for x in 0..<10 {
            optimalValues.append(ChartDataEntry(x: Double(x), y: Double(Int.random(in: 1...10))))
        }
        //Get actual speed data
        var actualValues = [ChartDataEntry]()
        for x in 0..<10 {
            actualValues.append(ChartDataEntry(x: Double(x), y: Double(Int.random(in: 1...10))))
        }
        //set data
        let optimalSet = LineChartDataSet(entries: optimalValues, label: nil)
        let actualSet = LineChartDataSet(entries: actualValues, label: nil)
        
        //Optimal data line styling
        optimalSet.drawCirclesEnabled = false
        optimalSet.lineWidth = 1
        optimalSet.setColor(.white)
      //  optimalSet.setColor(optimalSet <= actualSet ? .white : .red)
        optimalSet.mode = .cubicBezier
        //Actual data line styling
        actualSet.drawCirclesEnabled = false
        actualSet.lineWidth = 1
        actualSet.setColor(.black)
        actualSet.mode = .cubicBezier
    
        //combine datasets to data
        let data = LineChartData(dataSets:[optimalSet,actualSet])
        //data styling
        data.setDrawValues(false)
        
        //pass data to graph
        lineChartView.data = data
     
    }
    
//    let yValues: [ChartDataEntry] = [
//        ChartDataEntry(x: 0.0, y: 5.0),
//        ChartDataEntry(x: 1.0, y: 5.5),
//        ChartDataEntry(x: 2.0, y: 8.0),
//        ChartDataEntry(x: 3.0, y: 7.0),
//        ChartDataEntry(x: 4.0, y: 6.0),
//        ChartDataEntry(x: 5.0, y: 6.0),
//        ChartDataEntry(x: 6.0, y: 5.0),
//        ChartDataEntry(x: 7.0, y: 7.0),
//        ChartDataEntry(x: 8.0, y: 8.0),
//        ChartDataEntry(x: 9.0, y: 9.0),
//        ChartDataEntry(x: 10.0, y: 6.6),
//        ChartDataEntry(x: 11.0, y: 9.0),
//        ChartDataEntry(x: 12.0, y: 8.0),
//        ChartDataEntry(x: 13.0, y: 7.0),
//        ChartDataEntry(x: 14.0, y: 6.0),
//        ChartDataEntry(x: 15.0, y: 7.0),
//        ChartDataEntry(x: 16.0, y: 8.0),
//        ChartDataEntry(x: 17.0, y: 9.0),
//        ChartDataEntry(x: 18.0, y: 8.0),
//        ChartDataEntry(x: 19.0, y: 9.0),
//        ChartDataEntry(x: 20.0, y: 6.0)
//    ]
//    let xValues: [ChartDataEntry] = [
//        ChartDataEntry(x: 0.0, y: 9.0),
//        ChartDataEntry(x: 1.0, y: 2.0),
//        ChartDataEntry(x: 2.0, y: 4.0),
//        ChartDataEntry(x: 3.0, y: 3.0),
//        ChartDataEntry(x: 4.0, y: 5.0),
//        ChartDataEntry(x: 5.0, y: 9.0),
//        ChartDataEntry(x: 6.0, y: 6.0),
//        ChartDataEntry(x: 7.0, y: 12.0),
//        ChartDataEntry(x: 8.0, y: 5.0),
//        ChartDataEntry(x: 9.0, y: 3.0),
//        ChartDataEntry(x: 10.0, y: 10.0),
//        ChartDataEntry(x: 11.0, y: 12.0),
//        ChartDataEntry(x: 12.0, y: 10.0),
//        ChartDataEntry(x: 13.0, y: 6.0),
//        ChartDataEntry(x: 14.0, y: 15.0),
//        ChartDataEntry(x: 15.0, y: 3.0),
//        ChartDataEntry(x: 16.0, y: 8.0),
//        ChartDataEntry(x: 17.0, y: 4.0),
//        ChartDataEntry(x: 18.0, y: 5.0),
//        ChartDataEntry(x: 19.0, y: 3.0),
//        ChartDataEntry(x: 20.0, y: 1.0)
//    ]
}
