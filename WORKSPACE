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

load("@io_bazel_rules_scala//scala:versions.bzl", "scala_versions")

scala_versions({
    "2.11.12": {},
    "2.12.10": {},
    "2.13.1": {},
})

default_version = ["2.12"]

[register_toolchains("@io_bazel_rules_scala//scala:scala-%s-toolchain" % version) for version in default_version]
[register_toolchains("@io_bazel_rules_scala//scala:scala-%s-bootstrap-toolchain" % version) for version in default_version]
[register_toolchains("@io_bazel_rules_scala//scala:scala-%s-scalatest-toolchain" % version) for version in default_version]

protobuf_version = "09745575a923640154bcf307fba8aedff47f240a"

protobuf_version_sha256 = "416212e14481cff8fd4849b1c1c1200a7f34808a54377e22d7447efdf54ad758"

http_archive(
    name = "com_google_protobuf",
    sha256 = protobuf_version_sha256,
    strip_prefix = "protobuf-%s" % protobuf_version,
    url = "https://github.com/protocolbuffers/protobuf/archive/%s.tar.gz" % protobuf_version,
)

RULES_JVM_EXTERNAL_TAG = "3.0"

RULES_JVM_EXTERNAL_SHA = "62133c125bf4109dfd9d2af64830208356ce4ef8b165a6ef15bbff7460b35c3a"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    name = "scala_2_11",
    artifacts = [
        "org.scala-lang:scala-compiler:2.11.12",
        "org.scala-lang:scala-library:2.11.12",
        "org.scala-lang:scala-reflect:2.11.12",
        "org.scalatest:scalatest_2.11:3.1.0",
        "org.scalactic:scalactic_2.11:3.1.0",
        "org.scala-lang.modules:scala-xml_2.11:1.2.0",
        "org.scala-lang.modules:scala-parser-combinators_2.11:1.1.2",
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

maven_install(
    name = "scala_2_12",
    artifacts = [
        "org.scala-lang:scala-compiler:2.12.10",
        "org.scala-lang:scala-library:2.12.10",
        "org.scala-lang:scala-reflect:2.12.10",
        "org.scalatest:scalatest_2.12:3.1.0",
        "org.scalactic:scalactic_2.12:3.1.0",
        "org.scala-lang.modules:scala-xml_2.12:1.2.0",
        "org.scala-lang.modules:scala-parser-combinators_2.12:1.1.2",
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

maven_install(
    name = "scalac",
    artifacts = [
        "commons-io:commons-io:2.6",
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

maven_install(
    name = "worker",
    artifacts = [
        "com.google.protobuf:protobuf-java:3.11.1",
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

maven_install(
    name = "exe",
    artifacts = [
        "com.google.guava:guava:27.1-jre",
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)
