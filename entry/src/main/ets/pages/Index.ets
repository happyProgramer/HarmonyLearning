@Entry
@Component
struct Index {
  @State message: string = 'hi HM'

  build() {
    Column() {
      Header()
      Main()
      Footer()
    }
    .width('100%')
  }
}

@Component
struct Header {
  build() {
    Row() {
      Text("Header")
        .fontColor(Color.Black)
    }
    .width('100%')
    .height('10%')
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Main {
  build() {
    Row() {
      Text("Main")
        .fontColor(Color.White)
    }
    .width('100%')
    .height('80%')
    .backgroundColor(Color.Blue)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Footer {
  build() {
    Row() {
      Text("Footer")
        .fontColor(Color.Black)
    }
    .width('100%')
    .height('10%')
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }
}


