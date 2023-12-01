const std = @import("std");

const input = @embedFile("input.txt");

test getVals {
    try std.testing.expect(getVals("1abc2") == 12);
    try std.testing.expect(getVals("pqr3stu8vwx") == 38);
    try std.testing.expect(getVals("a1b2c3d4e5f") == 15);
    try std.testing.expect(getVals("treb7uchet") == 77);
}

fn getVals(line: []const u8) u32 {
    var result: u32 = 0;
    var i: usize = 0;
    while (i < line.len) : (i += 1) {
        if (std.fmt.parseInt(u32, line[i..i+1], 10)) |num| {
            result += num * 10;
            break;
        } else |_| {
            continue;
        }
    }
    i = line.len - 1;
    while (i >= 0) : (i -= 1) {
        if (std.fmt.parseInt(u32, line[i..i+1], 10)) |num| {
            result += num;
            break;
        } else |_| {
            continue;
        }
    }
    return result;
}

pub fn main() !void {
    var sum: u32 = 0;
    var lines = std.mem.split(u8, input, "\n");
    while (lines.next()) |line| {
        if (line.len <= 0) continue;
        sum += getVals(line);
    }
    std.debug.print("{d}\n", .{sum});
}

