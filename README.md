# Getting Started With Docker, Scala & Sbt

## Scala Application

There are three files in this example application:

* **build.sbt** defines the build related information. We defined the name of the project, version number, and scala version here.

  ```
  name := "HelloWorld"
  version := "1.0"
  scalaVersion := "2.12.2"
  ```

* **project/build.properties** defines the sbt version. 

  > There are two sbt versions. One is for building the project itself, which is what is defined in the **build.properties** file here. There is a second sbt version that we'll cover later, which is the `sbt` installed on the machine. We sometimes refer that as `sbt-launcher` and it is used to  download and run a particular sbt version for building the project.

  ```
  sbt.version = 0.13.15
  ```

* **src/main/scala/HelloWorld.scala** is our main application which simply print "Hello Word" on the console.

  ```
  object HelloWorld {
    def main(args: Array[String]): Unit = {
      println("Hello, world!")
    }
  }
  ```

## Sbt

To run this application, make sure you have `sbt` (a.k.a. `sbt-launcher`) install on your machine. To begin with, let's check the `sbt` version: 

```
sbt sbtVersion

...
[info] 0.13.15
```

One launcher can launch many versions of sbt, and is generally backwards compatible. Therefore, this version number doesn't necessarily have to match the version number defined in **project/build.properties**. But, in general, we would like to keep this `sbt` up to date.

If you don't have `sbt` installed on your machine, check the download page on [scala-sbt.org](http://www.scala-sbt.org/download.html). For example, on MacOS, you can install it via `brew install sbt`.

After installing `sbt`, we can run the application simply by `sbt run`. The command will take care of compiling the source code and launching the application. 

```
sbt run

...
[info] Running HelloWorld 
Hello, world!
[success] Total time: 0 s, completed 01-Jun-2017 01:02:03 AM
```

## Docker image and container

Build and push the image:

```sh
docker build . -t goyalmunish/hello-docker-scala-sbt:latest
docker push goyalmunish/hello-docker-scala-sbt:latest
```

Finally, run the app in the container:

```
docker run -it --name hello-docker-scala-sbt goyalmunish/hello-docker-scala-sbt:latest

[info] Loading project definition from /HelloWorld/project
...
[info]   Compilation completed in 9.433 s
[info] Running HelloWorld 
Hello, world!
```
