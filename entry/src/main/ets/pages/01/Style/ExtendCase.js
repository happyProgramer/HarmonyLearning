import promptAction from '@ohos.promptAction';
struct ExtendCase extends   {
    constructor() {
    }
    build() {
            .height('100%');
    }
}
// 只能全局,可以传参，可以是block
function textStyle(callBack) {
    
  
        .width(120)
        .height(60)
        .backgroundColor(Color.Pink)
        .borderRadius(30)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
        .onClick(() => {
        callBack && callBack();
    });
}
function btnStyle(color) {
    
  
        .width(120)
        .height(60)
        .backgroundColor(color)
        .borderRadius(30)
        .fontSize(20);
}
function textInputStyle() {
    
  
        .width(120)
        .height(60)
        .backgroundColor(Color.Pink)
        .borderRadius(30)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .fontSize(20);
}
//# sourceMappingURL=ExtendCase.js.map