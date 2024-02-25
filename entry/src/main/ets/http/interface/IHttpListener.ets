
/**
 * 网络请求回调
 */
export interface IHttpListener {
  onSuccess(result: string): void;
  onFailure(): void;
}