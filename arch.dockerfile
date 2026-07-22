# ╔═════════════════════════════════════════════════════╗
# ║                       SETUP                         ║
# ╚═════════════════════════════════════════════════════╝
# :: FOREIGN IMAGES
  FROM 11notes/util AS util
  FROM 11notes/distroless:dnslookup AS distroless-dnslookup
  FROM 11notes/distroless:curl AS distroless-curl


# ╔═════════════════════════════════════════════════════╗
# ║                       BUILD                         ║
# ╚═════════════════════════════════════════════════════╝
# :: K8S-INIT
  FROM 11notes/alpine:stable AS build
  USER root
  COPY --from=util / /
  COPY ./rootfs/ /

  RUN set -ex; \
    apk --update --no-cache add \
      wget \
      tar \
      xz \
      postgresql18-client;

  RUN set -ex; \
    chmod +x -R /usr/local/bin/.eleven;


# ╔═════════════════════════════════════════════════════╗
# ║                       IMAGE                         ║
# ╚═════════════════════════════════════════════════════╝
# :: HEADER
  FROM scratch

  # :: default arguments
    ARG TARGETPLATFORM \
        TARGETOS \
        TARGETARCH \
        TARGETVARIANT \
        APP_IMAGE \
        APP_NAME \
        APP_VERSION \
        APP_ROOT \
        APP_UID \
        APP_GID \
        APP_NO_CACHE

  # :: default environment
    ENV APP_IMAGE=${APP_IMAGE} \
        APP_NAME=${APP_NAME} \
        APP_VERSION=${APP_VERSION} \
        APP_ROOT=${APP_ROOT}

  # :: multi-stage
    COPY --from=build / /
    COPY --from=distroless-curl / /

# :: EXECUTE
  USER 0:0
  ENTRYPOINT ["/bin/sh", "-c"]