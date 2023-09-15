#author: https://github.com/kevinschaich
#source: https://github.com/metabase/metabase/issues/13119#issuecomment-1463753101

FROM eclipse-temurin:11

COPY --from=metabase/metabase:latest /app /app

RUN useradd -ms /bin/sh metabase && chown -R metabase /app
WORKDIR /app
USER metabase
ENV MB_DB_FILE=${MB_DB_FILE}
ENTRYPOINT ["/app/run_metabase.sh"]