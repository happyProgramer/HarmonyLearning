"use strict";
struct BuilderCase2 extends   {
    constructor() { }
    aboutToAppear() {
        setInterval(() => {
            this.user = {
                name: "李白",
                age: 34,
                sex: "男",
                address: '蜀郡绵州昌隆县'
            };
        }, 2000);
    }
    getContent() {
        getCellContent({ leftTitle: "姓名", rightValue: this.user.name });
        getCellContent({ leftTitle: "年龄", rightValue: this.user.age.toString() });
        getCellContent({ leftTitle: "性别", rightValue: this.user.sex });
        getCellContent({ leftTitle: "地址", rightValue: this.user.address });
    }
    build() {
            .height('100%')
            .backgroundColor('#ccc');
    }
}
class UserInfo {
    constructor() {
        this.name = '';
        this.age = 0;
        this.sex = "男"; // 属性还可以这样写
        this.address = '';
    }
}
function getCellContent($$) {
        .padding({
        left: 10,
        right: 10
    });
}
class CellParam2 {
    constructor() {
        this.leftTitle = '';
        this.rightValue = '';
    }
}
//# sourceMappingURL=BuilderCase2.js.map