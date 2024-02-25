import { HttpConstants } from './HttpConstant';
import { HttpUtil } from './HttpUtil';
import { IHttpListener } from './interface/IHttpListener';
import { IHttpRequest } from './interface/IHttpRequest'


export class HttpTask {

  private httpRequest: IHttpRequest;

  constructor(url: string, requestData: string, httpRequest: IHttpRequest, httpListener: IHttpListener) {
    this.httpRequest = httpRequest;
    this.httpRequest.setUrl(url);
    this.httpRequest.setListener(httpListener);

    if (!requestData) {
      this.httpRequest.setParam(requestData);
    }
  }

  async run(): Promise<void> {
    await this.httpRequest.execute();
  }

}