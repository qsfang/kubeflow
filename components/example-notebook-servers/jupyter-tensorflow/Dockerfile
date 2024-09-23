#
# NOTE: Use the Makefiles to build this image correctly.
#

ARG BASE_IMG=<jupyter>
FROM $BASE_IMG

# args - software versions
ARG TENSORFLOW_VERSION=2.15.1

# install - h5py
# TODO: remove when upstream ARM wheels for `h5py` are available again:
#       https://github.com/h5py/h5py/issues/2408
RUN pip install --quiet --no-cache-dir --index-url https://pypi.org/simple \
    h5py==3.11.0 

# install - tensorflow
RUN python3 -m pip install --quiet --no-cache-dir \
    tensorflow==${TENSORFLOW_VERSION}

# install - requirements.txt
COPY --chown=${NB_USER}:${NB_GID} requirements.txt /tmp
RUN python3 -m pip install -r /tmp/requirements.txt --quiet --no-cache-dir \
 && rm -f /tmp/requirements.txt