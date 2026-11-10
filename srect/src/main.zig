const ff = @import("firefly");

var frame: u16 = 0;

pub export fn render() void {
    frame = @mod(frame + 1, 16);
    const c: ff.Color = @fromBackingInt(@intCast(@mod(frame, 16) + 1));
    const s = ff.Style{
        .fill_color = c,
        .stroke_color = ff.Color.none,
        .stroke_width = 0,
    };
    for (0..3) |_| {
        var x: i32 = 0;
        while (x < ff.width) {
            const p = ff.Point{ .x = x, .y = @divTrunc(x, 2) };
            const b = ff.Size{ .width = x + 1, .height = x * 4 + 1 };
            ff.drawRect(p, b, s);
            x += 1;
        }
    }
}
