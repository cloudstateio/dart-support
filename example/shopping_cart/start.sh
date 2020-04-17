#!/bin/bash

cd /home/sleipnir/development/workspace/pessoal/cloudstate-repos/cloudstate-dart-support/example/shopping_cart
dart --snapshot-kind=kernel --snapshot=bin/main.dart.snapshot bin/main.dart
dart bin/main.dart.snapshot