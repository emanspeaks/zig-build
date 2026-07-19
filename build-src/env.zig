const std = @import("std");

pub const DevkitInfo = struct {
    devkit_path: []const u8,
    devkit_inc: std.Build.LazyPath,
};

pub fn envVar(b: *std.Build, name: []const u8) []const u8 {
    return b.graph.environ_map.get(name) orelse
        std.debug.panic("env var {s} not set (source common.sh / .envrc first)", .{name});
}

pub fn getDevkitInfo(b: *std.Build) DevkitInfo {
    const devkit = b.graph.environ_map.get("DEVKIT_WIN") orelse envVar(b, "DEVKIT");
    return .{
        .devkit_path = devkit,
        .devkit_inc = .{ .cwd_relative = b.fmt("{s}/include", .{devkit}) },
    };
}
