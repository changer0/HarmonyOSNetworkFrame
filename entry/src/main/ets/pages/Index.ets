import { HttpFrame } from '../http/HttpFrame';
import { IDataListener } from '../http/interface/IDataListener';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State font_size: number = 50;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(this.font_size)
          .fontWeight(FontWeight.Bold)

          .onClick(() => {
            console.log(`发生了点击~`);
            if (this.message != 'Hello World') {
              this.message = 'Hello World';
              this.font_size = 50;
              return;
            }

            // 实现 IDataListener 接口的具名类
            class MyDataListener implements IDataListener<string> {
              private index: Index;
              constructor(index: Index) {
                this.index = index;
              }

              onSuccess(result: string) {
                this.index.message = JSON.stringify(result);
                this.index.font_size = 10;
              }

              onFailure() {
                console.log("网络请求失败了！");
                this.index.font_size = 10;
                this.index.message = "网络失败了!"
              }
            }
            HttpFrame.sendReq<string>("https://gitee.com/luluzhang/HotSearchConfigProject/raw/master/config.json", new MyDataListener(this))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}