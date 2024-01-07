@Entry
@Component
struct ImageCase {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {

        // Image('/assets/a.png') // 使用本地图片
        // Image($r('app.media.icon')) // 使用资源引入，不写后缀也可以，只能当下目录，不能再建文件夹
        // 采用原始文件图片
        // Image($rawfile("github.jpg")) // 为什么自己倒入的jpg格式就加载不出来，老师给的就可以, 刷新下也可以
        // Image($rawfile('pythonImage.jpg'))
        // 使用网络资源
        Image("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F2bf1b169-d217-44c3-a5b3-dd00813bc20d%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1704614176&t=e15a2fd5193aeeb24fc95b5dbe395907")
          .width('100%')
          .aspectRatio(1)
      }
      .width('100%')
    }
    .height('100%')
  }
}