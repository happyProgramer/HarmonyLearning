import promptAction from '@ohos.promptAction';
@Entry
@Component
struct StyleCase {
  // @Styles
  // textStyle() {
  //   .width(120)
  //   .height(60)
  //   .backgroundColor(Color.Gray)
  //   .borderRadius(30)
  //   .onClick( () => {
  //     promptAction.showToast({ message:"测试局部"})
  //   })
  // }

  build() {
    Row() {
      Column() {
        Text("测试1")
          .textStyle()
          .textAlign(TextAlign.Center)
        Text("测试2")
          .textStyle()
          .textAlign(TextAlign.Center)
      }
      .width('100%')
    }
    .height('100%')
  }
}

// 全局样式没啥用，不能导出， 导出也没法用
//   @Styles can't have parameters.
// 优先级：局部>全局
@Styles function textStyle() {
  .width(120)
  .height(60)
  .backgroundColor(Color.Pink)
  .borderRadius(30)
  .onClick(()=>{
    promptAction.showToast({message:"测试全局"})
  })
}