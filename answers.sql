1

-----

Balloonicorn's Cupcake shop is getting ready to send a marketing
email announcing a new promotion on Funfetti cupcakes. We need to get all of
our customers' email addresses to Marketing.
 
Select all of the email addresses from the Customers table in alphabetical order.

The result set should be:
        email        
---------------------
 aperson@hotmail.com
 bpersonne@yahoo.com
 jdoe@gmail.com



-----


SELECT email FROM customers ORDER BY email;


==========
2

-----

Jane Doe has requested receipts for all of her past cupcake orders.
To look up the receipts, we need to know which orders Jane placed.
 
Write a query that lists the order ids for all orders placed by customers with
the first name Jane and last name Doe. Use a SUBQUERY to do this, not a join.

The result set should be:
 id 
----
  1
  3
  4
  6
  8
(5 rows)


-----


SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE fname = 'Jane' AND lname = 'Doe');


==========
3

-----

Balloonicorn needs to schedule her employees for the next week
based on how many cupcakes have been ordered and not yet processed.
 
Write a query that gets the total number of cupcakes from unprocessed orders.

The result set should be:
 sum 
-----
 209
 (1 row)
 

-----


SELECT SUM(num_cupcakes) FROM orders WHERE processed = 'False';


==========
4

-----

Balloonicorn is working on her inventory and wants to know how many
cupcakes have been ordered of each type.
 
Write a query that shows the name of each cupcake and the sum of cupcakes
ordered for that cupcake type (for both processed and unprocessed orders),
sorted in ascending alphabetical order of cupcake name.

The report should show all cupcake types, even if they have not been ordered
at all.

The result set should be:
    name     | sum 
-------------+-----
 carrot cake |  10
 chocolate   |    
 funfetti    |  13
 raspberry   |  25
 red velvet  | 215
 vanilla     | 202
(6 rows)


-----


SELECT name, SUM(num_cupcakes) AS sum FROM cupcakes FULL OUTER JOIN orders ON cupcakes.id = orders.cupcake_id GROUP BY name ORDER BY name;


==========
5

-----

Marketing now wants to send emails to all of our top customers
thanking them for their business.
 
Write a query that gets the email address of all customers who have ordered
more than 100 cupcakes total (from both processed and unprocessed orders),
in reverse alphabetical order.

The result set should be:
        email        
---------------------
 jdoe@gmail.com
 bpersonne@yahoo.com
(2 rows)


-----


SELECT email FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY email HAVING SUM(num_cupcakes) > 100  ORDER BY email DESC; 


==========
6

-----

Uh oh -- it looks like there might have been an issue with a recent
batch of funfetti cupcakes (someone might have ordered non-edible sparkles
to put in the icing instead of edible ones). We need to let our customers
who have processed orders of funfetti cupcakes know about the issue.
 
Write a query that selects the first name, last name and email address of
customers who have processed orders of funfetti cupcakes. Even if a customer
has multiple outstanding orders of funfetti, their email should only appear once.

The result set should be:
 fname |  lname   |        email        
-------+----------+---------------------
 Bob   | Personne | bpersonne@yahoo.com
(1 row)


-----


SELECT fname, lname, email FROM customers JOIN orders ON customers.id = orders.customer_id WHERE cupcake_id = (SELECT id FROM cupcakes WHERE name = 'funfetti') AND processed = True GROUP BY customers.id;