\connect remap2020;
drop table anno;
create table anno(id varchar,
                  tf char(20),
		  celltype char(40),
		  treatment varchar,
		  experiment char(40),
		  url varchar
                  );
grant all on table anno to trena;
