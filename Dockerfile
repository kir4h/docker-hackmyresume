# Base image containing patched binaries
FROM aantonw/alpine-wkhtmltopdf-patched-qt:0.12.5-alpine3.9 as wkhtmltopdf-patched-qt

FROM alpine:3.9
LABEL maintainer="Andres Alvarez"
### install unpatched wkhtmltopdf
RUN apk add --update --no-cache wkhtmltopdf=0.12.5-r0 npm ttf-freefont fontconfig

# Replace with patched binaries
COPY --from=wkhtmltopdf-patched-qt /bin/wkhtmltopdf /usr/bin/wkhtmltopdf
COPY --from=wkhtmltopdf-patched-qt /bin/wkhtmltoimage /usr/bin/wkhtmltoimage

# Add hackmyresume
RUN npm install -g hackmyresume@1.9.0-beta