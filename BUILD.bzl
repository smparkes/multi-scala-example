load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary", "scala_library", "scala_test")

def build():
    for version in ["2.11", "2.12", None]:

        scala_toolchain = "@io_bazel_rules_scala//scala:scala-%s-scala-toolchain" % version if version else None
        scalatest_toolchain = "@io_bazel_rules_scala//scala:scala-%s-scala-scalatest-toolchain" % version if version else None

        suffix = "-" + version if version else ""

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
