const std = @import("std");

const input = @embedFile("input.txt");

test getVals {
    try std.testing.expect(getVals("two1nine")          == 29);
    try std.testing.expect(getVals("eightwothree")      == 83);
    try std.testing.expect(getVals("abcone2threexyz")   == 13);
    try std.testing.expect(getVals("xtwone3four")       == 24);
    try std.testing.expect(getVals("4nineeightseven2")  == 42);
    try std.testing.expect(getVals("zoneight234")       == 14);
    try std.testing.expect(getVals("7pqrstsixteen")     == 76);
}

fn isNum(str: []const u8) u32 {
    if (std.mem.indexOf(u8, str, "one"))    |_| return 1;
    if (std.mem.indexOf(u8, str, "two"))    |_| return 2;
    if (std.mem.indexOf(u8, str, "three"))  |_| return 3;
    if (std.mem.indexOf(u8, str, "four"))   |_| return 4;
    if (std.mem.indexOf(u8, str, "five"))   |_| return 5;
    if (std.mem.indexOf(u8, str, "six"))    |_| return 6;
    if (std.mem.indexOf(u8, str, "seven"))  |_| return 7;
    if (std.mem.indexOf(u8, str, "eight"))  |_| return 8;
    if (std.mem.indexOf(u8, str, "nine"))   |_| return 9;
    return 0; 
}

fn getVals(line: []const u8) u32 {
    var result: u32 = 0;
    var i: usize = 0;
    var j: u32 = 0;

    while (i < line.len) : (i += 1) {
        j = isNum(line[0..i+1]);
        if (j > 0) {
            result += j * 10;
            break;
        }
        if (std.fmt.parseInt(u32, line[i..i+1], 10)) |num| {
            result += num * 10;
            break;
        } else |_| {
            continue;
        }
    }
    i = line.len - 1;
    j = 0;
    while (i >= 0) : (i -= 1) {
        j = isNum(line[i..line.len]);
        if (j > 0) {
            result += j;
            break;
        }
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

