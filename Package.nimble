packageName     = "learn-mustache"
version         = "0.1.0"
author          = "epilif3sotnas <filipesantos1999@hotmail.com>"

description     = "A project to learn mustache logic-less templates"
license         = "Apache-2.0"

srcDir          = "src"
binDir          = "target"
bin             = @["main"]
backend         = "cpp"

requires        "nim >= 1.6",
                "mustache >= 0"