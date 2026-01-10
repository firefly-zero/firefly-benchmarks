const ff = @import("firefly");

var frame: u16 = 0;

pub export fn render() void {
    frame = @mod(frame + 1, 16);
    if (frame == 0) {
        ff.logDebug("looped");
    }
    const c: ff.Color = @enumFromInt(@mod(frame, 16) + 1);
    for (0..200) |_| {
        var y: i32 = 0;
        while (y < ff.height) {
            const p1 = ff.Point{ .x = 0, .y = y };
            const p2 = ff.Point{ .x = ff.width, .y = y };
            const s = ff.LineStyle{
                .color = c,
                .width = 1,
            };
            ff.drawLine(p1, p2, s);
            y += 1;
        }
    }
}
