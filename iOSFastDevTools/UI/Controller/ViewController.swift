//
//  ViewController.swift
//  iOSFastDevTools
//
//  Created by zcw on 2017/12/18.
//  Copyright © 2017年 zcw. All rights reserved.
//

import UIKit
import EFMarkdown
import Alamofire
import Lottie
import RealmSwift
import SnapKit
import KVOController
import AdSupport

protocol ParamsProtocol
{
    func returnparams(tmpstr: String)
}

class ViewController: UIViewController,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate  {
    
    //定义可重用标志
    static let cellID:String = "cellID"
    static let collectionCellId:String="collectionCellId";
    
    var paramsProtocolDelegate:ParamsProtocol?
    var btn:UIButton!
    
    func start(){
        // 第一种跳转传值,利用protocol代理
        
        let tmp = "跳转第二个页面"
        self.paramsProtocolDelegate?.returnparams(tmpstr: tmp)
    }
    
    var kvoListener:FBKVOController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        testGetDeviceInfo()
//        testButton()
//        testConfigString()
        //        testLabel()
        //        testTextField()
        //        testScrollView()
        //        testTableView()
                testCollectionView();
//                testAlert()
        //        markdown()
        //        testNet(testid: 2)
        //        animationTestLottie()
        //        testRealm();
        
