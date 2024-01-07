@Entry
@Component
struct ConditionCase {
  @State selectedList:{value: string} [] = [{value: "勇士"},{value: "湖人"},{value:"太阳"}]
  @State selectedIndex: number = -1
  @State isOn: boolean = true

  build() {
    Row() {
      Column({space: 20}) {
        Select(this.selectedList)
          .onSelect((index)=>{
            this.selectedIndex = index
          })
        if (this.selectedIndex == 0) {
          Text("史蒂芬库里")
        }
        if(this.selectedIndex == 1) {
          Text("勒布朗")
        }
        if (this.selectedIndex == 2) {
          Text("凯文")
        }
        Image($r('app.media.my'))
          // .width(this.isOn ? 100 : 0)
          .width(200)
          .aspectRatio(1)
          .borderRadius(8)
          .visibility(this.isOn ? Visibility.Visible : Visibility.Hidden) // Hidden 只是看不见了，但位置依然在
        Image($r('app.media.handsome'))
          // .width(this.isOn ? 100 : 0)
          .width(200)
          .aspectRatio(1)
          .borderRadius(8)
          .visibility(this.isOn ? Visibility.Visible : Visibility.None) // None 是连同空间一同没了，位置也没了

        Button("条件控制图片显示与否")
          .onClick(()=>{
            this.isOn = !this.isOn
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct SingleConditionJudge {
 @State showImg: boolean = false
  build() {
    Row() {
      Column() {
        Toggle({
          type: ToggleType.Switch,
          isOn: this.showImg
        })
        .onChange((value) => {
          this.showImg = value
        })
        if (this.showImg) {
          Image("/assets/cat.png")
            .width(200)
            .aspectRatio(1)
            .borderRadius(100)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}