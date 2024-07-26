
/**
 * 用于拿到Class 类，然后实例化
 * @author Tanranran
 * @date 2024/7/17 16:19
 * @description
 */
export interface IClassConstructor<T> {
  new(...args: any[]): T
}