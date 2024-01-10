@Entry
@Component
struct BuildParams {
  @State message: string = 'Hello World'

  @Builder
  getContent() {
    Row() {
      Text('插槽内容')
        .fontColor(Color.Red)
    }
  }

  @Builder
  getComponent(title: string) {
    Row() {
      Text('Footer')
        .fontColor(Color.White)
    }
    .backgroundColor('#ccc')
    .height(30)
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
  build() {
    Row() {
      Column() {

        HmCard() {
          BPCardItem({leftTitle:'员工姓名',rightValue: '张三'})
          BPCardItem({leftTitle:'员工编号',rightValue: '30032'})
          BPCardItem({leftTitle:'员工权限',rightValue: '普通'})
          BPCardItem({leftTitle:'员工组织',rightValue: '研发部'})
          BPCardItem({leftTitle:'员工上级',rightValue: '老范'})
        }

        // BPCard({content: this.getContent})// 只有一个参数的时候，用尾随闭包
        BPCard() {
          Text('自定义组件')
            .fontColor(Color.Blue)
          this.getContent()
        }
        Divider()
          .strokeWidth(6)
          .margin({
            bottom: 10
          })
        BPMCard({header:()=>{
          this.getComponent('Header')
        },footer:()=>{
          this.getComponent('Footer')
        }})
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#ccc')
  }
}

@Component
struct BPCard {
  // 如果组件中只有一个block的时候，可以作为尾随闭包用
  // 如果多个block，那就正常写入，跟swift是一样的，只是swift不需要builderParam修饰
  @BuilderParam content: ()=> void // 这就是一个block，可以写UI的block
  build() {
    Column() {
      Text('卡片组件')
      Divider()
      Text('传递内容')
      if(this.content) {
        this.content()
      }
    }
  }
}

@Component
struct BPMCard {
  // 第一个block参数
  @BuilderParam header: ()=> void
  // 第二个block参数
  @BuilderParam footer:()=> void
  build() {
    Column() {
      if(this.header) {
        this.header()
      }
      Text('卡片组件')
      Divider()
      Text('传递内容')
      if(this.footer) {
        this.footer()
      }
    }
  }
}

@Component
struct HmCard {
  @BuilderParam cardFn:()=> void
  build() {
    Column() {
      Column() {
        if(this.cardFn) {
          this.cardFn()
        }
      }
      .borderRadius(8)
      .backgroundColor(Color.White)
    }
    .padding({
      left: 15,
      right: 15
    })
    .margin({
      top: 10
    })
  }
}

@Component
struct BPCardItem {
  leftTitle: string = ''
  rightValue: string = ''
  build() {
    Row(){
      Text(this.leftTitle)
      Text(this.rightValue).fontColor('#ccc')
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: 10,
      right: 10
    })
    .height(50)
    .border({
      width:{
        bottom: 1
      },
      color: '#f4f5f6'
    })
  }
}