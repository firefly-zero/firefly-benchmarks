const ff = @import("firefly");

var img: ff.Image = undefined;

pub export fn boot() void {
    var buf: [8196]u8 = undefined;
    img = ff.loadFile("img", &buf);
}

pub export fn render() void {
    var y: i32 = 0;
    while (y < ff.height) {
        var subx: i32 = 24 + @mod(y, 3) * 8;
        var x: i32 = 0;
        while (x < ff.width) {
            const sub: ff.SubImage = .{
                .raw = img,
                .point = ff.Point{ .x = subx, .y = 0 },
                .size = ff.Size{ .width = 8, .height = 8 },
            };
            const p = ff.Point{ .x = x, .y = y };
            ff.drawSubImage(sub, p);
            x += 8;
            subx += 8;
            if (subx > 64) {
                subx = 24;
            }
        }
        y += 8;
    }
}
