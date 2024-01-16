// 03-04 多层嵌套怎么更新？又不能用解构赋值和延展运算符

@Entry
@Component
struct MultiStateCase {
  @State
  user: IUserProfileModel = new IUserProfileModel({
    userName: '小鱼儿',
    age: 10,
    sex: '男',
    address: new IAddressModel({
      province: '北京',
      city: '北京',
      area: '昌平'
    })
  })

  build() {
    Row() {
      Column() {
        Column(){
          Text(this.user.userName).fontSize(40)
          Text(this.user.age.toString()).fontSize(40)
          Text(this.user.sex).fontSize(40)
          Text(this.user.address.province).fontSize(40)
          Text(this.user.address.city).fontSize(40)
          Text(this.user.address.area).fontSize(40)
        }
        .width('100%')

        Button('更新名字和年龄')
          .onClick(()=>{
            // this.user.userName = '花无缺'
            // this.user.age = 20
            this.user.address.province = '河北'
            this.user.address.city = '邯郸'
            this.user.address = new IAddressModel(this.user.address) // 通过Model赋值
            this.user.address = {... this.user.address, city: '廊坊'}
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface IAddress {
  province: string
  city: string
  area: string
}

interface IUserProfile {
  userName: string
  age: number
  sex: '男'|'女'
  address: IAddress
}

export class IAddressModel implements IAddress {
  province: string = ''
  city: string = ''
  area: string = ''

  constructor(model: IAddress) {
    this.province = model.province
    this.city = model.city
    this.area = model.area
  }
}
export class IUserProfileModel implements IUserProfile {
  userName: string = ''
  age: number = 0
  sex: '男'|'女' = '男'
  address: IAddress = new IAddressModel({} as IAddress)

  constructor(model: IUserProfile) {
    this.userName = model.userName
    this.age = model.age
    this.sex = model.sex
    this.address = model.address
  }
}
