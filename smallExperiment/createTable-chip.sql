\connect remap2020;
drop table chip;
create table chip(chrom varchar,
                  start int,
                  endpos int,
                  name varchar,
                  score float,
                  strand char(1),
                  peakstart int,
                  peakend int,
                  color char(12)
                  );
grant all on table chip to trena;
