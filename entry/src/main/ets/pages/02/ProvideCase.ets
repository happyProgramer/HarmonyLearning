@Entry
@Component
struct ProvideCase {
  @Provide count: number = 0

  build() {
    Row() {
      Column() {
        Text(this.count.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('顶级组件+1')
          .onClick(()=>{
            this.count++
          })
        Divider()
        ProviderChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ProviderChild {
  build() {
    Column(){
      Text('子组件')
        .fontSize(40)
        .fontColor(Color.Blue)
      Divider()
      Grand()
    }
  }
}

@Component
struct Grand {
  @Consume count: number //在不指定Provide名称的情况下，你需要使用相同的名字来定义和接收数据,换个名字就不认得
  build() {
    Column() {
      Text('孙组件')
        .fontSize(30)
        .fontColor(Color.Red)
      Text(this.count.toString())
    }
  }
}