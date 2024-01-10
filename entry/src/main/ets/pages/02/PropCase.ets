@Entry
@Component
struct PropCase {
  @State num: number = 0
  build() {
    Row() {
      Column({space: 10}) {
        Text(this.num.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('+1')
          .onClick(()=>{
            this.num++
          })
        Child({num: this.num})
      }
      .width('100%')
    }
    .height('100%')
  }
}


@Component
struct Child {
  // 由此可见，@Prop修饰符只能触发单向数据刷新，且自身内部刷新，因此设计出来就是为了在子控件中用的
  // Prop支持类型，string，number，boolean，enum，4.0 Next会支持更多
  // 再次强调：State只能刷新第一层model数据，相比之下，没有swiftUI好使
  // 所以真的实现双向绑定，也有办法，用Link
  @Prop num : number
  build() {
    Column({space: 10}) {
      Text('子控件')
      Text(this.num.toString())
      Button('+1')
        .onClick(()=>{
          this.num++
        })
    }
    .backgroundColor(Color.Pink)
  }
}