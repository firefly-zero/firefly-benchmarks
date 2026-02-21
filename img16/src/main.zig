const ff = @import("firefly");

var img: ff.Image = undefined;

pub export fn boot() void {
    var buf: [36]u8 = undefined;
    img = ff.loadFile("img", &buf);
}

pub export fn render() void {
    var i: u8 = 0;
    while (i < 3) {
        i += 1;
        var y: i32 = 0;
        while (y < ff.height) {
            var x: i32 = 0;
            while (x < ff.width) {
                const p = ff.Point{ .x = x, .y = y };
                ff.drawImage(img, p);
                x += 16;
            }
            y += 4;
        }
    }
}
