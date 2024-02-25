import { HttpConstants } from './HttpConstant'

export class HttpUtil {

  /**
   * 统一日志输出
   * @param msg
   */
  static log(msg: string): void {
    if (!HttpConstants.IS_DEBUG) {
      //ignore
      return;
    }
    console.log(`${HttpConstants.LOG_TAG}${msg}`);
  }
}