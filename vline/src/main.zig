const ff = @import("firefly");

var frame: u16 = 0;

pub export fn render() void {
    frame = @mod(frame + 1, 16);
    if (frame == 0) {
        ff.logDebug("looped");
    }
    const c: ff.Color = @enumFromInt(@mod(frame, 16) + 1);
    for (0..3) |_| {
        var x: i32 = 0;
        while (x < ff.width) {
            const p1 = ff.Point{ .x = x, .y = 0 };
            const p2 = ff.Point{ .x = x, .y = ff.height };
            const s = ff.LineStyle{
                .color = c,
                .width = 1,
            };
            ff.drawLine(p1, p2, s);
            x += 1;
        }
    }
}
