require('UILabel,UIColor');
defineClass('ViewController', {
            viewDidLoad: function() {
            self.super().viewDidLoad();
            var lb = UILabel.alloc().initWithFrame({x:100, y:100, width:100, height:100});
            lb.setText("Changed!");
            lb.setTextColor(UIColor.grayColor());
            lb.setBackgroundColor(UIColor.greenColor());
            self.view().addSubview(lb);
            },
            });
