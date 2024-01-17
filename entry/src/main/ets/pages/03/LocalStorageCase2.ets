import { local, UserInfoClass } from '../03/LocalStorageCase' //  {}里的是其他文件里导出的对象和类，这里可以导入
@Entry(local)
@Component
struct LocalStorageCase2 {
  @LocalStorageProp("user")
  myUser: Partial<UserInfoClass> = {}


  @LocalStorageLink("user")
  myUser2:Partial<UserInfoClass> = {}
  build() {
    Row() {
      Column({space: 15}) {
        Text('姓名'+ this.myUser.name)
        Text('年龄'+ this.myUser.age.toString())
        Button("更新name")
          .onClick(()=>{
            // this.myUser.name = "千年老二" // 并不能向上同步，只能单向传递
            this.myUser2.name = "周深唱歌很好听" //可以同步到二级页面
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}