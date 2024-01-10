import List from '@ohos.util.List'
@Entry
@Component
struct ZhihuCase {
  @State list: ReplyItem[] = [
    {
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '偏执狂-妄想家',
      content: '更何况还分到一个摩洛哥[惊喜]',
      time: '11-30',
      area: '海南',
      likeNum: 34
    },
    {
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'William',
      content: '当年希腊可是把1：0发挥到极致了',
      time: '11-29',
      area: '北京',
      likeNum: 58
    },
    {
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Andy Garcia',
      content: '欧洲杯其实16队球队打正赛已经差不多，24队打正赛意味着正赛阶段在小组赛一样有弱队。',
      time: '11-28',
      area: '上海',
      likeNum: 10
    },
    {
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '正宗好鱼头',
      content: '确实眼红啊，亚洲就没这种球队，让中国队刷',
      time: '11-27',
      area: '香港',
      likeNum: 139
    },
    {
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '柱子哥',
      content: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
      time: '11-27',
      area: '旧金山',
      likeNum: 29
    },
    {
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '飞轩逸',
      content: '禁止欧洲杯扩军之前，应该先禁止世界杯扩军，或者至少把亚洲名额一半给欧洲。',
      time: '11-26',
      area: '里约',
      likeNum: 100
    }
  ]

  changeLike(item: ReplyItem) {
    if (item.likeFlag) {
      item.likeNum --
      item.likeFlag = false
    } else {
      item.likeNum ++
      item.likeFlag = true
    }
    // 以上不能刷线UI，因为state只能监听第一层的改变，而现在做的是，对变量里的对象的某个属性赋值，监听不到
    let index = this.list.findIndex(obj => obj.id == item.id)
    // this.list[index] = {...item } // 4.0 可以，但下一代禁用
    // this.list.splice(index, 1, item)  // 删除index之后的对象，删除1个，替换item
    this.list.splice(index, 1)
    this.list.splice(index, 0, item)
  }

  addComment(item: ReplyItem) {
    this.list.unshift(item) // 这是将item插入到顶部的操作
  }
  build() {
    Stack({alignContent: Alignment.Bottom}) {
      Scroll() {
        Column() {
          ZhihuNav()
          ZhihuComments({item:{
            id: 999,
            avatar: '/assets/cat.png',
            author: '周杰伦',
            content: '意大利拌面应该使用42号钢筋混凝土再加上量子力学缠绕最后通过不畏浮云遮望眼。',
            time : '10-17',
            area:'北京',
            likeNum:  100,
            likeFlag :true
          },changeLike:item =>{
            this.changeLike(item)
          }})
          Divider()
            .strokeWidth(6)
            .color('#f4f5f6')
          ForEach(this.list,(obj: ReplyItem)=> {
            ZhihuComments({item: obj,changeLike:item => {
              this.changeLike(item)
            }})
          })
        }
      } // scroll 只能放一个组件，步步为坑
      .padding({
        bottom: 50
      })
      ReplyInput({addItem: (item: ReplyItem) => {
        this.addComment(item)
      }})
    }
  }
}

@Component
struct ReplyInput {
  @State replyStr: string = ''
  addItem:(item: ReplyItem) => void = () => {}
  build() {
    Row() {
      TextInput({placeholder: '回复～',text: this.replyStr})
        .layoutWeight(1)
        .onChange((value)=> {
          this.replyStr = value
        })
      Text('发布')
        .fontColor('#6ecff0')
        .margin({
          left: 10
        })
        .onClick(()=>{
          if (this.replyStr !== '') { // 处理边际情况，什么都不输入的时候不能发布
            // 传值给外界调用
            let addItem: ReplyItem = {
              id: Date.now(),
              avatar: '/assets/test.jpeg',
              author: '喵星人',
              content:this.replyStr,
              time: `${new Date().getMonth() + 1}-${new Date().getDate()}`, // 日期默认是0-11，所以要+1
              area: '北京',
              likeNum : 0,
              likeFlag : false
            }
            this.addItem(addItem)
            this.replyStr = ''
          }
        })
    }
    .border({
      color: '#f4f5f6',
      width:{
        top: 1
      }
    })
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height(50)
    .backgroundColor(Color.White)
    .padding({
      left: 10,
      right: 10
    })
  }
}

@Component
struct ZhihuComments {
  item: Partial<ReplyItem> = {} // Partial 起到可选项的作用，属性可有可无此时代表任何属性都没有，
  changeLike:(item:ReplyItem) => void = () => {}
  build() {
    Row() {
      Image(this.item.avatar)
        .width(32)
        .aspectRatio(1)
        .borderRadius(16)
      Column({space: 10}) {
        Text(this.item.author)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text(this.item.content)
          .lineHeight(20)
          .fontSize(16)
          .fontColor('#565656')

        Row() {
          Text(`${this.item.time}. IP 属地${this.item.area}`)
            .fontSize(12)
            .fontColor('#c3c4c5')
          Row() {
            Image($r('app.media.favorite_block'))
              .width(12)
              .aspectRatio(1)
              .fillColor(this.item.likeFlag ? Color.Red : '#c3c4c5')
              .margin({
                right: 5
              })
            Text(this.item.likeNum.toString())
              .fontSize(12)
              .fontColor('#c3c4c5')
          }
          .onClick(()=>{
            this.changeLike(this.item as ReplyItem) // 需要给定变量类型,因为当前item是Partial<ReplyItem>类型，而函数需要ReplyItem类型
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({
        left: 10
      })
    }
    .alignItems(VerticalAlign.Top)
    .padding(15)
  }
}


@Component
struct ZhihuNav {
  build() {
    Row() {
      Row(){
        Image($r("app.media.ic_public_arrow_left"))
          .width(18)
          .aspectRatio(1)
          .fillColor('#848484')
      }
      .justifyContent(FlexAlign.Center)
      .width(30)
      .aspectRatio(1)
      .backgroundColor('#f5f5f5')
      .borderRadius(15)
      .margin({
        left: 15
      })

      Text("评论回复")
        .fontSize(19)
        .layoutWeight(1)
        .textAlign(TextAlign.Center) // 用justify不好使
        .padding({
          right: 39
        })
    }
    .height(50)
    .border({
      color: '#f4f4f4',
      width: {
        bottom: 1
      }
    })
  }
}

// 4.0 next中，class的每一个属性都要有默认值，这里先给赋上
// arkTS中，属性可以有两种类型
// export 代表当下class在当前位置，以后一定是要导出的
export class ReplyItem {
  id: number = 0
  avatar: string | Resource = ''
  author: string = ''
  content: string = ''
  time: string = ''
  area: string = ''
  likeNum: number = 0
  likeFlag?: boolean = false
 }