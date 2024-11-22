FROM nginx:latest
EXPOSE 3000
WORKDIR /app
USER root

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh ./

RUN apt-get update && apt-get install -y wget unzip iproute2 systemctl &&\
    wget -O temp.zip $(wget -qO- "https://api.github.com/repos/v2fly/v2ray-core/releases/latest" | grep -m1 -o "https.*linux-64.*zip") &&\
    unzip temp.zip v2ray geoip.dat geosite.dat &&\
    mv v2ray v &&\
    rm -f temp.zip &&\
    chmod -v 755 v entrypoint.sh &&\
    echo 'ewoJImxvZyI6IHsKCQkiYWNjZXNzIjogIi9kZXYvbnVsbCIsCgkJImVycm9yIjogIi9kZXYvbnVsbCIsCgkJImxvZ2xldmVsIjogIndhcm5pbmciCgl9LAoJImluYm91bmRzIjogWwoJCXsKCQkJInBvcnQiOiAxMDAwMCwKCQkJImxpc3RlbiI6ICIxMjcuMC4wLjEiLAoJCQkicHJvdG9jb2wiOiAidm1lc3MiLAoJCQkic2V0dGluZ3MiOiB7CgkJCQkiY2xpZW50cyI6IFsKCQkJCQl7CgkJCQkJCSJpZCI6ICJVVUlEIiwKCQkJCQkJImFsdGVySWQiOiAwCgkJCQkJfQoJCQkJXQoJCQl9LAoJCQkic3RyZWFtU2V0dGluZ3MiOiB7CgkJCQkibmV0d29yayI6ICJ3cyIsCgkJCQkid3NTZXR0aW5ncyI6IHsKCQkJCQkicGF0aCI6ICJWTUVTU19XU1BBVEgiCgkJCQl9CgkJCX0sCgkJCSJzbmlmZmluZyI6IHsKICAgICAgICAgICAgICAgICAgICAgICAgICAiZW5hYmxlZCI6IHRydWUsIAogICAgICAgICAgICAgICAgICAgICAgICAgICJkZXN0T3ZlcnJpZGUiOiBbImh0dHAiLCAidGxzIl0KICAgICAgICAgICAgICAgICB9CgkJfSwKCQl7CgkJCSJwb3J0IjogMjAwMDAsCgkJCSJsaXN0ZW4iOiAiMTI3LjAuMC4xIiwKCQkJInByb3RvY29sIjogInZsZXNzIiwKCQkJInNldHRpbmdzIjogewoJCQkJImNsaWVudHMiOiBbCgkJCQkJewoJCQkJCQkiaWQiOiAiVVVJRCIKCQkJCQl9CgkJCQldLAoJCQkJImRlY3J5cHRpb24iOiAibm9uZSIKCQkJfSwKCQkJInN0cmVhbVNldHRpbmdzIjogewoJCQkJIm5ldHdvcmsiOiAid3MiLAoJCQkJIndzU2V0dGluZ3MiOiB7CgkJCQkJInBhdGgiOiAiVkxFU1NfV1NQQVRIIgoJCQkJfQoJCQl9LAoJCQkic25pZmZpbmciOiB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgImVuYWJsZWQiOiB0cnVlLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAiZGVzdE92ZXJyaWRlIjogWyJodHRwIiwgInRscyJdCiAgICAgICAgICAgICAgICAgfQoJCX0KCV0sCgkib3V0Ym91bmRzIjogWwoJCXsKCQkJInByb3RvY29sIjogImZyZWVkb20iLAoJCQkic2V0dGluZ3MiOiB7ImRvbWFpblN0cmF0ZWd5IjogIlVzZUlQIn0KCQl9CgldLAoJImRucyI6IHsKICAgICAgICAgICAgInNlcnZlcnMiOiBbCiAgICAgICAgICAgICI4LjguOC44IiwKICAgICAgICAgICAgIjguOC40LjQiLAoJICAgIHsKICAgICAgICAiYWRkcmVzcyI6ICJQUk9YWV9JUCIsCiAgICAgICAgInBvcnQiOiA1MywKICAgICAgICAiZG9tYWlucyI6IFsiZ2Vvc2l0ZTpuZXRmbGl4IiwgImdlb3NpdGU6ZGlzbmV5IiwgImdlb3NpdGU6Z29vZ2xlIiwgImdlb3NpdGU6eW91dHViZSJdCiAgICAgIH0KICAgIF0KICB9Cn0=' > config

ENTRYPOINT [ "./entrypoint.sh" ]
