import font from '@ohos.font'
@Entry
@Component
struct LoadingCase {
  @State message: string = "Hello world!"
  @State showLoading: boolean = false

  aboutToAppear() {
    this.showLoading = true
    setTimeout(()=>{
      this.showLoading = false
    },3000)
  }
  build() {
    Row() {
      Column() {
        if (this.showLoading) {
          HMLoading()
        } else {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
      }
      .width('100%')
    }
    .height('100%')
    // 和aboutToAppear 作用一样，前者更独立，适合解偶
    .onAppear(()=>{
        this.showLoading = true
        setInterval(()=>{
          this.showLoading = false
        },3000)
    })
  }
}

@Component
struct HMLoading {
  @State count:number = 0
  // aboutToAppear 是初始化执行的函数
  // onAppear 是控件的显示
  aboutToAppear() { // aboutToAppear 和 onAppear的区别
    setInterval(()=>{
      if (this.count == 100) {
        this.count = 0
      }
      this.count ++
    },10)
  }
  build() {
    Progress({
      value:this.count,
      total: 100,
      type: ProgressType.ScaleRing
    })
      .style({
        strokeWidth: 6,
        scaleCount: 20
      })
  }
}