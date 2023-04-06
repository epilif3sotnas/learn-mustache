# std
import
    std/[
        strutils,
        httpcore,
        json
    ]

# internal
import
    ./templates/templates

# external
import
    prologue,
    mustache


proc default*(ctx: prologue.Context) {.async.} =
    resp "Welcome to this learning project."

proc greeter*(ctx: prologue.Context) {.async.} =
    let templateContent = getTemplate("Greeter.mustache")
    if isEmptyOrWhitespace(templateContent):
        resp(
            "No template to show.",
            Http500,
            HttpVersion.HttpVer11
        )
        return
    
    var mustacheVars = newContext()
    mustacheVars["name"] = ctx.getPathParams("name", "World")

    resp(
        mustache.render(templateContent, mustacheVars),
        Http200,
        HttpVersion.HttpVer11
    )

proc generateCode*(ctx: prologue.Context) {.async.} =
    let jsonContent = parseJson(ctx.request.body())
    let programmingLanguage = ctx.getPathParams("language", "").capitalizeAscii()
    let templateContent = getTemplate(programmingLanguage & "-Code.mustache")
    if isEmptyOrWhitespace(templateContent):
        resp(
            "No template to show.",
            Http500,
            HttpVersion.HttpVer11
        )
        return

    try:
        var mustacheVars = newContext()
        mustacheVars["className"] = jsonContent["className"]
        mustacheVars["atributeName1"] = jsonContent["atributeName1"]
        mustacheVars["atributeName2"] = jsonContent["atributeName2"]
        mustacheVars["atributeName3"] = jsonContent["atributeName3"]
        mustacheVars["atributeName4"] = jsonContent["atributeName4"]
        mustacheVars["atributeName1Camel"] = jsonContent["atributeName1"].getStr().capitalizeAscii()
        mustacheVars["atributeName2Camel"] = jsonContent["atributeName2"].getStr().capitalizeAscii()
        mustacheVars["atributeName3Camel"] = jsonContent["atributeName3"].getStr().capitalizeAscii()
        mustacheVars["atributeName4Camel"] = jsonContent["atributeName4"].getStr().capitalizeAscii()

        resp(
            mustache.render(templateContent, mustacheVars),
            Http200,
            HttpVersion.HttpVer11
        )
    
    except Exception as ex:
        echo(ex.msg)
        resp(
            "Error parsing JSON.",
            Http400,
            HttpVersion.HttpVer11
        )

proc index*(ctx: prologue.Context) {.async.} =
    let templateContent = getTemplate("Index.mustache")
    if isEmptyOrWhitespace(templateContent):
        resp(
            "No template to show.",
            Http500,
            HttpVersion.HttpVer11
        )
        return
    
    var mustacheVars = newContext()
    mustacheVars["header"] = "This a Header to Mustache template."
    mustacheVars["text"] = "This a Paragraph to Mustache template."

    resp(
        mustache.render(templateContent, mustacheVars),
        Http200,
        HttpVersion.HttpVer11
    )