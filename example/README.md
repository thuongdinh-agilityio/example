example
==============================

A short description of the project.

LICENSE: BSD

Settings
--------

example relies extensively on environment
settings which **will not work with Apache/modwsgi setups**. It has
been deployed successfully with both Gunicorn/Nginx and even
uWSGI/Nginx.

For configuration purposes, the following table maps the
‘example’ environment variables to their Django
setting:

|Environment Variable                    |Django Setting               |Development Default                             |Production Default
|--------------------------------------- | --------------------------- | ---------------------------------------------- | -------------------------------------------
|DJANGO_AWS_ACCESS_KEY_ID                | AWS_ACCESS_KEY_ID           | n/a                                            | raises error
|DJANGO_AWS_SECRET_ACCESS_KEY            | AWS_SECRET_ACCESS_KEY       | n/a                                            | raises error
|DJANGO_AWS_STORAGE_BUCKET_NAME          | AWS_STORAGE_BUCKET_NAME     | n/a                                            | raises error
|DJANGO_CACHES                           | CACHES                      | locmem                                         | memcached
|DJANGO_DATABASES                        | DATABASES                   | See code                                       | See code
|DJANGO_DEBUG                            | DEBUG                       | True                                           | False
|DJANGO_EMAIL_BACKEND                    | EMAIL_BACKEND               | django.core.mail.backends.console.EmailBackend | django.core.mail.backends.smtp.EmailBackend
|DJANGO_SECRET_KEY                       | SECRET_KEY                  | CHANGEME!!!                                    | raises error
|DJANGO_SECURE_BROWSER_XSS_FILTER        | SECURE_BROWSER_XSS_FILTER   | n/a                                            | True
|DJANGO_SECURE_SSL_REDIRECT              | SECURE_SSL_REDIRECT         | n/a                                            | True
|DJANGO_SECURE_CONTENT_TYPE_NOSNIFF      | SECURE_CONTENT_TYPE_NOSNIFF | n/a                                            | True
|DJANGO_SECURE_FRAME_DENY                | SECURE_FRAME_DENY           | n/a                                            | True
|DJANGO_SECURE_HSTS_INCLUDE_SUBDOMAINS   | HSTS_INCLUDE_SUBDOMAINS     | n/a                                            | True
|DJANGO_SESSION_COOKIE_HTTPONLY          | SESSION_COOKIE_HTTPONLY     | n/a                                            | True
|DJANGO_SESSION_COOKIE_SECURE            | SESSION_COOKIE_SECURE       | n/a                                            | False

-   TODO: Add vendor-added setting