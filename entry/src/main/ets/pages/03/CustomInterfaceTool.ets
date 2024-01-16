// 03-01
@Entry
@Component
struct CustomInterfaceTool {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface userInfo {
  userName: string
  age: number
  sex: '男'| '女'
  img: string | Resource
}

export class userInfoModel implements userInfo {
  userName: string = ''
  age: number = 0
  sex: '男'| '女' = '男'
  img: string | Resource = ''

  constructor(model: userInfo) {
    this.userName = model.userName
    this.age = model.age
    this.sex = model.sex
    this.img = model.img
  }
}

// 首先创建interface userInfo
// cd 当前文件路径，比如：cd /Users/C942136/DevEcoStudioProjects/MyApplication/entry/src/main/ets/pages/03
// i2c ./CustomInterfaceTool.ets