const ff = @import("firefly");

var img: ff.Image = undefined;

pub export fn boot() void {
    var buf: [21]u8 = undefined;
    img = ff.loadFile("img", &buf);
}

pub export fn render() void {
    for (0..3) |_| {
        var y: i32 = 0;
        while (y < ff.height) {
            var x: i32 = 0;
            while (x < ff.width) {
                const p = ff.Point{ .x = x, .y = y };
                ff.drawImage(img, p);
                x += 16;
            }
            y += 1;
        }
    }
}
