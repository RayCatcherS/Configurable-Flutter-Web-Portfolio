# App 
http://stefanoromanelli.it

# Flutter-Web-Portfolio
For the necessity to publish my projects on a personal portfolio, I have created a web app (Flutter Web) with a custom layout that is easy to update. The web app has been designed to be configured from the JSON configuration file mediaAssetsConfig.json, which contains the structure and the contents (media) of the web app. The configuration file mediaAssetsConfig.json allows for quick insertion of content into the portfolio (layout, text, media). The project can be freely used, regards!”

## mediaAssetsConfig.json
Follow the example of the assets/mediaAssetsConfig.json file to add content to your portfolio.


# Build alert
Use this command to build:
```
flutter build web --web-renderer html --release
```

# Host server alert
If you decide to upload the assets of the web app to a folder on your domain, You need to enable Cross Origins by adding the code in your web hosting's .htaccess file to allow the web app to make HTTP calls on it.
```
<FilesMatch "\.(json|png|jpg|gif)$">
    <IfModule mod_headers.c>
        Header set Access-Control-Allow-Origin "*"
    </IfModule>
</FilesMatch>
```
