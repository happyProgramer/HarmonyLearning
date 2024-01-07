import promptAction from '@ohos.promptAction'
@Entry
@Component
struct EventCase {
  @State  username: string = ""
  @State  password: string = '' // 属性的大小写之间对应的类型不一样
  login() {
    if (this.username === 'admin' && this.password === '123456') {
      promptAction.showToast({message: '登录成功'})
    } else {
      promptAction.showToast({message: '用户名或密码错误！'})
    }
  }

  getBtnEnable(): boolean {
    return this.username !== "" && this.password !== ""
  }
  build() {
    Row() {
      Column({space: 20}) {
        TextInput({placeholder: "请输入用户名"})
          .width('80%')
        .onChange(value => {
          // 值改变会触发
          this.username = value
        })

        TextInput({placeholder: '请输入密码'})
          .width('80%')
          .type(InputType.Password)
          .onChange(value => {
            this.password = value
          })

        Button('登录')
          .width('80%')
          .onClick(()=> {
            this.login()
          })
          .enabled(this.getBtnEnable())
      }
      .width('100%')
    }
    .height('100%')
  }
}