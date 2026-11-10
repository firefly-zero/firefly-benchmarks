const ff = @import("firefly");

pub export fn render() void {
    for (0..3) |_| {
        var x: i32 = 0;
        while (x < ff.width) {
            const c1: ff.Color = @fromBackingInt(@intCast(@mod(x, 16) + 1));
            const c2: ff.Color = @fromBackingInt(@intCast(@mod(x, 16) + 1));
            const p = ff.Point{ .x = x, .y = @divTrunc(x, 2) };
            const b = ff.Size{ .width = x + 1, .height = x * 4 + 1 };
            const s = ff.Style{
                .fill_color = c1,
                .stroke_color = c2,
                .stroke_width = @divTrunc(x, 10) + 1,
            };
            ff.drawRect(p, b, s);
            x += 1;
        }
    }
}
