import UIKit
import CVCalendar

class CalendarViewController: UIViewController {
    //星期菜单栏
    private var menuView: CVCalendarMenuView!
    //日历主视图
    private var calendarView: CVCalendarView!
    
    var currentCalendar: Calendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCalendar = Calendar.init(identifier: .gregorian)
        
        //初始化的时候导航栏显示当年当月
        self.title = CVDate(date: Date(), calendar: currentCalendar).globalDescription
        
        //初始化星期菜单栏
        self.menuView = CVCalendarMenuView(frame: CGRect(x:0, y:80, width:300, height:15))
        
        //初始化日历主视图
        self.calendarView = CVCalendarView(frame: CGRect(x:0, y:110, width:300,
                                                         height:450))
        //星期菜单栏代理
        self.menuView.menuViewDelegate = self
        
        //日历代理
        self.calendarView.calendarDelegate = self
        
        //将菜单视图和日历视图添加到主视图上
        self.view.addSubview(menuView)
        self.view.addSubview(calendarView)
    }
    
    //今天按钮点击
    @IBAction func todayButtonTapped(_ sender: AnyObject) {
        let today = Date()
        self.calendarView.toggleViewWithDate(today)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //更新日历frame
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CalendarViewController: CVCalendarViewDelegate,CVCalendarMenuViewDelegate {
    //视图模式
    func presentationMode() -> CalendarMode {
        //使用月视图
        return .monthView
    }
    
    //每周的第一天
    func firstWeekday() -> Weekday {
        //从星期一开始
        return .monday
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        //导航栏显示当前日历的年月
        self.title = date.globalDescription
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
    }
}

