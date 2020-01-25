load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# bazel-skylib 0.8.0 released 2019.03.20 (https://github.com/bazelbuild/bazel-skylib/releases/tag/0.8.0)
skylib_version = "0.8.0"

http_archive(
    name = "bazel_skylib",
    sha256 = "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e",
    type = "tar.gz",
    url = "https://github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib.{}.tar.gz".format(skylib_version, skylib_version),
)

rules_scala_version = "054f75d4ba01cea6b771827a893da41c925e0022"

rules_scala_sha = "39b33fe6c2bd7e9c7af8e568bf8767371447082a4dc903b4bffd416db63e8914"

# http_archive(
#     name = "io_bazel_rules_scala",
#     sha256 = rules_scala_sha,
#     strip_prefix = "rules_scala-%s" % rules_scala_version,
#     type = "zip",
#     url = "https://github.com/bazelbuild/rules_scala/archive/%s.zip" % rules_scala_version,
# )

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
    "scalatest": "3.1.0",
    "scala-xml": "1.2.0",
    "scala-parser-combinators": "1.1.2",
    "maven_install_json_prefix": "//:maven_install/scala_",
})

load(
    "@io_bazel_rules_scala//scala:scala_repositories.bzl",
    "scala_repositories",
)
scala_repositories()

# load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_toolchains")
# scala_toolchains()

protobuf_version = "09745575a923640154bcf307fba8aedff47f240a"

protobuf_version_sha256 = "416212e14481cff8fd4849b1c1c1200a7f34808a54377e22d7447efdf54ad758"

http_archive(
    name = "com_google_protobuf",
    sha256 = protobuf_version_sha256,
    strip_prefix = "protobuf-%s" % protobuf_version,
    url = "https://github.com/protocolbuffers/protobuf/archive/%s.tar.gz" % protobuf_version,
)
