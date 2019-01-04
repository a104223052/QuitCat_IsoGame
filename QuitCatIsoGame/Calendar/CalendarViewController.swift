import UIKit
import CVCalendar
import Charts

class CalendarViewController: UIViewController {
    //星期菜单栏
    private var menuView: CVCalendarMenuView!
    //日历主视图
    private var calendarView: CVCalendarView!
    
    private var chartView: PieChartView!
    
    var currentCalendar: Calendar!
    @IBOutlet weak var calendarTitle: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCalendar = Calendar.init(identifier: .gregorian)
        
         calendarTitle.title = CVDate(date: Date(), calendar: currentCalendar).globalDescription
        //初始化的时候导航栏显示当年当月
        
        //初始化星期菜单栏
        self.menuView = CVCalendarMenuView(frame: CGRect(x:0, y:170, width:self.view.bounds.width , height:15))
        
        //初始化日历主视图
        self.calendarView = CVCalendarView(frame: CGRect(x:0, y:200, width:self.view.bounds.width ,height:300))
        //星期菜单栏代理
        self.menuView.menuViewDelegate = self
        
        //日历代理
        self.calendarView.calendarDelegate = self
        
        //日历样式代理
        self.calendarView.calendarAppearanceDelegate = self
        
        //将菜单视图和日历视图添加到主视图上
        self.view.addSubview(menuView)
        self.view.addSubview(calendarView)
        
    }
    
    //今天按钮点击
    @IBAction func todayButtonTapped(_ sender: AnyObject) {
        let today = Date()
        self.calendarView.toggleViewWithDate(today)
        drawPieChart()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //更新日历frame
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
        self.calendarView.contentController.refreshPresentedMonth()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func drawPieChart() {
        //创建饼图组件对象
        chartView = PieChartView()
        chartView.frame = CGRect(x: 0, y: 500, width: self.view.bounds.width ,
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

extension CalendarViewController: CVCalendarViewDelegate,CVCalendarMenuViewDelegate,CVCalendarViewAppearanceDelegate {
    //视图模式
    
    func presentationMode() -> CalendarMode {
        //使用月视图
        return .monthView
    }
    
    //每周的第一天
    func firstWeekday() -> Weekday {
        //从星期日开始
        return .sunday
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        //导航栏显示当前日历的年月
        calendarTitle.title = date.globalDescription
    }
    
    //每个日期上面是否添加横线(连在一起就形成每行的分隔线)
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    //切换月的时候日历是否自动选择某一天（本月为今天，其它月为第一天）
    func shouldAutoSelectDayOnMonthChange() -> Bool {
        return false
    }
    
    //日期选择响应
    func didSelectDayView(_ dayView: CVCalendarDayView, animationDidFinish: Bool) {
        //获取日期
        let date = dayView.date.convertedDate()!
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日"
        let message = "当前选择的日期是：\(dformatter.string(from: date))"
        //将选择的日期弹出显示
        let alertController = UIAlertController(title: "", message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        drawPieChart()
        
    }
    
    func shouldShowWeekdaysOut() -> Bool { //顯示非當月日期
        return false
    }
    
    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor {//星期文字颜色设置
        return weekday == .sunday || weekday == .saturday ?
            UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0) : UIColor.black
    }
    
    func dotMarker(shouldShowOnDayView dayView: DayView) -> Bool {
        if !dayView.isHidden && dayView.date != nil {
            //获取该日期视图的年月日
            let year = dayView.date.year
            let month = dayView.date.month
            let day = dayView.date.day
            //判断日期是否符合要求
            if year == 2018 && month == 11 && day >= 1 && day <= 3 {
                return true
            }
        }
        return false
    }
    
    func dotMarker(colorOnDayView dayView: DayView) -> [UIColor] {
        switch dayView.date.day {
        case 1:
            return [UIColor.orange]
        default:
            return [UIColor.orange]
        }
    }
    
    func dotMarker(moveOffsetOnDayView dayView: DayView) -> CGFloat {
        return 15
    }
    
    //标记点的尺寸大小
    func dotMarker(sizeOnDayView dayView: DayView) -> CGFloat {
        return 5
    }
    
    struct Color {
        static let selectionBackground = UIColor(red: 88/255, green: 135/255, blue: 65/255,
                                                 alpha: 1.0)
        static let holidayText = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1.0)

        static let holidaySelectionBackground = holidayText
    }
    
    //文字颜色设置
    func dayLabelColor(by weekDay: Weekday, status: CVStatus, present: CVPresent)
        -> UIColor? {
            switch (weekDay, status, present) {
            case (_, .selected, _), (_, .highlighted, _): return Color.holidaySelectionBackground
            case (.sunday, .in, _): return Color.holidayText
            case (.saturday, .in, _): return Color.holidayText
            case (_, .in, _): return UIColor.black
            default: return UIColor.gray
            }
    }

    //文字背景色设置
    func dayLabelBackgroundColor(by weekDay: Weekday, status: CVStatus,
                                 present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (_, .selected, _),(_, .highlighted, _): return Color.selectionBackground
        default: return nil
        }
    }
    

    
}
