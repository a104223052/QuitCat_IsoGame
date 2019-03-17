import UIKit

class GuideViewController:UIViewController,UIScrollViewDelegate
{
    var numOfPages = 3
    
    override func viewDidLoad()
    {
        let frame = self.view.bounds
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width:frame.size.width * CGFloat(numOfPages),
                                        height:frame.size.height)
        print("\(frame.size.width*CGFloat(numOfPages)),\(frame.size.height)")
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        for i in 0..<numOfPages{
           // let imgfile = "jianjie\(Int(i+1)).png"
            let imgfile = "bg.png"
            print(imgfile)
            let image = UIImage(named:"\(imgfile)")
            let imgView = UIImageView(image: image)
            imgView.frame = CGRect(x:frame.size.width*CGFloat(i), y:CGFloat(0),
                                   width:frame.size.width, height:frame.size.height)
            scrollView.addSubview(imgView)
        }
        scrollView.contentOffset = CGPoint.zero
        self.view.addSubview(scrollView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        print("scrolled:\(scrollView.contentOffset)")
        let twidth = CGFloat(numOfPages-1) * self.view.bounds.size.width
        //如果在最后一个页面继续滑动的话就会跳转到主页面
        if(scrollView.contentOffset.x > twidth)
        {
            let mainStoryboard = UIStoryboard(name:"TestGame", bundle:nil)
            let viewController = mainStoryboard.instantiateInitialViewController()
            self.present(viewController!, animated: true, completion:nil)
        }
    }
}