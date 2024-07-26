/**
 * @author Tanranran
 * @date 2024/7/17 16:42
 * @description
 */
import { IRouterAService, ZZServices } from '@ranran/library_service';
import { promptAction } from '@kit.ArkUI';

export class RouterAService extends ZZServices.ServiceProvider implements IRouterAService {
  showAmoduleToast(): void {
    promptAction.showToast({
      message: "我是来自首页Module的Toast"
    })
  }
}