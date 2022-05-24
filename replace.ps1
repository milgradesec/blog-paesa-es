$files = Get-ChildItem .\static *.html -Recurse
foreach ($file in $files) {
    (Get-Content $file.PSPath) |
    Foreach-Object { $_ -Replace 'cards.min.js(.*)', 'cards.min.js"></script>' } |
    Set-Content $file.PSPath
}

foreach ($file in $files) {
    (Get-Content $file.PSPath) |
    Foreach-Object { $_ -Replace 'cards.min.css(.*)', 'cards.min.css">' } |
    Set-Content $file.PSPath
}

foreach ($file in $files) {
    (Get-Content $file.PSPath) |
    Foreach-Object { $_ -Replace 'screen.css(.*)', 'screen.css" />' } |
    Set-Content $file.PSPath
}

foreach ($file in $files) {
    (Get-Content $file.PSPath) |
    Foreach-Object { $_ -Replace 'casper.js(.*)', 'casper.js"></script>' } |
    Set-Content $file.PSPath
}