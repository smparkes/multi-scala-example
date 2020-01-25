load(
    "@io_bazel_rules_scala_configuration//:scala_configuration.bzl",
    _scala_configuration = "scala_configuration",
    _scala_version_configuration = "scala_version_configuration",
)
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary", "scala_library", "scala_test")

# This is a little more complicated than usual since it demonstrates
# the default case as well as the enumerated cases. I'd guess that
# enumerated and default cases would generally be mutually exclusive.

def build():
    for version in _scala_configuration()["scala_versions"] + [None]:
        scala_major_version = _scala_version_configuration(version)["scala_major_version"] if version else None

        scala_toolchain = "@io_bazel_rules_scala//scala:scala-%s-scala-toolchain" % scala_major_version if scala_major_version else None
        scalatest_toolchain = "@io_bazel_rules_scala//scala:scala-%s-scala-scalatest-toolchain" % scala_major_version if scala_major_version else None

        suffix = "-" + scala_major_version if scala_major_version else ""

        library_name = "library%s" % suffix
        binary_name = "app%s" % suffix
        test_name = "test%s" % suffix

        scala_library(
            name = library_name,
            srcs = ["App.scala"],
            toolchains = [scala_toolchain] if scala_toolchain else [],
        )

        native.java_binary(
            name = binary_name,
            main_class = "App",
            runtime_deps = [library_name],
        )

        scala_test(
            name = test_name,
            srcs = ["AppTest.scala"],
            toolchains = [scala_toolchain, scalatest_toolchain] if scala_toolchain else [],
        )
