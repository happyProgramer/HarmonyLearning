"use strict";
struct BuilderCase extends   {
    constructor() { }
    // builder 可以抽离复用，它可写在struct外，作为全局函数，也可写在内部，作为内部函数
    // 全局函数，只能在当前page内使用，不能export供所有page用，所以写在struct外没啥意义，写在内部需要用this调用
    // 参数传入函数中，会导致model改变时，数据不会刷新，因为类型时string类型，它是按值传递的，不具备响应式的特点
    // 如果参数是对象，该对象用$$修饰，就具备响应式了(通过对象的方式传入)
    // getCellContent(leftTitle: string, rightTitle: string){
    // Row() {
    //   Row() {
    //     Text(leftTitle)
    //     Text(rightTitle)
    //   }
    getCellContent($$) {
            .padding({
            left: 10,
            right: 10
        });
    }
    build() {
            .height('100%')
            .backgroundColor('#ccc');
    }
}
class Card {
    constructor() {
        this.time = '';
        this.location = '';
        this.type = '';
    }
}
class CellParam {
    constructor() {
        this.leftTitle = '';
        this.rightValue = '';
    }
}
//# sourceMappingURL=BuilderCase.js.map