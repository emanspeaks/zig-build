const std = @import("std");
const TargetInfo = @import("targets.zig").TargetInfo;

// zig source submodule root, relative to zig-build's build.zig
pub const zig_src = "zig-src";

// Matches -Wl,--stack,0x10000000 in CMakeLists.
pub const stack_size = 0x10000000;

pub fn cExe(b: *std.Build, tgtinfo: TargetInfo, name: []const u8) *std.Build.Step.Compile {
    return b.addExecutable(.{
        .name = name,
        .root_module = b.createModule(.{ .target = tgtinfo.resolved, .optimize = .ReleaseFast, .link_libc = true }),
    });
}
