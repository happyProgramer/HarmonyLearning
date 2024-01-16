@Entry
@Component
struct TestCase123 {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            this.message = '老范' + Math.random().toFixed(2)
          })
        ChildTest({message: this.message})
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ChildTest {
@Link message: string
  build() {
    Row(){
      Text(this.message)
    }
  }
}