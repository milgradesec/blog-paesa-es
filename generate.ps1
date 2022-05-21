# Generate static site
gssg --url https://blog.paesa.es --dest static

# Fetch missing assets
Invoke-WebRequest -Uri "http://localhost:2368/assets/built/casper.js" -OutFile static/assets/built/casper.js
Invoke-WebRequest -Uri "http://localhost:2368/assets/built/screen.css" -OutFile static/assets/built/screen.css
Invoke-WebRequest -Uri "http://localhost:2368/public/cards.min.js" -OutFile static/public/cards.min.js
Invoke-WebRequest -Uri "http://localhost:2368/public/cards.min.css" -OutFile static/public/cards.min.css

# Add custom headers
Copy-Item -Path "_headers" -Destination "static/_headers"