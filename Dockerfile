FROM kwoth/nadeko:latest

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID jenkins
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID jenkins
USER jenkins
