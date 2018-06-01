---
title: -Xlint:unchecked and -Werror for Java projects with Gradle
layout: post
category: Software/Tech
---

I was recently working in a codebase where there were chunks of Java code that
used generic interfaces from the Apache Commons Collections project as well as
`java.util` Collections in a type unsafe way, even though the
interfaces/classes that were being used supported generics.

Our gradle build was emitting the following warning:

    :compileJavaNote: Some input files use unchecked or unsafe operations.
    Note: Recompile with -Xlint:unchecked for details.

This warning should be an error in my books. It's possible to get this
behaviour by adding the following to your `build.gradle` file:

```groovy
tasks.withType(JavaCompile) {
  options.compilerArgs << "-Xlint:unchecked" << "-Werror"
}
```

This way, when our code is built everyone is aware when they're using unsafe
operations, and can either fix the issue or supress the warning with
`@SupressWarnings("unchecked")` if it's intentional.
