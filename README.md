# multi-scala-example

Simple example of using multi-scala builds based on https://github.com/smparkes/rules_scala

To run the examples:
1. clone the repo: `git clone https://github.com/smparkes/multi-scala-example.git`
1. update the `rules_scala` fork: `git submodule update --init --recursive`
1. build the example and run the example tests: `bazel build :all && bazel test :all`
