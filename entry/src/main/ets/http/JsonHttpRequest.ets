import { IHttpListener } from './interface/IHttpListener';
import { IHttpRequest } from './interface/IHttpRequest';
import { http } from '@kit.NetworkKit';

export class JsonHttpRequest implements IHttpRequest {
  private url: string = '';
  private param: string = '';
  private httpListener: IHttpListener | null = null;

  setUrl(url: string): void {
    this.url = url;
  }

  setParam(params: string): void {
    this.param = params;
  }

  execute(): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      let httpRequest = http.createHttp();
      httpRequest.request(// 请求url地址
        this.url,
        {
          // 请求方式
          method: http.RequestMethod.GET,
          // 可选，默认为60s
          connectTimeout: 60000,
          // 可选，默认为60s
          readTimeout: 60000,
          // 可选，默认无此字段
          expectDataType: http.HttpDataType.STRING,
          // 可选，默认为true
          usingCache: true,
          // 可选，默认为1
          priority: 1,
          // 可选，默认值由系统自动指定。
          usingProtocol: http.HttpProtocol.HTTP1_1,
          // 可选，默认为false
          usingProxy: false,
          // 开发者根据自身业务需要添加header字段
          header: {
            'Content-Type': 'application/json'
          }
        }).then((data) => {
        if (data.responseCode == http.ResponseCode.OK) {
          this.httpListener?.onSuccess(data.result?.toString())
          resolve();
        } else {
          this.httpListener?.onFailure();
          reject()
        }
      })
    })
  }

  setListener(listener: IHttpListener): void {
    this.httpListener = listener;
  }
}