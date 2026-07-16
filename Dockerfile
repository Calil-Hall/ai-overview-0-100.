FROM caddy:2-alpine
COPY public/ /srv
CMD ["sh", "-c", "caddy file-server --root /srv --listen :${PORT:-8080}"]
