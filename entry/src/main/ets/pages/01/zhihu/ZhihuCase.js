struct ZhihuCase extends   {
    constructor() { }
    build() {
        ;
    }
}
struct ReplyInput extends   {
    constructor() { }
    build() {
            .justifyContent(FlexAlign.Center)
            .width('100%')
            .height(50)
            .backgroundColor(Color.Red);
    }
}
struct ZhihuNav extends   {
    constructor() { }
    build() {
            .height(50)
            .border({
            color: '#f4f4f4',
            width: {
                bottom: 1
            }
        });
    }
}
struct ZhihuComments extends   {
    constructor() { }
    build() {
            .alignItems(VerticalAlign.Top)
            .padding(15);
    }
}
// 4.0 next中，class的每一个属性都要有默认值，这里先给赋上
// arkTS中，属性可以有两种类型
// export 代表当下class在当前位置，以后一定是要导出的
export class ReplyItem {
    constructor() {
        this.id = 0;
        this.avatar = '';
        this.author = '';
        this.content = '';
        this.time = '';
        this.area = '';
        this.likeNum = 0;
        this.likeFlag = false;
    }
}
//# sourceMappingURL=ZhihuCase.js.map