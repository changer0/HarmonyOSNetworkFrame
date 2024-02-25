
/**
 * 数据回调
 */
export interface IDataListener<T> {
  onSuccess(result: T): void;
  onFailure(): void;
}