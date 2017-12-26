//
//  ViewController.swift
//  stencil-demo
//
//  Created by Reynaldo Aguilar on 12/26/17.
//  Copyright © 2017 Reynaldo Aguilar. All rights reserved.
//

import UIKit
import Stencil

class ViewController: UIViewController {
   @IBOutlet weak var label: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      
      let users = [
         User(name: "a"),
         User(name: "Kyle"),
         User(name: "b")
      ]
      let templateStr = "{% for user in users where user.name != \"Kyle\" %}{{ user.name }}{% endfor %}"
      let template = Template(templateString: templateStr)
//      let context = Context(dictionary: ["users": users])
      let rendered = try! template.render(["users": users])
      label.text = rendered
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
}

struct User {
   let name: String
}
