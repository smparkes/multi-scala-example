load("@io_bazel_rules_scala//scala:advanced_usage/scala.bzl",
     "make_scala_binary",
     "make_scala_library",
     "make_scala_test",
     "make_scala_library_for_plugin_bootstrapping",
)

scala_binary = make_scala_binary()

scala_library = make_scala_library({
  "phase_providers": [],
  "attrs": {
    "toolchain": attr.label(
      providers = [],
    )
  },
})

scala_test = make_scala_test()

def _impl(settings, attr):
    _ignore = (settings, attr)
    return [
        {"//example:favorite_flavor" : "LATTE"},
        {"//example:favorite_flavor" : "MOCHA"},
    ]

scala_2_12_transition = transition(
  implementation = _impl,
  inputs = [],
  outputs = ["//example:favorite_flavor"]
)

def _scala_2_12_scala_toolchain_impl():
  pass

scala_2_12_scala_toolchain = rule(
  implementation = _scala_2_12_scala_toolchain_impl,
  attrs = {
    "compiler_path": attr.string(),
    "system_lib": attr.string(),
    "arch_flags": attr.string_list(),
  },
)
