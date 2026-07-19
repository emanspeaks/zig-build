// Bootstrap build for stage3 zig without cmake/ninja. Run by the devkit zig.
// Pipeline (mirrors zig-src/CMakeLists.txt): wasm2c -> zig1.c -> zig1 ->
// (zig1 codegen) zig2.c + compiler_rt.c -> zigcpp -> zig2. Devkit zig compiles
// every C/C++ step; zig1 is only a zig->C codegen tool. A separate `zig2 build`
// (see build-stage3.sh, -Dstatic-llvm) makes stage3, re-deriving its own LLVM
// linking via zig-src/build.zig's own logic instead of a generated config.h --
// zig2 still needs its own zigcpp+LLVM link below since it's a plain C exe
// built outside zig-src/build.zig entirely, so that part can't be shared.
const std = @import("std");

// const libs = @import("libs.zig");
const libs = @import("libs.zig");
const targets = @import("targets.zig");
const config = @import("config.zig");
const wasm2c_mod = @import("wasm2c.zig");
const zig1_mod = @import("zig1.zig");
const zig2_mod = @import("zig2.zig");
const zigcpp_mod = @import("zigcpp.zig");
const env = @import("env.zig");

pub fn build(b: *std.Build) void {
    const exotic = libs.addExoticTargetOpts(b);
    const tgtinfo = targets.getTargetDetails(b);

    // DEVKIT_WIN is the cygpath-converted override set by common.sh on windows
    const devkit = env.getDevkitInfo(b);

    // build config files
    const config_zig = config.genConfigZig(b, exotic);

    // build wasm2c
    const wasm2c = wasm2c_mod.buildWasm2c(b, tgtinfo);

    // convert zig1.wasm to zig1.c using wasm2c
    const zig1_c = zig1_mod.genZig1C(b, wasm2c);

    // compile zig1
    const zig1 = zig1_mod.buildZig1(b, tgtinfo, zig1_c);

    // run zig1 to convert zig2 and compiler_rt Zig codes to C source files
    const zig2_c = zig2_mod.genZig2C(b, zig1, tgtinfo, config_zig);
    const crt_c = zig2_mod.genCrtC(b, zig1, tgtinfo);

    // build zigcpp static lib (LLVM/clang/lld C++ shims)
    const zigcpp = zigcpp_mod.buildZigCpp(b, tgtinfo, devkit);

    _ = zig2_mod.buildZig2(b, tgtinfo, zig2_c, crt_c, zigcpp, devkit, exotic);
}
