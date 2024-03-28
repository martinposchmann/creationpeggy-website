FROM jekyll/jekyll AS builder

WORKDIR /build
COPY . ./
RUN mkdir -p /build/.jekyll-cache \
    && mkdir /build/_site \
    && chown jekyll:jekyll /build/_site \
    && jekyll build

FROM nginx:stable-alpine
COPY --from=builder /build/_site/ /usr/share/nginx/html

# run:
# docker run -p 8080:80 creationpeggy