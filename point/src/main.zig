const ff = @import("firefly");

var frame: u16 = 0;

pub export fn render() void {
    frame = @mod(frame + 1, 16);
    const c: ff.Color = @enumFromInt(@mod(frame, 16) + 1);
    var y: i32 = 0;
    while (y < ff.height) {
        var x: i32 = 0;
        while (x < ff.width) {
            const p = ff.Point{ .x = x, .y = y };
            ff.drawPoint(p, c);
            x += 1;
        }
        y += 1;
    }
}
