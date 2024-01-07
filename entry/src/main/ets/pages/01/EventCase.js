import promptAction from '@ohos.promptAction';
struct EventCase extends   {
    constructor() { }
    login() {
        if (this.username === 'admin' && this.password === '123456') {
            promptAction.showToast({ message: '登录成功' });
        }
        else {
            promptAction.showToast({ message: '用户名或密码错误！' });
        }
    }
    getBtnEnable() {
        return this.username !== "" && this.password !== "";
    }
    build() {
            .height('100%');
    }
}
//# sourceMappingURL=EventCase.js.map