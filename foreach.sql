DELIMITER //
CREATE PROCEDURE foreach()
BEGIN
declare subscriber_number varchar(1000);
declare done TINYINT DEFAULT 0;
declare le_cursor cursor For Select num from le_bar;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
open le_cursor;
REPEAT
fetch le_cursor into subscriber_number;
insert into le_foo(num) values(subscriber_number);
UNTIL done END REPEAT;
close le_cursor;
END //
DELIMITER ;
