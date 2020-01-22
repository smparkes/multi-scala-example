load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# bazel-skylib 0.8.0 released 2019.03.20 (https://github.com/bazelbuild/bazel-skylib/releases/tag/0.8.0)
skylib_version = "0.8.0"
http_archive(
  name = "bazel_skylib",
  type = "tar.gz",
  url = "https://github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib.{}.tar.gz".format (skylib_version, skylib_version),
  sha256 = "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

label = "2fcb2cb3a6eebe87df5b2027b8c1cc97bdb02151"
strip_prefix = "bazel_scala-" + label

local_repository(
  name = "io_bazel_rules_scala",
  path = "rules_scala",
)

register_toolchains("@io_bazel_rules_scala//scala:scala-2.12-toolchain")
register_toolchains("@io_bazel_rules_scala//scala:unused_dependency_checker_error_toolchain")

# load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
# scala_register_toolchains()

# load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
# scala_repositories()

protobuf_version="09745575a923640154bcf307fba8aedff47f240a"
protobuf_version_sha256="416212e14481cff8fd4849b1c1c1200a7f34808a54377e22d7447efdf54ad758"

http_archive(
  name = "com_google_protobuf",
  url = "https://github.com/protocolbuffers/protobuf/archive/%s.tar.gz" % protobuf_version,
  strip_prefix = "protobuf-%s" % protobuf_version,
  sha256 = protobuf_version_sha256,
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_JVM_EXTERNAL_TAG = "3.0"
RULES_JVM_EXTERNAL_SHA = "62133c125bf4109dfd9d2af64830208356ce4ef8b165a6ef15bbff7460b35c3a"

http_archive(
  name = "rules_jvm_external",
  strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
  sha256 = RULES_JVM_EXTERNAL_SHA,
  url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
  name = "scala_2_11",
  artifacts = [
    "org.scala-lang:scala-compiler:2.11.12",
    "org.scala-lang:scala-library:2.11.12",
    "org.scala-lang:scala-reflect:2.11.12",
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
    "org.scala-lang:scala-compiler:2.11.12",
    "org.scala-lang:scala-library:2.11.12",
    "org.scala-lang:scala-reflect:2.11.12",
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
