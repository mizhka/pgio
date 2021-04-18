FROM postgres:11.2

COPY pgio_reduce_free_memory.sh /var/lib/postgresql
COPY runit.sh /var/lib/postgresql
COPY setup.sh /var/lib/postgresql
COPY .pgpass /var/lib/postgresql

WORKDIR /var/lib/postgresql

RUN chmod +x *.sh && chown postgres:postgres /var/lib/postgresql/.pgpass && chmod 600 /var/lib/postgresql/.pgpass && mkdir /var/lib/postgresql/sql

COPY pgio_audit_table.sql /var/lib/postgresql/sql
COPY pgio.sql /var/lib/postgresql/sql
COPY pgio_get_rand.sql /var/lib/postgresql/sql
COPY pgio_table_sizes.sql /var/lib/postgresql/sql

USER postgres

COPY pgio.conf /var/lib/postgresql