@Entry
@Component
struct StateCase {
  @State user: Partial<User> = {
    name: "老高",
    age: 18,
    address: {
      province: "河北",
      city: "邯郸",
      area:"邯山区"
    }
  }

  build() {
    Row() {
      Column({space: 20}) {
        Text(JSON.stringify(this.user))
        Row({space: 20}) {
          Text('姓名:')
          TextInput({placeholder: '姓名',text:this.user.name})
            .layoutWeight(1)
            .onChange(value => {
              this.user.name = value
            })
        }
        .width('100%')
        .padding({
          left:20,
          right:20
        })

        Row({space: 20}) {
          Text('年龄:')
          TextInput({ placeholder: '年龄',text: this.user.age.toString()})
            .layoutWeight(1)
            .onChange(value => { // string 转 int
              this.user.age = parseInt(value)
            })
        }
        .width('100%')
        .padding({
          left:20,
          right:20
        })

        Row({space: 20}){
          Text('地址:')
          TextInput({placeholder: '省',text: this.user.address.province})
            .layoutWeight(1)
            .onChange( value => {
              // this.user.address.province = value state只能给第一层起作用，第二层不行
              // ...this.user.address 是address的浅拷贝，等于将其他的属性原封不动的拿过来，只改变province属性
              this.user.address = {...this.user.address, province: value}
            })
          TextInput({placeholder: '市', text: this.user.address.city})
            .layoutWeight(1)
            .onChange( value => {
              // 方法2，同样可以这么写，之后需要补充，给user重新赋值
              this.user.address.city = value
              this.user = {...this.user}
            })
          TextInput({placeholder: '县', text: this.user.address.area})
            .layoutWeight(1)
            .onChange( value => {
              // this.user.address.area = value
              this.user.address = {
                ...this.user.address,
                area: value
              }
            })
        }
        .width('100%')
        .padding({
          left:20,
          right:20
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

class User {
  name: string
  age: number
  address: {
    province: string
    city: string
    area: string
  }
}