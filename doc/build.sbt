
lazy val docs = project
  .in(file("."))
  .enablePlugins(CloudstateParadoxPlugin)
  .settings(
    deployModule := "dart",
    paradoxProperties in Compile ++= Map(
      "cloudstate.dart.version" -> ">=2.7.0 <3.0.0",
      "cloudstate.dart-support.version" -> { if (isSnapshot.value) previousStableVersion.value.getOrElse("0.0.0") else version.value },
      "extref.cloudstate.base_url" -> "https://cloudstate.io/docs/core/current/%s",
      "snip.base.base_dir" -> s"${(baseDirectory in ThisBuild).value.getAbsolutePath}/../",
    )
  )