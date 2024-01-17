// 03-05 存储状态
// LocalStorage 是页面级的UI状态存储，通过 @Entry 装饰器接收的参数可以在页面内共享同一个LocalStorage 实例。
// LocalStorage 也可以在 UIAbility 内，页面间共享状态。
// 是针对UIAbility的状态共享，一个UIAbility有多个page，一个应用可能有多个UIAbility

import router from '@ohos.router' // 路径会自动生成，只要代码中调用router
let user: Record<string,UserInfoClass> = {
  "user":{
    name: "周深",
    age: 34
  }
}
const  local: LocalStorage = new LocalStorage(user)
export { local }
@Entry(local)
@Component
struct LocalStorageCase {
  @State message: string = 'Hello World'
  @LocalStorageProp("user")
  myUser: Partial<UserInfoClass> = { }

  build() {
    Row() {
      Column({space: 15}) {
        Text('姓名: '+ this.myUser.name)
        Text('年龄: '+ this.myUser.age.toString())

        Button("跳转到下一个页面")
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/03/LocalStorageCase2' // 路径不带斜杠，你可以通过斜杠去方便的找到路径
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

export class UserInfoClass {
  name: string = ''
  age: number = 0
}