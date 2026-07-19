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

// prints `message` when this step runs; wire deps with .dependOn so it lands
// at an exact point in the graph instead of racing other steps
pub fn addAnnounce(b: *std.Build, message: []const u8) *std.Build.Step {
    const step = b.allocator.create(std.Build.Step) catch @panic("OOM");
    step.* = std.Build.Step.init(.{
        .id = .custom,
        .name = message,
        .owner = b,
        .makeFn = announceMake,
    });
    return step;
}

fn announceMake(step: *std.Build.Step, options: std.Build.Step.MakeOptions) anyerror!void {
    _ = options;
    std.debug.print("{s}\n", .{step.name});
}