        //        testNetRequest();
    }
    open func testConfigString(){
//        var text = NSLocalizedString("hello", comment: "value")
//        print("test config .string file:   " + text)
        
//        print(NSLocalizedString("demo", comment: "swift 真难用"))
    }
    
    
    
    
    func testGetDeviceInfo()
    {
        var adId = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        print("DEVICE INFO:AdvertisingIdentifier----" + adId)
        var idfv = UIDevice.current.identifierForVendor?.uuidString
        print("DEVICE INFO:IdentifierForVendor----" + idfv!)

    }
    
    func testNetRequest(){
        NetworkRequest.sharedInstance.getRequest(urlString: "http://op.juhe.cn/onebox/weather/query", params: ["cityname":"杭州","key":"f6418f1f819c801a60ea7880ca844587"], success: {(json) -> Void in
            
//            print(json)
            
        }, failture: {(error) -> Void in
            print(error)
        })
    }
    
    
    
    func testRealm(){
        let myDog = Dog()
        myDog.name = "Rex"
        myDog.age = 1
        print("name of dog: \(myDog.name)")
        
        // Get the default Realm
        let realm = try! Realm()
        
        // Query Realm for all dogs less than 2 years old
        let puppies = realm.objects(Dog.self).filter("age < 2")
        puppies.count // => 0 because no dogs have been added to the Realm yet
        
        // Persist your data easily
        try! realm.write {
            realm.add(myDog)
        }
        
        // Queries are updated in realtime
        puppies.count // => 1
        
        // Query and update from any thread
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                let theDog = realm.objects(Dog.self).filter("age == 1").first
                try! realm.write {
                    theDog!.age = 3
                }
            }
        }
    }
    
    
    func testLabel(){
        let label = UILabel()
        label.frame = CGRect(x: 200, y: 180, width: 130, height: 30)
        label.text = "测试控制器"
        label.textColor = UIColor.black
        
        
        view.addSubview(label)
        
        let spring = CASpringAnimation(keyPath: "position.x")
        spring.damping = 5;
        spring.stiffness = 100;
        spring.mass = 1;
        spring.initialVelocity = 0;
        spring.fromValue = label.layer.position.x;
        spring.toValue = label.layer.position.x + 50;
        spring.duration = spring.settlingDuration;
        label.layer.add(spring, forKey: spring.keyPath);
    }
    
    func testButton(){
//        let btn = UIButton(type:.custom)
        btn = UIButton(type:.custom)
        btn.frame = CGRect(x:65,y:150,width:80,height:30);
        btn.backgroundColor = UIColor.orange
        btn.setTitle("我是按钮", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("我是高亮状态", for: .normal)
        btn.setTitleColor(UIColor.white, for: .highlighted)
        btn.addTarget(self, action: #selector(segueNextPage), for: UIControlEvents.touchDown)
        
        view.addSubview(btn)
        
        
        kvoListener = FBKVOController(observer:self)
        kvoListener?.observe(btn, keyPath: "backgroundColor", options: NSKeyValueObservingOptions.new, block: { (_, _, change) in
            print("demo received pvo")
        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(textChangedHandler), name: NSNotification.Name(rawValue: "textChangeNotification"), object: nil)
        
        btn.snp.makeConstraints { (_ make) in
//            make.width.equalTo(100)
//            make.height.equalTo(100)
//            make.center.equalTo(view)
            make.width.height.equalTo(100)
            make.bottom.centerX.equalToSuperview()
        }
        
        
        
        // 黑色视图作为父视图
        let view1 = UIView()
        view1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view1.center = view.center
        view1.backgroundColor = UIColor.black
        view.addSubview(view1)
        
//        // 测试视图
//        let view2 = UIView()
//        view2.backgroundColor = UIColor.magenta
//        view1.addSubview(view2)
//        view2.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(20)      // 当前视图的顶部距离父视图的顶部：20（父视图顶部+20）
//            make.left.equalToSuperview().offset(20)     // 当前视图的左边距离父视图的左边：20（父视图左边+20）
//            make.bottom.equalToSuperview().offset(-20)  // 当前视图的底部距离父视图的底部：-20（父视图底部-20）
//            make.right.equalToSuperview().offset(-20)   // 当前视图的右边距离父视图的右边：-20（父视图右边-20）
//        }
        
        // 测试视图
        let view2 = UIView()
        view2.backgroundColor = UIColor.magenta
        view1.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            
//            // 让顶部距离view1的底部为10的距离
//            make.top.equalTo(view1.snp.bottom).offset(10)
//            // 设置宽、高
//            make.width.height.equalTo(100)
//            // 水平中心线<=view1的左边
//            make.centerX.lessThanOrEqualTo(view1.snp.leading)
            
        }
        
        
         NotificationCenter.default.post(name:NSNotification.Name(rawValue: "textChangeNotification"), object: nil, userInfo: nil)
       
    }
    
    func testTextField(){
        let textField = UITextField(frame: CGRect(x: 200, y: 300, width: 130, height: 40))
        textField.backgroundColor = UIColor.yellow
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.textColor = UIColor.red
        textField.textAlignment = .center
        textField.contentHorizontalAlignment = .left
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
    }
    
    func testScrollView()
    {
        let scroll = UIScrollView()
        scroll.frame = self.view.frame
        for i in 0...4{
            let v = UIView()
            v.frame = CGRect(x: self.view.frame.size.width * CGFloat(i), y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            v.backgroundColor = UIColor(red: CGFloat(arc4random() % 256) / 255.0,
                                        green:  CGFloat(arc4random() % 256) / 255.0,
                                        blue:  CGFloat(arc4random() % 256) / 255.0,
                                        alpha: 0.6)
            scroll.addSubview(v)
        }
        
        scroll.contentSize = CGSize(width: 4.0 * view.frame.size.width, height: view.frame.size.height)
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = true
        
        scroll.indicatorStyle = .white
        scroll.bounces = false
        scroll.delegate = self
        //        view.addSubview(scroll)
    }
    
    func testTableView(){
        let tabView = UITableView(frame: view.bounds, style: .plain)
        tabView.dataSource = self
        tabView.register(UITableViewCell.self, forCellReuseIdentifier: ViewController.cellID)
        tabView.delegate = self
        view.addSubview(tabView)
    }
    
    func testCollectionView(){
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 5
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = UIColor.blue
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ViewController.collectionCellId)
        view.addSubview(collection)
    }
    
    func testAlert(){
        let alertController = UIAlertController(title: "系统提示",
                                                message: "您确定要离开当前页面吗？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            print("点击了确定")
            
            let mySecondViewController = SecondViewController()
            self.present(mySecondViewController, animated: true, completion: nil)
            
//            self.segueNextPage();
            
            
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // segue 跳转方式
    @objc func segueNextPage(){
        print("segueNextPage segue")
//        performSegue(withIdentifier: "CustomSegue", sender: AnyObject.self)
        
        
    }
    
    
    func animationTestLottie(){
        let animationView = LOTAnimationView(name: "LottieLogo")
        animationView.backgroundColor = UIColor.blue
        self.view.addSubview(animationView)
        
        animationView.play(fromProgress: 0.25, toProgress: 0.5, withCompletion: nil)
        
        //        animationView.play{ (finished) in
        //            // Do Something
        //        }
        //
        //        let translation = gesture.getTranslationInView(self.view)
        //        let progress = translation.y / self.view.bounds.size.height;
        //        animationView.animationProgress = progress
    }
    
    
    
    func testNet(testid:Int){
        
        if(testid == 0)
        {
            //1.创建请求路径
            let url = URL(string: "http://ikapp.ikang.com/appService/market/mainEvent")
            
            //2.根据请求路径创建请求对象(GET)
            let request = NSURLRequest(url: url!)
            
            //3.发送请求
            //异步
            //参数1：需要发送给服务器的请求对象
            //参数2：队列,参数3中的任务添加的对象(耗时操作创建新队列，UI操作用主队列)
            //参数3：服务器返回数据之后需要执行的任务对应的闭包
            //闭包参数1：服务器响应信息
            //闭包参数2：服务器返回给客户端的数据
            //闭包参数3：错误信息
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue()) { (response, data, error) in
                //            print(response)
                //            print("\n---------");
                //            print(data)
                //            print("\n---------");                        print(error)
                //            print(Thread.current)
                
                //解析数据(前提：必须知道数据的格式,a.确定数据是json数据还是xml数据,b.确定json数据最外层的格式)
                
                //json解析(最外层字典)
                //参数1：需要解析的json的二进制
                //参数2：.MutableContainers(json最外层是数组或者字典选这个选项)
                
                //                let dict = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                let dict = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(dict)
                
                
                //获取数据数组
                //                let array = dict["results"]
                //                print(array)
            }
            
        }
        else if(testid == 1)
        {
            //1.创建请求路径
            let path = "http://0.0.0.0:tuicool@api.tuicool.com/api/articles/hot.json"
            //拼接参数(GET请求参数需要以"?"连接拼接到请求地址的后面，多个参数用"&"隔开，参数形式：参数名=参数值)
            //size:请求数据的长度
            let path2 = path + "?cid=0&size=30"
            //转换成url(统一资源定位符)
            let url = URL(string: path2)
            
            //2.创建请求对象
            //NSURLRequest类型的请求对象的请求方式一定是GET(默认GET且不能被改变)
            let request = URLRequest(url: url!)
            
            //3.根据会话模式创建session(创建默认会话模式)
            //方式1：一般不采用
            //let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
            //方式2：快速创建默认会话模式的session
            let session = URLSession.shared
            
            //4.创建任务
            //参数1：需要发送的请求对象
            //参数2：服务返回数据的时候需要执行的对应的闭包
            //闭包参数1：服务器返回给客户端的数据
            //闭包参数2：服务器响应信息
            //闭包参数3：错误信息
            let task = session.dataTask(with: request) { (data, response, error) in
                
                //注意：当前这个闭包是在子线程中执行的，如果想要在这儿执行UI操作必须通过线程间的通信回到主线程
                
                //            print(response)
                //            print("能接受到")
                //            print(NSThread.currentThread())
                
                //解析json
                //参数options：.MutableContainers(json最外层是数组或者字典选这个选项)
                if data != nil{
                    let dict = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    print(dict)
                }
                else{
                    print("请求数据失败")
                }
            }
            
            //5.开始执行任务
            task.resume()
            
        } else if(testid == 2)
        {
            
            let urlRequest = URLRequest(url: URL(string: "http://0.0.0.0:tuicool@api.tuicool.com/api/signup/register_by_email.json")!)
            let myurl = urlRequest.url?.absoluteString
            
            //            Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
            
            
            let myParameters = ["email":"101659109@qq.com","name":"鱼摆摆","password":"123456789"]
            let myEncoding = URLEncoding.default
            let myUrlConvertible = myurl
            
            Alamofire.request("http://0.0.0.0:tuicool@api.tuicool.com/api/signup/register_by_email.json",method:.post, parameters: myParameters, encoding: myEncoding , headers: nil).responseJSON(completionHandler: { (response) in
                print(response)
            })
            
            
            
            
            
            
            
            var urlString = "https://httpbin.org/get";
            
            Alamofire.request(urlString).responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // HTTP URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
            }
            
            
            let parameters: Parameters = [
                "foo": [1,2,3],
                "bar": [
                    "baz": "qux"
                ]
            ]
            let headers: HTTPHeaders = [
                "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
                "Accept": "application/json"
            ]
            
            
            Alamofire.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (respond) in
                if let JSON = respond.result.value {
                    print("JSON: \(JSON)")
                }
                
            }
            
        }
        
        
        
        
    }
    
    
    
    
    func markdown(){
        let markdown = "# Hello"
        var html = ""
        do {
            html = try EFMarkdown().markdownToHTML(markdown, options: EFMarkdownOptions.safe)
            print(html) // 这里会输出 "<h1>Hello</h1>\n"
        } catch let error as NSError {
            print ("Error: \(error.domain)")
        }
        
        
        let screenSize = UIScreen.main.bounds
        let markView = EFMarkdownView()
        markView.frame = CGRect(x: 0, y: 20, width: screenSize.width, height: screenSize.height - 20)
        self.view.addSubview(markView)
        markView.load(markdown: testMarkdownContent(), options: [.default]) {
            [weak self] (_, _) in
            if let _ = self {
                // 可选：你可以通过在此处传入一个百分比来改变字体大小
                markView.setFontSize(percent: 128)
                printLog("load finish!")
            }
        }
    }
    
    
    
    
    func testMarkdownContent()-> String{
        var content = "# Hello EveryOne\n > demo  \r\r\n ``` content content``` \r\t\n "
        content.append("This is [an example](https://www.baidu.com/ \"Title\") inline link.")
        content.append("""

            *  android.support.v4.util包下面的数据结构 ArrayMap
            [Android内存优化（使用SparseArray和ArrayMap代替HashMap](
            http://www.cnblogs.com/huozhong/p/5896077.html)

            """)
        return content
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 30
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.collectionCellId, for: indexPath)
        cell.backgroundColor = UIColor.yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                print("collectionview%@",indexPath)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: {
            print("键盘dismiss")
        })
    }
    
    
}

extension ViewController:UITextFieldDelegate{
    //点击文本框弹出键盘
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    // return 退出键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}


extension ViewController{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        print("scrollview dis scroll%@",scrollView)
    }
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellID, for: indexPath)
        cell.backgroundColor = UIColor.red
        cell.textLabel?.text = String.init(format:"TableView%ld",(indexPath.row))
        cell.imageView?.image = UIImage.init(named: "demo")
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //        return nil
    }
    
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// Define your models like regular Swift classes
class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = List<Dog>()
}

extension ViewController {
    
    func textChangeClick() {
        
        btn.backgroundColor = UIColor.red
        
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: "textChangeNotification"), object: nil, userInfo: nil)
    }
    
    @objc func textChangedHandler() {
        
        print("received notify")
    }
    
}
