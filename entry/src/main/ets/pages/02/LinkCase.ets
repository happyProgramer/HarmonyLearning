@Entry
@Component
struct LinkCase {
  @State cardList: FoodClass[] = [{
      order_id: 1,
      food_name: '鱼香肉丝',
      food_price: 18.8,
      food_count: 1
    },{
    order_id: 2,
    food_name: '粗溜丸子',
    food_price: 26,
    food_count: 2
  },{
    order_id: 3,
    food_name: '杂粮煎饼',
    food_price: 12,
    food_count: 1
  }]
  @State num: number = 0

  build() {
    Row() {
      Column() {
        Column() {
          ForEach(this.cardList,(card: FoodClass)=>{
            Row() {
              Text(card.food_name)
              Text('价格: '+ card.food_price.toString())
              Text('数量: '+card.food_count.toString())
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceEvenly)
            .height(50)
          })
          BottomCart({foodList:$cardList})
          // 不能这么写，会报错The regular property 'card' cannot be assigned to the @Link property 'food'.
          // 因为Link只支持修改的数据必须得是最外层的 State数据，多一层都不行
          // 也有解决办法，就是ObjectLink 和Observerd会解决这个问题，之后再探讨
          // ForEach(this.cardList,(card: FoodClass)=>{
          //   FoodItem({food:$card})
          // })
        }
        .layoutWeight(1)
        Column() {
          Text(this.num.toString())
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Button('+1')
            .onClick(()=>{
              this.num++
            })
          LinkChild({num: $num}) // 这儿就不能用this.num了
        }
        .margin({
          top: 10,
          bottom: 10
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .height('100%')
  }
}

class FoodClass {
  order_id: number = 0
  food_name:  string = ""
  food_price: number = 0
  food_count: number = 0
}

@Component
struct BottomCart {
  @Link foodList:FoodClass[]
  build() {
    Row(){
      Button('点菜')
        .onClick(()=>{
          this.foodList = this.foodList.map(item => {
            item.food_count ++
            return item
          })
        })
    }
  }
}

@Component
struct FoodItem {
  @Link food: FoodClass
  build() {
    Row() {
      Text(this.food.food_name)
      Text('价格: '+ this.food.food_price.toString())
      Text('数量: '+ this.food.food_count.toString())
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .height(50)
  }
}

@Component
struct LinkChild {
  // 双向绑定用
  @Link num : number // 相对于swiftUI中的Binding
  build() {
    Column({space: 10}) {
      Text('子控件')
      Text(this.num.toString())
      Button('+1')
        .onClick(()=>{
          this.num++
        })
    }
    .backgroundColor(Color.Pink)
  }
}