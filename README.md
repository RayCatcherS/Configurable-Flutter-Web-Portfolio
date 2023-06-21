# Stefano-Romanelli-Flutter-Web-Portfolio
Web portfolio

# Build alert
Use this command to build:
```
flutter build web --web-renderer html --release
```

# Host server alert
You need to enable Cross Origins by adding the code in your web hosting's .htaccess file
```
<FilesMatch "\.(json|png|jpg|gif)$">
    <IfModule mod_headers.c>
        Header set Access-Control-Allow-Origin "*"
    </IfModule>
</FilesMatch>
```
