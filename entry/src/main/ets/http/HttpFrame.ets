import { HttpTask } from './HttpTask';
import { IDataListener } from './interface/IDataListener';
import { JsonHttpListener } from './JsonHttpListener';
import { JsonHttpRequest } from './JsonHttpRequest'
/**
 * Http 框架
 */
export class HttpFrame {
  /**
   * 发起请求
   * @param url
   * @param dataListener
   */
  static sendReq<T>(url: string, dataListener: IDataListener<T>){
    let jsonRequest = new JsonHttpRequest();
    let jsonHttpListener = new JsonHttpListener(dataListener);
    let task = new HttpTask(url, "", jsonRequest, jsonHttpListener);
    task.run()

  }
}