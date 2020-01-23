load(
    "@io_bazel_rules_scala//scala:advanced_usage/scala.bzl",
    "make_scala_binary",
    "make_scala_library",
    "make_scala_test",
)

scala_binary = make_scala_binary()

scala_library = make_scala_library({
    "phase_providers": [],
    "attrs": {
        "toolchain": attr.label(
            providers = [],
        ),
    },
})

scala_test = make_scala_test()
