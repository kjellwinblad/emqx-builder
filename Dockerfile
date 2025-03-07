ARG BUILD_FROM=ubuntu:20.04
FROM ${BUILD_FROM}

ARG OTP_VERSION

COPY get-otp.sh /get-otp.sh
RUN /get-otp.sh ${OTP_VERSION}

ARG ELIXIR_VERSION

COPY get-elixir.sh /get-elixir.sh
RUN /get-elixir.sh ${ELIXIR_VERSION}
