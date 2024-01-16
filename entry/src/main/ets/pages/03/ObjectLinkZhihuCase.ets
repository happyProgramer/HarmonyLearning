// 03-03
import { ReplyItem } from '../01/zhihu/ZhihuCase'

@Entry
@Component
struct ObjectLinkZhihuCase {
  @State list: ReplyClass[] = [
    new ReplyClass({
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '偏执狂-妄想家',
      content: '更何况还分到一个摩洛哥[惊喜]',
      time: '11-30',
      area: '海南',
      likeNum: 34
    }),
    new ReplyClass({
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'William',
      content: '当年希腊可是把1：0发挥到极致了',
      time: '11-29',
      area: '北京',
      likeNum: 58
    }),
    new ReplyClass({
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Andy Garcia',
      content: '欧洲杯其实16队球队打正赛已经差不多，24队打正赛意味着正赛阶段在小组赛一样有弱队。',
      time: '11-28',
      area: '上海',
      likeNum: 10
    }),
    new ReplyClass({
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '正宗好鱼头',
      content: '确实眼红啊，亚洲就没这种球队，让中国队刷',
      time: '11-27',
      area: '香港',
      likeNum: 139
    }),
    new ReplyClass({
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '柱子哥',
      content: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
      time: '11-27',
      area: '旧金山',
      likeNum: 29
    }),
    new ReplyClass({
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '飞轩逸',
      content: '禁止欧洲杯扩军之前，应该先禁止世界杯扩军，或者至少把亚洲名额一半给欧洲。',
      time: '11-26',
      area: '里约',
      likeNum: 100
    })]

  addComment(item: ReplyClass) {
    this.list.unshift(item) // 这是将item插入到顶部的操作
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Scroll() {
        Column() {
          ObjectLinkZhihuNav()
          // ObjectLinkZhihuComments({item: new ReplyClass( {
          //     id: 999,
          //     avatar: '/assets/cat.png',
          //     author: '周杰伦',
          //     content: '意大利拌面应该使用42号钢筋混凝土再加上量子力学缠绕最后通过不畏浮云遮望眼。',
          //     time : '10-17',
          //     area:'北京',
          //     likeNum:  100,
          //     likeFlag :true
          //   })
          // })
          Divider()
            .strokeWidth(6)
            .color('#f4f5f6')
          ForEach(this.list, (obj: ReplyClass) => {
            ObjectLinkZhihuComments({ item: obj })
          })
        }
      } // scroll 只能放一个组件，步步为坑
      .padding({
        bottom: 50
      })
      ObjectLinkReplyInput({
        addItem:(item: ReplyClass) => {
          this.addComment(item)
        }
      })
    }
  }
}

@Component
struct ObjectLinkReplyInput {
  @State replyStr: string = ''
  addItem:(item: ReplyClass) => void = () => {}
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
            let addItem: ReplyClass = new ReplyClass({
              id: Date.now(),
              avatar: '/assets/test.jpeg',
              author: '喵星人',
              content:this.replyStr,
              time: `${new Date().getMonth() + 1}-${new Date().getDate()}`, // 日期默认是0-11，所以要+1
              area: '北京',
              likeNum : 0,
              likeFlag : false
            })
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
struct ObjectLinkZhihuComments {
  @ObjectLink
  item: ReplyClass
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
            if(this.item.likeFlag) {
              this.item.likeNum--
              this.item.likeFlag = false
            }else {
              this.item.likeNum++
              this.item.likeFlag = true
            }
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
struct ObjectLinkZhihuNav {
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

// 当前文件下，可以直接继承，做扩展，从外面导入进来的class，目前会报错，
// 导入路径是 import { ReplyItem } from '../01/zhihu/ZhihuCase'
export class InternalReply {
  id: number = 0
  avatar: string | Resource = ''
  author: string = ''
  content: string = ''
  time: string = ''
  area: string = ''
  likeNum: number = 0
  likeFlag?: boolean = false
}

@Observed
class ReplyClass extends InternalReply {
  constructor(obj: InternalReply) {
    super()
    this.id = obj.id
    this.avatar = obj.avatar
    this.author = obj.author
    this.content = obj.content
    this.time = obj.time
    this.area = obj.area
    this.likeNum = obj.likeNum
    this.likeFlag = obj.likeFlag
  }
}

// interface ReplyTool {
//   id: number
//   avatar: string | Resource
//   author: string
//   content: string
//   time: string
//   area: string
//   likeNum: number
//   likeFlag?: boolean
// }
//
// @Observed
// class ReplyClass implements ReplyTool {
//   id: number = 0
//   avatar: string | Resource = ''
//   author: string = ''
//   content: string = ''
//   time: string = ''
//   area: string = ''
//   likeNum: number = 0
//   likeFlag?: boolean = false
//
//   constructor(obj: ReplyClass) {
//     this.id = obj.id
//     this.avatar = obj.avatar
//     this.author = obj.author
//     this.content = obj.content
//     this.time = obj.time
//     this.area = obj.area
//     this.likeNum = obj.likeNum
//     this.likeFlag = obj.likeFlag
//   }
// }

// extends 的方式报错，因为导入有问题
// 字面量方式{username: '老高'}，class方式 new ReplyItem{username: '老高'}
// extends 与 implements 的区别
// implements 是遵守协议，实现协议方法的过程
// extends 强调继承