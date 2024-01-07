@Entry
@Component
struct CommentsCase {
  @State message: string = 'Hello World'

  build() {
    Column() {
      ZHNavBar()
      ZHComments()
    }
    .width('100%')
  }
}

  @Component
  struct ZHNavBar {
    build() {
      Row() {
        Row(){
          Image($r('app.media.ic_public_arrow_left'))
            .width(12)
            .aspectRatio(1)
            .fillColor('#848484')
        }
        .width(24)
        .height(24)
        .backgroundColor('#f5f5f5')
        .justifyContent(FlexAlign.Center)
        .margin({
          left: 15
        })
        .borderRadius(12)
        Text('评论回复')
          .layoutWeight(1)
          .fontSize(18)
          .textAlign(TextAlign.Center)
          .padding({
            right: 39
          })
      }
      .width('100%')
      .height(40)
      .border({
        color: '#f4f4f4',
        width: {
          bottom: 0.5
        }
      })
    }
  }

@Component
struct ZHComments {
  build() {
    Row(){
      Image('/assets/test.jpeg')
        .width(32)
        .aspectRatio(1)
        .borderRadius(16)
      Column({space: 10}){
        Text('周杰伦')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
        Text('意大利拌面应该使用42号钢筋混凝土再加上量子力学缠绕最后通过不畏浮云遮望眼')
          .fontSize(16)
          .fontColor('#565656')
        Row(){
          Text('10-21 .IP属地北京')
            .fontSize(12)
            .fontColor('#c3c4c5')
          Row(){
            Image($r('app.media.favorite_block'))
              .width(12)
              .aspectRatio(1)
              .borderRadius(6)
              .fillColor('c3c4c5')
              .margin({
                right: 5
              })
            Text('100')
              .fontSize(12)
              .fontColor('#c3c4c5')
          }

        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({
        left: 10
      })
    }
    .padding(15)
    .alignItems(VerticalAlign.Top)
  }
}