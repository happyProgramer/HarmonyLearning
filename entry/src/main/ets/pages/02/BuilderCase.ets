@Entry
@Component
struct BuilderCase {
  @State card: Card = {
    time: '2023-1-8',
    location: '公益西桥',
    type: '漏油'
  }

  // builder 可以抽离复用，它可写在struct外，作为全局函数，也可写在内部，作为内部函数
  // 全局函数，只能在当前page内使用，不能export供所有page用，所以写在struct外没啥意义，写在内部需要用this调用
  // 参数传入函数中，会导致model改变时，数据不会刷新，因为类型时string类型，它是按值传递的，不具备响应式的特点
  // 如果参数是对象，该对象用$$修饰，就具备响应式了(通过对象的方式传入)
  @Builder
  // getCellContent(leftTitle: string, rightTitle: string){
  // Row() {
  //   Row() {
  //     Text(leftTitle)
  //     Text(rightTitle)
  //   }
  getCellContent($$: CellParam){
    Row() { // 侧边距，可以通过多增加一个row搞定
      Row() {
        Text($$.leftTitle)
        Text($$.rightValue)
      }
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.White)
      .borderRadius(10)
      .padding({
        left: 15,
        right: 15
      })
    }
    .padding({
      left: 10,
      right: 10
    })
  }

  build() {
    Row() {
      Column({space: 10}) {
        Text(JSON.stringify(this.card))
          .padding(10)
        this.getCellContent({leftTitle:'异常时间',rightValue:this.card.time})
        this.getCellContent({leftTitle:'异常地点',rightValue:this.card.location})
        this.getCellContent({leftTitle: '异常类型',rightValue:this.card.type})
        Button('修改异常地点')
          .onClick(()=>{
            this.card.location = '天津'
          })

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#ccc')
  }
}

class Card {
  time: string = ''
  location: string = ''
  type: string = ''
}

class CellParam {
  leftTitle: string = ''
  rightValue: string = ''
}