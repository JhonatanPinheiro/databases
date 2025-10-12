FROM firebirdsql/firebird:5.0.3

COPY init.sh /init.sh
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
CMD ["firebird", "-f"]
