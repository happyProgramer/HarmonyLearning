@Entry
@Component
struct BuilderCase2 {
  @State user: UserInfo = {
    name:"",
    age: 0,
    sex: "男",
    address: ''
  }
  aboutToAppear() {
    setInterval(()=>{
      this.user = {
        name:"李白",
        age: 34,
        sex: "男",
        address: '蜀郡绵州昌隆县'
     }
    },2000)
  }

@Builder
getContent() {
  getCellContent({leftTitle:"姓名",rightValue:this.user.name})
  getCellContent({leftTitle:"年龄",rightValue:this.user.age.toString()})
  getCellContent({leftTitle:"性别",rightValue:this.user.sex})
  getCellContent({leftTitle:"地址",rightValue:this.user.address})
}

  build() {
    Row() {
      Column({space: 10}) {
        this.getContent()
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#ccc')
  }
}

class UserInfo {
  name: string = ''
  age: number = 0
  sex: "男"| "女" = "男" // 属性还可以这样写
  address: string = ''
}

@Builder
function getCellContent($$: CellParam2){
  Row() { // 侧边距，可以通过多增加一个row搞定
    Row() {
      Text($$.leftTitle)
      Text($$.rightValue)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding({
      left: 15,
      right: 15
    })
  }
  .padding({
    left: 10,
    right: 10
  })
}

 class CellParam2 {
  leftTitle: string = ''
  rightValue: string = ''
}