proc getTemplate*(name: string): string =
    try:
        return readFile("./src/view/templates/" & name)
    except Exception as ex:
        echo(ex.msg)
        return ""