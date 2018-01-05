/* Welcome to Learning Structured Query Language!
 *
 * Let's get started with examples. So here is the table:
 *
 * People:
 * +----------+-----------+--------------+----------+
 * | LastName | FirstName | Address      | City     |
 * +==========+===========+==============+==========+
 * | Adams    | John      | Oxford St.   | London   |
 * +----------+-----------+--------------+----------+
 * | Bush     | George    | Fifth Av.    | New York |
 * +----------+-----------+--------------+----------+
 * | Carter   | Thomas    | Changan St.  | Beijing  |
 * +----------+-----------+--------------+----------+
 * | Carter   | William   | Xuanwumen 10 | Beijing  |
 * +----------+-----------+--------------+----------+
 *
 * Let's see what magics can SQL play.
 */

select City from People;

/* Result:
 * +----------+
 * | City     |
 * +==========+
 * | London   |
 * +----------+
 * | New York |
 * +----------+
 * | Beijing  |
 * +----------+
 * | Beijing  |
 * +----------+
 */

select LastName,FirstName from People;

/* Result:
 * +----------+-----------+
 * | LastName | FirstName |
 * +==========+===========+
 * | Adams    | John      |
 * +----------+-----------+
 * | Bush     | George    |
 * +----------+-----------+
 * | Carter   | Thomas    |
 * +----------+-----------+
 * | Carter   | William   |
 * +----------+-----------+
 */

select * from People;

/* Result:
 * +----------+-----------+--------------+----------+
 * | LastName | FirstName | Address      | City     |
 * +==========+===========+==============+==========+
 * | Adams    | John      | Oxford St.   | London   |
 * +----------+-----------+--------------+----------+
 * | Bush     | George    | Fifth Av.    | New York |
 * +----------+-----------+--------------+----------+
 * | Carter   | Thomas    | Changan St.  | Beijing  |
 * +----------+-----------+--------------+----------+
 * | Carter   | William   | Xuanwumen 10 | Beijing  |
 * +----------+-----------+--------------+----------+
 */

select distinct City from People;

/* Result:
 * +----------+
 * | City     |
 * +==========+
 * | London   |
 * +----------+
 * | New York |
 * +----------+
 * | Beijing  |
 * +----------+
 */

select * from People where City='Beijing';

/* Result:
 * +----------+-----------+--------------+----------+
 * | LastName | FirstName | Address      | City     |
 * +==========+===========+==============+==========+
 * | Carter   | Thomas    | Changan St.  | Beijing  |
 * +----------+-----------+--------------+----------+
 * | Carter   | William   | Xuanwumen 10 | Beijing  |
 * +----------+-----------+--------------+----------+
 */

/* Relational Operators:
 *
 * =		euqal
 * <>		inequal
 * <		┐
 * >		│
 * <=		├→ you know
 * >=		│
 * between	┘
 * like		search for pattern
 */

select * from Persons where FirstName='Thomas' and LastName='Carter';


/* Result:
 * +----------+-----------+--------------+----------+
 * | LastName | FirstName | Address      | City     |
 * +==========+===========+==============+==========+
 * | Carter   | Thomas    | Changan St.  | Beijing  |
 * +----------+-----------+--------------+----------+
 */

/* Logical Operators: and, or.
 */

select * from People order by FirstName asc;

/* Result:
 * +----------+-----------+--------------+----------+
 * | LastName | FirstName | Address      | City     |
 * +==========+===========+==============+==========+
 * | Bush     | George    | Fifth Av.    | New York |
 * +----------+-----------+--------------+----------+
 * | Adams    | John      | Oxford St.   | London   |
 * +----------+-----------+--------------+----------+
 * | Carter   | Thomas    | Changan St.  | Beijing  |
 * +----------+-----------+--------------+----------+
 * | Carter   | William   | Xuanwumen 10 | Beijing  |
 * +----------+-----------+--------------+----------+
 */

select * from People order by LastName desc;

/* Result:
 * +----------+-----------+--------------+----------+
 * | LastName | FirstName | Address      | City     |
 * +==========+===========+==============+==========+
 * | Carter   | Thomas    | Changan St.  | Beijing  |
 * +----------+-----------+--------------+----------+
 * | Carter   | William   | Xuanwumen 10 | Beijing  |
 * +----------+-----------+--------------+----------+
 * | Bush     | George    | Fifth Av.    | New York |
 * +----------+-----------+--------------+----------+
 * | Adams    | John      | Oxford St.   | London   |
 * +----------+-----------+--------------+----------+
 */

select * from People order by City,Address;

/* Result:
 * +----------+-----------+--------------+----------+
 * | LastName | FirstName | Address      | City     |
 * +==========+===========+==============+==========+
 * | Carter   | Thomas    | Changan St.  | Beijing  |
 * +----------+-----------+--------------+----------+
 * | Carter   | William   | Xuanwumen 10 | Beijing  |
 * +----------+-----------+--------------+----------+
 * | Adams    | John      | Oxford St.   | London   |
 * +----------+-----------+--------------+----------+
 * | Bush     | George    | Fifth Av.    | New York |
 * +----------+-----------+--------------+----------+
 */