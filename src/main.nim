# internal
import
  ./view/views

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
    pattern("/greeter/@name", greeter, HttpGet),
    pattern("/generate-code/@language", generateCode, HttpGet),
    pattern("/index", index, HttpGet),
    pattern("/inventory", inventory, HttpGet)
  ])

when isMainModule:
  main()