FROM jekyll/jekyll:minimal@sha256:8bac87ae717c04e2440ccac450cceb504894970b01a10e99a41529dc20476106 AS builder

WORKDIR /build
COPY src /build/src
RUN mkdir -p /build/src/.jekyll-cache \
    && chown jekyll:jekyll /build/src/.jekyll-cache \
    && cd /build/src \
    && mkdir -p /build/_site \
    && chown jekyll:jekyll /build/_site \
    && RUBYOPT="-W0" jekyll build -s /build/src -d /build/_site

FROM nginx:stable-alpine
COPY --from=builder /build/_site/ /usr/share/nginx/html
