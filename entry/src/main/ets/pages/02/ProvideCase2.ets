import promptAction from '@ohos.promptAction';

@Entry
@Component
struct ProvideCase2 {
  @Provide('aa')
  // state, prop,link 都在watch前面，放在修饰符下面,第一次初始化的时候，@Watch不会被调用
  //
  @Watch('updateCount')
  money: number = 0
  updateCount(keyName: string) {
    // keyName 是没有任何意义的，因为watch监听的就是money，所以不写也可以
    // 更拿不到改变前的值，这个语法设计的就是只能拿当前值，this.money
    promptAction.showToast({
      message: this.money.toString()
    })
    console.log(keyName, Math.random().toFixed(5)) // 小数点后5位
  }


  build() {
    Column({space: 20}) {
      Text('父控件' + this.money)
        .onClick(()=>{
          this.money++
        })
      Son()
    }
    .width('100%')
    .aspectRatio(1)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
struct Son {
  @Consume('aa') count: number
  build() {
    Column({space: 20}) {
      Text('子控件' + this.count)
        .onClick(()=>{
          this.count++
        })
      Grand2()
    }
  }
}

@Component
struct Grand2 {
  @Consume('aa') price: number
  build() {
    Column({space: 20}) {
      Text('孙控件' + this.price)
        .onClick(()=>{
          this.price++
        })
    }
  }
}


// Object、class、string、number、boolean、enum 类型均支持
// 通过相同的变量别名绑定 @Provide('key') 和 @Consume('key') key需要保持一致
// 变量名不同没关系，可以用key值绑定
// ArkTS所有内容都不支持深层数据更新 UI渲染