// 03-07
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct AppStorageCase2 {
  @StorageProp("user_token") token: string = 'Hello World'
  @StorageLink("user_token") token2: string = ''

  aboutToAppear(){
   promptAction.showToast({message:AppStorage.Get<string>("user_token")})
  }

  build() {
    Row() {
      Column() {
        Text(this.token)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("更新token")
          .onClick(()=>{
            this.token2 = "qaz123"
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}