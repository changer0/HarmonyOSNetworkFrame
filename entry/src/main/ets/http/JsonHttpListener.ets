import { IDataListener } from './interface/IDataListener';
import { IHttpListener } from './interface/IHttpListener';

export class JsonHttpListener<T> implements IHttpListener {

  private dataListener: IDataListener<T>;

  constructor(dataListener: IDataListener<T>) {
    this.dataListener = dataListener;
  }

  onSuccess(result: string): void {
    let obj: T = JSON.parse(result);
    this.dataListener.onSuccess(obj);
  }

  onFailure(): void {
    this.dataListener.onFailure();
  }
}