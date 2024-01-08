struct LoadingCase extends   {
    constructor() { }
    aboutToAppear() {
        this.showLoading = true;
        setTimeout(() => {
            this.showLoading = false;
        }, 3000);
    }
    build() {
            .height('100%')
            // 和aboutToAppear 作用一样，前者更独立，适合解偶
            .onAppear(() => {
            this.showLoading = true;
            setInterval(() => {
                this.showLoading = false;
            }, 3000);
        });
    }
}
struct HMLoading extends   {
    constructor() { }
    // aboutToAppear 是初始化执行的函数
    // onAppear 是控件的显示
    aboutToAppear() {
        setInterval(() => {
            if (this.count == 100) {
                this.count = 0;
            }
            this.count++;
        }, 10);
    }
    build() {
            .style({
            strokeWidth: 6,
            scaleCount: 20
        });
    }
}
export {};
//# sourceMappingURL=LoadingCase.js.map