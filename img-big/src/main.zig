// Draw a big images that only partially fit on the screen.
const ff = @import("firefly");
const std = @import("std");

var bg: ff.Image = undefined;
var holes: ff.Image = undefined;
var track: ff.Image = undefined;
var trees: ff.Image = undefined;
var water: ff.Image = undefined;

pub export fn boot() void {
    const alloc = std.heap.wasm_allocator;
    bg = ff.loadFileBuf("bg", alloc).?;
    holes = ff.loadFileBuf("holes", alloc).?;
    track = ff.loadFileBuf("track", alloc).?;
    trees = ff.loadFileBuf("trees", alloc).?;
    water = ff.loadFileBuf("water", alloc).?;
}

pub export fn render() void {
    const p = ff.Point{ .x = -150, .y = -300 };
    ff.drawImage(bg, p);
    ff.drawImage(water, p);
    ff.drawImage(track, p);
    // ff.drawImage(holes, p);
    // ff.drawImage(trees, p);
}
