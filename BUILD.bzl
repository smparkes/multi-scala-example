load(
    "@io_bazel_rules_scala_configuration//:scala_configuration.bzl",
    _scala_configuration = "scala_configuration",
    _scala_toolchain = "scala_toolchain",
    _scala_version_configuration = "scala_version_configuration",
    _scalatest_toolchain = "scalatest_toolchain",
)
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary", "scala_library", "scala_test")

# generate targets against all configured scala versions

def build():
    for version in _scala_configuration()["scala_versions"]:
        scala_major_version = _scala_version_configuration(version)["scala_major_version"]

        scala_toolchain = _scala_toolchain(scala_major_version)
        scalatest_toolchain = _scalatest_toolchain(scala_major_version)

        library_name = "library-" + scala_major_version
        binary_name = "app-" + scala_major_version
        test_name = "test-" + scala_major_version

        scala_library(
            name = library_name,
            srcs = ["App.scala"],
            toolchains = [scala_toolchain],
        )

        native.java_binary(
            name = binary_name,
            main_class = "App",
            runtime_deps = [library_name],
        )

        scala_test(
            name = test_name,
            srcs = ["AppTest.scala"],
            toolchains = [scala_toolchain, scalatest_toolchain],
        )
