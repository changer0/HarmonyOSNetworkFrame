import { IHttpListener } from './IHttpListener';

/**
 * 请求接口
 */
export interface IHttpRequest {
  setUrl(url: string): void;
  setParam(params: string): void;
  execute(): Promise<void>;

  setListener(listener: IHttpListener): void
}