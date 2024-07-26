/**
 * @author Tanranran
 * @date 2024/7/17 16:42
 * @description
 */
import { IRouterBService, ZZServices } from '@ranran/library_service/';
import { promptAction } from '@kit.ArkUI';

export class RouterBService extends ZZServices.ServiceProvider implements IRouterBService {
  showBModuleToast(): void {
    promptAction.showToast({
      message: "我是来自好价Module的Toast"
    })
  }
}