//
//  PageVC.swift
//  i-Oudio-S
//
//  Created by 장혜령 on 2021/05/21.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var identifiers: NSArray = ["PageOneVC", "PageTwoVC", "PageThreeVC"]
    
    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "PageOneVC"),
                self.VCInstance(name: "PageTwoVC"),
                self.VCInstance(name: "PageThreeVC")]
    }()
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "HRAudio", bundle: nil).instantiateViewController(identifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        let currentPageIndex: Int = self.identifiers.index(of: pendingViewControllers[0].restorationIdentifier ?? 0)
//        NSLog("ViewController_willTransitionTo index = %d", currentPageIndex)
      
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        //        print(previousIndex)
        guard previousIndex >= 0 else {
            return VCArray.last
        }
        
        guard VCArray.count > previousIndex else {
            return nil
        }
        
        return VCArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        guard nextIndex >= 0 else {
            return VCArray.first
        }
        
        guard VCArray.count > nextIndex else {
            print(nextIndex)
            return nil
        }
        
        return VCArray[nextIndex]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
   
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {

        //        print(pageViewController.index)
        guard let firstViewController = viewControllers?.first else { return 0 }
        guard let firstViewControllerIndex = VCArray.firstIndex(of: firstViewController) else { return 0 }

//        print(firstViewControllerIndex)
        return firstViewControllerIndex
    }
    
    func getViewControllerAtIndex(index: NSInteger) -> UIViewController? {
//        NSLog("ViewController getViewControllerAtIndex index: %d", index)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if index == 0 {
            let PageOne = storyboard.instantiateViewController(withIdentifier: "PageOneVC") as! PageOneVC
            return PageOne
            
        } else if index == 1 {
            let PageTwo = storyboard.instantiateViewController(withIdentifier: "PageTwoVC") as! PageTwoVC
            return PageTwo
            
        } else if index == 2 {
            let PageThree = storyboard.instantiateViewController(withIdentifier: "PageThreeVC") as! PageThreeVC
            return PageThree
            
        } else {
            return nil
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
}
