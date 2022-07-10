docker run --rm -it `
    -v $env:USERPROFILE/.config/rclone:/config:ro `
    -v blog-paesa-es_data:/var/lib/ghost/content:ro `
    rclone/rclone:1.59 `
    --config /config/rclone.conf `
    sync /var/lib/ghost/content gdrive:/blog-paesa-es `
    --progress