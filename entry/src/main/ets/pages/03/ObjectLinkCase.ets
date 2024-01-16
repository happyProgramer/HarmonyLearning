// 03-02
@Entry
@Component
struct ObjectLinkCase {
  // class定义好了，初始化的时候就要用new的方式了
  @State cardList: HMFoodClass[] = [
    new HMFoodClass({
      order_id: 1,
      food_name: '鱼香肉丝',
      food_price: 18.8,
      food_count: 1
    })
,new HMFoodClass(    {
    order_id: 2,
    food_name: '粗溜丸子',
    food_price: 26,
    food_count: 2
  })
, new HMFoodClass(    {
    order_id: 3,
    food_name: '杂粮煎饼',
    food_price: 12,
    food_count: 1
  })]
  @State num: number = 0

  build() {
    Row() {
      Column() {
          ForEach(this.cardList,(card: HMFoodClass)=>{
            HMFoodItem({food: card})
          })
        ObjectLinkBottomCart({cardList: $cardList})
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .height('100%')
  }
}

// 就是一个协议,统一管理类型，
interface FoodInfo {
  order_id: number
  food_name:  string
  food_price: number
  food_count: number
}

// implements 遵守协议,目的是为了让构造函数可以轻易赋值
// class声明必须给初始值
@Observed
class HMFoodClass implements FoodInfo {
  order_id: number = 0
  food_name:  string = ""
  food_price: number = 0
  food_count: number = 0

  constructor(info: FoodInfo) {
    this.order_id = info.order_id
    this.food_name = info.food_name
    this.food_price = info.food_price
    this.food_count = info.food_count
  }
}

@Component
struct ObjectLinkBottomCart {
  @Link cardList:HMFoodClass[]
  build() {
    Row(){
      Button('点菜')
        .onClick(()=>{
          this.cardList = this.cardList.map(item => {
            item.food_count ++
            return item
          })
        })
    }
  }
}

@Component
struct HMFoodItem {
  @ObjectLink food: HMFoodClass
  build() {
    Row() {
      Text(this.food.food_name).textMiddleStyle()
      Text('价格: '+ this.food.food_price.toString()).textMiddleStyle()
      Row(){
        Text('-').calculateBtnStyle()
          .onClick(()=>{
            this.food.food_count--
          })
          .visibility(this.food.food_count > 0 ? Visibility.Visible : Visibility.Hidden)
        Text(this.food.food_count.toString())
          .textMiddleStyle()
          .visibility(this.food.food_count > 0 ? Visibility.Visible : Visibility.Hidden)
        Text('+').calculateBtnStyle()
          .onClick(()=>{
            this.food.food_count++
          })
      }
      .layoutWeight(1)
    }
    .width('100%')
    // .justifyContent(FlexAlign.SpaceEvenly)
    .height(50)
  }
}

@Extend(Text)
function calculateBtnStyle(){
  .width(30)
  .aspectRatio(1)
  .borderRadius(15)
  .fontColor(Color.Black)
  .backgroundColor('#ccc')
  .textAlign(TextAlign.Center)
}

@Extend(Text)
function textMiddleStyle () {
  .textAlign(TextAlign.Center)
  .fontSize(20)
  .layoutWeight(1)
}

// Observed 和 ObjectLink 才能有UI刷新的效果
// 字面量写法 {username:'老高'} 初始化写法 new Class({username:'老高'})