struct ZhihuCase extends   {
    constructor() { }
    changeLike(item) {
        if (item.likeFlag) {
            item.likeNum--;
            item.likeFlag = false;
        }
        else {
            item.likeNum++;
            item.likeFlag = true;
        }
        // 以上不能刷线UI，因为state只能监听第一层的改变，而现在做的是，对变量里的对象的某个属性赋值，监听不到
        let index = this.list.findIndex(obj => obj.id == item.id);
        // this.list[index] = {...item } // 4.0 可以，但下一代禁用
        // this.list.splice(index, 1, item)  // 删除index之后的对象，删除1个，替换item
        this.list.splice(index, 1);
        this.list.splice(index, 0, item);
    }
    addComment(item) {
        this.list.unshift(item); // 这是将item插入到顶部的操作
    }
    build() {
        ;
    }
}
struct ReplyInput extends   {
    constructor() { }
    build() {
            .border({
            color: '#f4f5f6',
            width: {
                top: 1
            }
        })
            .justifyContent(FlexAlign.Center)
            .width('100%')
            .height(50)
            .backgroundColor(Color.White)
            .padding({
            left: 10,
            right: 10
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