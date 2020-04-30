#!/usr/bin/env bash

pub get
dart --snapshot-kind=kernel --snapshot=bin/main.dart.snapshot bin/main.dart
dart bin/main.dart.snapshot