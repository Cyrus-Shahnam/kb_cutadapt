FROM kbase/kbase:sdkbase2.latest
MAINTAINER KBase Developer

# Here we install a python coverage tool
RUN pip install coverage

# NEW LINES for xopen issue within cutadapt installation (current version xopen not backwards compatible)
# NOTE this may need to be updated as well in the future as newer cutadapt versions are used.
RUN pip install xopen==0.3.2

# install cutadapt
RUN pip install cutadapt==1.18

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod 777 /kb/module

WORKDIR /kb/module

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
