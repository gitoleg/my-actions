FROM binaryanalysisplatform/bap:latest

WORKDIR /home/opam
COPY update.sh /home/opam/update.sh
COPY build.sh /home/opam/build.sh

RUN sudo apt-get install emacs-nox man2html --yes \
  && eval $(opam env) && opam install odig --yes \
  && ./build.sh

ENTRYPOINT ["sh", "/home/opam/update.sh"]