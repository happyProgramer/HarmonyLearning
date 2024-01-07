
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct ExtendCase {

  build() {
    Row() {
      Column() {
        Text("测试")
          .textStyle(()=>{
            promptAction.showToast({message:"Hello"})
          })
        Button("按钮")
          .btnStyle(Color.Blue)
        TextInput({placeholder: "请输入"})
          .textInputStyle()
      }
      .width('100%')
    }
    .height('100%')
  }
}

// 只能全局,可以传参，可以是block
@Extend(Text) function textStyle(callBack?:() => void) {
  .width(120)
  .height(60)
  .backgroundColor(Color.Pink)
  .borderRadius(30)
  .textAlign(TextAlign.Center)
  .fontWeight(FontWeight.Bold)
  .fontSize(20)
  .onClick(()=>{
    callBack && callBack()
  })
}

@Extend(Button) function btnStyle(color: Color) {
  .width(120)
  .height(60)
  .backgroundColor(color)
  .borderRadius(30)
  .fontSize(20)
}

@Extend(TextInput) function textInputStyle( ) {
  .width(120)
  .height(60)
  .backgroundColor(Color.Pink)
  .borderRadius(30)
  .textAlign(TextAlign.Center)
  .fontWeight(FontWeight.Bold)
  .fontSize(20)
}