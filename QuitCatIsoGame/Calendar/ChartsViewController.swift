import UIKit
import Charts

class ChartsViewController: UIViewController {
    
    //饼状图
    var chartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建饼图组件对象
        chartView = PieChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 260)
        self.view.addSubview(chartView)
        
        //生成5条随机数据
        let dataEntries = (0..<5).map { (i) -> PieChartDataEntry in
            return PieChartDataEntry(value: Double(arc4random_uniform(50) + 10),
                                     label: "数据\(i)")
        }
        let chartDataSet = PieChartDataSet(values: dataEntries, label: "数据分布")
        //设置颜色
        chartDataSet.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
        let chartData = PieChartData(dataSet: chartDataSet)
        
        //设置饼状图数据
        chartView.data = chartData
    }
}
