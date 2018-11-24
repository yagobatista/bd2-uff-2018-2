# Q2
USE Chinook;
DROP PROCEDURE IF EXISTS dropIndex;

delimiter //
create procedure dropIndex(IN param_table_name varchar(255))
begin
    declare done int default FALSE;
    declare dropCommand varchar(255);
    declare dropCur cursor for 
        SELECT CONCAT('DROP INDEX ', index_name, ' ON ', table_schema, '.', table_name, ';') 
        FROM information_schema.statistics
        WHERE  index_name <> 'PRIMARY' 
            AND table_name = param_table_name AND table_schema = 'Chinook';

    declare continue handler for not found set done = true;

    open dropCur;

    read_loop: loop
        fetch dropCur into dropCommand;
        IF done then
            leave read_loop;
        end IF;

        set @sdropCommand = dropCommand;

        prepare dropClientUpdateKeyStmt FROM @sdropCommand;

        execute dropClientUpdateKeyStmt;

        deallocate prepare dropClientUpdateKeyStmt;
    end loop;

    close dropCur;
end//
delimiter ;

-- TESTE DO PROCEDURE
SELECT DISTINCT TABLE_NAME, INDEX_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'Chinook' AND TABLE_NAME = 'Artist';
CALL dropIndex('Artist');
SELECT DISTINCT TABLE_NAME, INDEX_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = 'Chinook' AND TABLE_NAME = 'Artist';
