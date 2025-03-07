# Variables
duckdb_bin := ./data/duckdb
duckdb_data := ./data/tcph_sf1.duckdb

init:
	if [ -f "${duckdb_data}" ]; then echo ${duckdb_data}; fi
	${duckdb_bin} ${duckdb_data} --init 'sql/init.sql' -c ""

clean:
	rm ${duckdb_data}