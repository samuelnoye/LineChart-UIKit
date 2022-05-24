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
        chartView.backgroundColor = .systemPink
        chartView.rightAxis.enabled = false
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.setLabelCount(6, force: false)
        xAxis.labelTextColor = .white
        xAxis.axisLineColor = .white
        
        chartView.animate(xAxisDuration: 2.5)
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        setData1()
        setData()
        
    }

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData(){
        let optimalSet = LineChartDataSet(entries: yValues, label: "Optimal")
        
        optimalSet.drawCirclesEnabled = false
        optimalSet.lineWidth = 2
        optimalSet.setColor(.white)
        optimalSet.mode = .cubicBezier
    
        
        let optimal = LineChartData(dataSet: optimalSet)
        optimal.setDrawValues(false)
        lineChartView.data = optimal

        
    }
    func setData1(){
        let actualSet = LineChartDataSet(entries: xValues, label: "Actual")
        let actual = LineChartData(dataSet: actualSet)
        lineChartView.data = actual
        
    }
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 5.0),
        ChartDataEntry(x: 1.0, y: 5.5),
        ChartDataEntry(x: 2.0, y: 8.0),
        ChartDataEntry(x: 3.0, y: 7.0),
        ChartDataEntry(x: 4.0, y: 6.0),
        ChartDataEntry(x: 5.0, y: 6.0),
        ChartDataEntry(x: 6.0, y: 5.0),
        ChartDataEntry(x: 7.0, y: 7.0),
        ChartDataEntry(x: 8.0, y: 8.0),
        ChartDataEntry(x: 9.0, y: 9.0),
        ChartDataEntry(x: 10.0, y: 6.6),
        ChartDataEntry(x: 11.0, y: 9.0),
        ChartDataEntry(x: 12.0, y: 8.0),
        ChartDataEntry(x: 13.0, y: 7.0),
        ChartDataEntry(x: 14.0, y: 6.0),
        ChartDataEntry(x: 15.0, y: 7.0),
        ChartDataEntry(x: 16.0, y: 8.0),
        ChartDataEntry(x: 17.0, y: 9.0),
        ChartDataEntry(x: 18.0, y: 8.0),
        ChartDataEntry(x: 19.0, y: 9.0),
        ChartDataEntry(x: 20.0, y: 6.0)
    ]
    let xValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 9.0),
        ChartDataEntry(x: 1.0, y: 2.0),
        ChartDataEntry(x: 2.0, y: 4.0),
        ChartDataEntry(x: 3.0, y: 3.0),
        ChartDataEntry(x: 4.0, y: 5.0),
        ChartDataEntry(x: 5.0, y: 9.0),
        ChartDataEntry(x: 6.0, y: 6.0),
        ChartDataEntry(x: 7.0, y: 12.0),
        ChartDataEntry(x: 8.0, y: 5.0),
        ChartDataEntry(x: 9.0, y: 3.0),
        ChartDataEntry(x: 10.0, y: 10.0),
        ChartDataEntry(x: 11.0, y: 12.0),
        ChartDataEntry(x: 12.0, y: 10.0),
        ChartDataEntry(x: 13.0, y: 6.0),
        ChartDataEntry(x: 14.0, y: 15.0),
        ChartDataEntry(x: 15.0, y: 3.0),
        ChartDataEntry(x: 16.0, y: 8.0),
        ChartDataEntry(x: 17.0, y: 4.0),
        ChartDataEntry(x: 18.0, y: 5.0),
        ChartDataEntry(x: 19.0, y: 3.0),
        ChartDataEntry(x: 20.0, y: 1.0)
    ]
}
