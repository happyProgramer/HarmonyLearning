// 03-06 AppStorage 也是内存数据，不会写入磁盘
import router from '@ohos.router'
// AppStorage 是全局的UI状态存储，是和应用的进程绑定的，由UI框架在应用程序启动时创建，为应用程序UI状态属性提供中央存储。

/*
 PersistentStorage 将选定的 AppStorage 属性保留在设备磁盘上。
 UI和业务逻辑不直接访问 PersistentStorage 中的属性，所有属性访问都是对 AppStorage 的访问，AppStorage 中的更改会自动同步到 PersistentStorage。
 也就是，我们和之前访问AppStorage是一样的，只不过需要提前使用PersistentStorage来声明
● 支持：number, string, boolean, enum 等简单类型;
● 如果：要支持对象类型，可以转换成json字符串
● 持久化变量最好是小于2kb的数据，如果开发者需要存储大量的数据，建议使用数据库api。
用法：
  PersistentStorage.PersistProp('属性名', 值)
 **/
PersistentStorage.PersistProp<string>("user_token","")

@Entry
@Component
struct AppStorageCase {
  @StorageProp("user_token") token: string = ''

  build() {
    Row() {
      Column({space: 15}) {
        Text(this.token)
          .fontColor(Color.Black)
        Button("登录")
          .fontSize(20)
          .width('100%')
          .height(50)
          .onClick(()=>{
            AppStorage.SetOrCreate<string>("user_token","12345678")
            router.pushUrl({
              url: 'pages/03/AppStorageCase2'
            })
          })
      }
      .width('100%')
      .padding({
        left: 20,
        right: 20
      })
    }
    .height('100%')
  }
}