# external
import
  prologue


proc main() =
  let settings = newSettings(
    appName = "learn-mustache",
    port = Port(8080)
  )
  let app = newApp(settings=settings)
  app.addRoute([
    pattern("", )
  ], "")

when isMainModule:
  main()