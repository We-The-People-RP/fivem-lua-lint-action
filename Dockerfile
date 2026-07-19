FROM ghcr.io/we-the-people-rp/luacheck:latest

RUN mkdir -p /luacheck-fivem
ADD . /luacheck-fivem/
RUN apk add --no-cache yarn nodejs && \
    cd /luacheck-fivem/ && \
    yarn --prod --frozen-lockfile && yarn build && \
    chmod +x /luacheck-fivem/.docker/entrypoint.sh 
ENTRYPOINT ["/luacheck-fivem/.docker/entrypoint.sh"]
