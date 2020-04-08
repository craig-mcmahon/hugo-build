# Hugo Build

Simple build image for hugo sites


## Example

```docker
FROM craigmcmahon/hugo-build as HUGOBUILD

COPY . /hugo-site
RUN hugo version \
 && hugo -v --source=/hugo-site --destination=/hugo-site/public

FROM nginx:stable-alpine
RUN rm /usr/share/nginx/html/index.html \
  && sed -i  "s|#error_page  404|error_page  404|" /etc/nginx/conf.d/default.conf
COPY --from=HUGOBUILD /hugo-site/public/ /usr/share/nginx/html/

EXPOSE 80
```