"use strict";
struct MultipleStyleCase extends   {
    constructor() { }
    pressStyle() {
        
    
            .width(200)
            .height(80)
            .borderRadius(40)
            .backgroundColor(Color.Pink);
    }
    disableStyle() {
        
    
            .backgroundColor(Color.Red);
    }
    inputFocusStyle() {
        
    
            .height(40)
            .border({
            width: 1,
            color: Color.Red
        });
    }
    inputNormalStyle() {
        
    
            .height(40)
            .border({
            color: Color.Red,
            width: 0
        });
    }
    build() {
            .height('100%');
    }
}
function textStyle() {
    
  
        .width(100)
        .height(40)
        .backgroundColor(Color.Gray)
        .fontColor(Color.White)
        .borderRadius(30)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .fontSize(20);
}
//# sourceMappingURL=MultipleStyleCase.js.map