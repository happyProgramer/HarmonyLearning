@Entry
@Component
struct ComponentCase {
  build() {
    Scroll() {
      Row() {
        Column() {
          Horizontal()
          Vertical()
          TextDemo()
          FlexCase()
        }
        .width('100%')
      }
    }
  }
}

@Component
struct FlexCase {
  build() {
    Flex({direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround}) {
      Row()
        .width(100)
        .height(100)
        .backgroundColor(Color.Green)
      Row()
        .width(100)
        .height(100)
        .backgroundColor(Color.Pink)
      Row()
        .width(100)
        .height(100)
        .backgroundColor(Color.Orange)
    }
    .margin({
      top: 210
    })
  }
}

@Component
struct Horizontal {
  build(){
    Column({space: 20}) {
      Row()
        .width(200)
        .height(100)
        .backgroundColor(Color.Green)
      Row()
        .width(200)
        .height(100)
        .backgroundColor(Color.Pink)
      Row()
        .width(200)
        .height(100)
        .backgroundColor(Color.Orange)
    }
    .margin({
      bottom: 30,
      top: 30
    })
    // .justifyContent(FlexAlign.SpaceAround)
  }
}

@Component
struct Vertical {
  build() {
    Row({space: 10}) {
      Row()
        .width(100)
        .height(100)
        .backgroundColor(Color.Green)
      Row()
        .width(100)
        .height(100)
        .backgroundColor(Color.Pink)
      Row()
        .width(100)
        .height(100)
        .backgroundColor(Color.Orange)
    }
    .width('100%')
    // .justifyContent(FlexAlign.SpaceAround)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct TextDemo {
  @State message: string = 'Hello World'
  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Text(){
        Span("¥")
          .fontSize(12)
        Span("50.45")
          .fontSize(20)
      }
    }
    .width('100%')
  }
}