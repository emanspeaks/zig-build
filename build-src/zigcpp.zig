const std = @import("std");

const TargetInfo = @import("targets.zig").TargetInfo;
const utils = @import("utils.zig");
const zig_src = utils.zig_src;
const DevkitInfo = @import("env.zig").DevkitInfo;

const cpp_flags = [_][]const u8{
    "-std=c++17",
    "-O2",
    "-DNDEBUG",
    "-fno-exceptions",
    "-fno-rtti",
    "-fno-stack-protector",
    "-fvisibility-inlines-hidden",
    "-Wno-type-limits",
    "-Wno-missing-braces",
    "-Wno-comment",
    "-Wno-format",
    "-DCLANG_BUILD_STATIC",
    "-DLLVM_BUILD_STATIC",
    "-D_GNU_SOURCE",
    "-D__STDC_CONSTANT_MACROS",
    "-D__STDC_FORMAT_MACROS",
    "-D__STDC_LIMIT_MACROS",
};

const cpp_sources = [_][]const u8{
    zig_src ++ "/src/zig_llvm.cpp",
    zig_src ++ "/src/zig_llvm-ar.cpp",
    zig_src ++ "/src/zig_clang_driver.cpp",
    zig_src ++ "/src/zig_clang_cc1_main.cpp",
    zig_src ++ "/src/zig_clang_cc1as_main.cpp",
};

pub fn buildZigCpp(b: *std.Build, tgtinfo: TargetInfo, devkit: DevkitInfo) *std.Build.Step.Compile {
    const cppmod = b.createModule(.{ .target = tgtinfo.resolved, .optimize = .ReleaseFast, .link_libc = true, .link_libcpp = true });
    cppmod.addIncludePath(devkit.devkit_inc);
    for (cpp_sources) |f| cppmod.addCSourceFile(.{ .file = b.path(f), .flags = &cpp_flags });
    const zigcpp = b.addLibrary(.{ .name = "zigcpp", .linkage = .static, .root_module = cppmod });
    // zig2 links this directly.
    // stage3 builds its own separate copy via -Dstatic-llvm,
    // so this one never needs to save anything to disk.
    return zigcpp;
}
