load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "bazel_skylib",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
    ],
    sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
)
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

# use git submodule since the example is tightly tied to the fork sha

local_repository(
    name = "io_bazel_rules_scala",
    path = "rules_scala",
)

load("@io_bazel_rules_scala//scala:rules_jvm_external.bzl", "rules_jvm_external")

rules_jvm_external()

load("@io_bazel_rules_scala//scala:scala_configuration.bzl", "scala_configuration")

scala_configuration({
    "scala": {
        "2.11.12": {},
        "2.12.10": {},
        "2.13.1": {},
    },
    "default": "2.13",
})

load(
    "@io_bazel_rules_scala//scala:scala_repositories.bzl",
    "scala_repositories",
)

scala_repositories()
