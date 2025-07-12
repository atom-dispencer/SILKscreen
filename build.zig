const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Build a shared library
    const libsilkscreen = b.addSharedLibrary(.{
        .name = "libsilkscreen",
        .root_source_file = b.path("src/libsilkscreen.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(libsilkscreen);

    // Build tests for a shared library
    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/libsilkscreen.zig"),
        .target = target,
        .optimize = optimize,
    });
    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    // Add a 'test' stage (zig build test)
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
}
