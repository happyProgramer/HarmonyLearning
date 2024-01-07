@Entry
@Component
struct MultipleStyleCase {
  @State message: string = 'Hello World'
  @State textEnable: boolean = true
@Styles
  pressStyle() {
    .width(200)
    .height(80)
    .borderRadius(40)
    .backgroundColor(Color.Pink)
  }

  @Styles
  disableStyle() {
    .backgroundColor(Color.Red)
  }

  @Styles
  inputFocusStyle() {
    .height(40)
    .border({
      width: 1,
      color: Color.Red
    })
  }

  @Styles
  inputNormalStyle() {
    .height(40)
    .border({
      color: Color.Red,
      width: 0
    })
  }

  build() {
    Row() {
      Column({space: 20}) {
        Row() {
          TextInput()
            .stateStyles({// 保存会报错，但刷新一下就好了
              focused: this.inputFocusStyle,
              normal: this.inputNormalStyle
            })
        }
        .padding({
          left: 20,
          right: 20
        })
        // 两个对比来看，谁聚焦，谁显示聚焦态，未聚焦需要设置正常态
        Row() {
          TextInput()
            .stateStyles({// 保存会报错，但刷新一下就好了
              focused: this.inputFocusStyle,
              normal: this.inputNormalStyle
            })
        }
        .padding({
          left: 20,
          right: 20
        })

        Text("测试")
          .textStyle()
          .stateStyles({
            pressed: this.pressStyle ,// 只允许传函数名，不允许写函数调用
            disabled: this.disableStyle
          })
          .enabled(this.textEnable)

        Button("文本设置禁用")
          .onClick(()=>{
            this.textEnable = !this.textEnable
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text) function textStyle() {
  .width(100)
  .height(40)
  .backgroundColor(Color.Gray)
  .fontColor(Color.White)
  .borderRadius(30)
  .textAlign(TextAlign.Center)
  .fontWeight(FontWeight.Bold)
  .fontSize(20)
}