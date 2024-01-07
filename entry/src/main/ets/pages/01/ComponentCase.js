"use strict";
struct ComponentCase extends   {
    constructor() { }
    build() {
        ;
    }
}
struct FlexCase extends   {
    constructor() { }
    build() {
            .margin({
            top: 210
        });
    }
}
struct Horizontal extends   {
    constructor() { }
    build() {
            .margin({
            bottom: 30,
            top: 30
        });
        // .justifyContent(FlexAlign.SpaceAround)
    }
}
struct Vertical extends   {
    constructor() { }
    build() {
            .width('100%')
            // .justifyContent(FlexAlign.SpaceAround)
            .justifyContent(FlexAlign.Center);
    }
}
struct TextDemo extends   {
    constructor() { }
    build() {
            .width('100%');
    }
}
//# sourceMappingURL=ComponentCase.js.map