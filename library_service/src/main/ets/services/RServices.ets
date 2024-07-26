/**
 *  跨模块module 调用方法的 service 工具类
 * @author Tanranran
 * @date 2024/7/17 15:34
 * @description
 */
import { IClassConstructor } from './IClassConstructor';
import { IRouterBService } from './IRouterBService';
import { IRouterAService } from './IRouterAService';


export class ZZServices {
  private static routerHomeService?: IRouterAService;
  private static routerHaoJiaService?: IRouterBService;
  private static servicesMap = new Map<ZZServices.ServiceName, ZZServices.ServiceProvider>()

  static getAService(): IRouterAService | undefined {
    if (ZZServices.routerHomeService) {
      return ZZServices.routerHomeService
    }
    if (ZZServices.servicesMap.has(ZZServices.ServiceName.AService)) {
      const service = ZZServices.servicesMap.get(ZZServices.ServiceName.AService)
      if (service) {
        ZZServices.routerHomeService = service as object as IRouterAService;
      }
    }
    return ZZServices.routerHomeService
  }

  static getBService(): IRouterBService | undefined {
    if (ZZServices.routerHaoJiaService) {
      return ZZServices.routerHaoJiaService
    }
    if (ZZServices.servicesMap.has(ZZServices.ServiceName.BService)) {
      const service = ZZServices.servicesMap.get(ZZServices.ServiceName.BService)
      if (service) {
        ZZServices.routerHaoJiaService = service as object as IRouterBService;
      }
    }
    return ZZServices.routerHaoJiaService
  }

  public static addService<T extends ZZServices.ServiceProvider>(name: ZZServices.ServiceName,
    cls: IClassConstructor<T>) {
    let provider = new cls()
    ZZServices.servicesMap.set(name, provider)
    provider.register()
  }
}

export namespace ZZServices {
  /**
   * 要注册的服务名称
   */
  export enum ServiceName {
    AService = 'AService',
    BService = 'BService'
  }

  /**
   * @author Tanranran
   * @date 2024/7/17 16:22
   * @description
   */
  export abstract class ServiceProvider {
    // 在此期间注册服务，预留，可以干一些服务注册时，你想干的事
    register() {

    }
  }
}
