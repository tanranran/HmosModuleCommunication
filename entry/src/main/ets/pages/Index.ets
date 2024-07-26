import { ZZServices } from '@ranran/library_service';
import { RouterAService } from '@ranran/module_a';
import { RouterBService } from '@ranran/module_b';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    ZZServices.addService(ZZServices.ServiceName.AService, RouterAService)
    ZZServices.addService(ZZServices.ServiceName.BService, RouterBService)
  }

  build() {
    Column() {
      Button('调用A module中的方法').onClick(() => {
        ZZServices.getAService()?.showAmoduleToast()
      })
      Button('调用B module中的方法').onClick(() => {
        ZZServices.getBService()?.showBModuleToast()
      })
    }
    .height('100%')
    .width('100%')
  }
}