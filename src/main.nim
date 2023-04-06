# internal
import
  ./view/views

# external
import
  prologue


proc main() =
  let settings = newSettings(
    appName = "learn-mustache",
    debug = true,
    port = Port(8080)
  )
  let app = newApp(settings=settings)
  app.addRoute("/", default)
  app.addRoute([
    pattern("/greeter/{name}", greeter, HttpGet),
    pattern("/generate-code/{language}", generateCode, HttpPost),
    pattern("/index", index, HttpGet),
    pattern("/inventory", inventory, HttpGet)
  ])
  app.run()

when isMainModule:
  main()