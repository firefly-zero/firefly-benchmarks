const ff = @import("firefly");

var img: ff.Image = undefined;

pub export fn boot() void {
    var buf: [8196]u8 = undefined;
    img = ff.loadFile("img", &buf).toImage();
}

pub export fn render() void {
    const sub = img.sub(
        ff.Point{ .x = 8, .y = 8 },
        ff.Size{ .width = 16, .height = 16 },
    );
    ff.drawNineSlice(
        sub,
        ff.Point.zero,
        ff.Size.screen,
    );
}
