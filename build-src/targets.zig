const std = @import("std");

pub const TargetInfo = struct {
    resolved: std.Build.ResolvedTarget,
    tgt: std.Target,
    triple: []const u8,
};

pub fn getTargetDetails(b: *std.Build) TargetInfo {
    const target = b.standardTargetOptions(.{});
    const tgt = target.result;
    return TargetInfo{
        .resolved = target,
        .tgt = tgt,
        .triple = b.fmt("{s}-{s}-{s}", .{ @tagName(tgt.cpu.arch), @tagName(tgt.os.tag), @tagName(tgt.abi) }),
    };
}
