const std = @import("std");

const input = @embedFile("input.txt");

const LIMIT_RED   = 12;
const LIMIT_GREEN = 13;
const LIMIT_BLUE  = 14;

test possible {
    try std.testing.expect(possible("3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"));
    try std.testing.expect(possible("1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"));
    try std.testing.expect(!possible("8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"));
    try std.testing.expect(!possible("1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"));
    try std.testing.expect(possible("6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"));
}

fn strEqual(a: []const u8, b: []const u8) bool {
    if (std.mem.indexOf(u8, a, b)) |_| return true;
    return false;
}

fn possible(game: []const u8) bool {
    var pulls = std.mem.split(u8, game, ";");
    while (pulls.next()) |pull| {
        var counter: u32 = 0;
        var tokens = std.mem.split(u8, pull, " ");
        var i: bool = false;
        while (tokens.next()) |token| {
            if (token.len == 0) continue;
            var ctoken = std.mem.trim(u8, token, ",");
            switch (i) {
                false => counter = std.fmt.parseInt(u32, token, 10) catch unreachable,
                true => {
                    if ((strEqual(ctoken, "red") and counter > LIMIT_RED)
                        or (strEqual(ctoken, "blue") and counter > LIMIT_BLUE)
                        or (strEqual(ctoken, "green") and counter > LIMIT_GREEN))
                        return false;
                    counter = 0;
                }
                
            }
            i = !i;
        }
    }
    return true;
}

pub fn main() !void {
    var sum: u32 = 0;
    var lines = std.mem.split(u8, input, "\n");
    while (lines.next()) |line| {
        if (line.len == 0) continue;
        var game = std.mem.split(u8, line, ":");
        const id = blk: {
            var x = game.next().?;
            break :blk std.fmt.parseInt(u32, x[5..x.len], 10) catch unreachable;
        };
        const gamestr = game.next().?;
        if (possible(gamestr[1..gamestr.len])) {
            sum += id;
        }
    }
    std.debug.print("{d}\n", .{sum}); 
}
