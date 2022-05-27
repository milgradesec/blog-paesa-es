# Generate static site
gssg --url https://blog.paesa.es --dest static

# Add custom headers
Copy-Item -Path "_headers" -Destination "static/_headers"

# Fetch missing assets
Invoke-WebRequest -Uri "http://localhost:2368/assets/built/casper.js" -OutFile static/assets/built/casper.js
Invoke-WebRequest -Uri "http://localhost:2368/assets/built/screen.css" -OutFile static/assets/built/screen.css
Invoke-WebRequest -Uri "http://localhost:2368/public/cards.min.js" -OutFile static/public/cards.min.js
Invoke-WebRequest -Uri "http://localhost:2368/public/cards.min.css" -OutFile static/public/cards.min.css

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