CREATE TABLE cupcakes
  (
     id INT NOT NULL,
     name VARCHAR(255),
     PRIMARY KEY (id)
  );

INSERT INTO cupcakes (id, name) VALUES (1, 'red velvet');
INSERT INTO cupcakes (id, name) VALUES (2, 'chocolate');
INSERT INTO cupcakes (id, name) VALUES (3, 'carrot cake');
INSERT INTO cupcakes (id, name) VALUES (4, 'vanilla');
INSERT INTO cupcakes (id, name) VALUES (5, 'funfetti');
INSERT INTO cupcakes (id, name) VALUES (6, 'raspberry');

CREATE TABLE customers
    (
        id INT NOT NULL,
        fname VARCHAR(255),
        lname VARCHAR(255),
        email VARCHAR(255),
        PRIMARY KEY(id)
    );
    
INSERT INTO customers (id, fname, lname, email) VALUES (1, 'Jane', 'Doe', 'jdoe@gmail.com');
INSERT INTO customers (id, fname, lname, email) VALUES (2, 'Alice', 'Person', 'aperson@hotmail.com');
INSERT INTO customers (id, fname, lname, email) VALUES (3, 'Bob', 'Personne', 'bpersonne@yahoo.com');


CREATE TABLE orders
  (
     id INT NOT NULL,
     customer_id INT NOT NULL,
     cupcake_id INT NOT NULL,
     num_cupcakes INT NOT NULL,
     processed BOOLEAN,
     PRIMARY KEY (id),
     FOREIGN KEY (customer_id) REFERENCES customers(id)
  );

INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (1, 1, 1, 10, TRUE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (2, 2, 4, 2, TRUE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (3, 1, 3, 10, TRUE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (4, 1, 4, 200, TRUE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (5, 3, 5, 5, TRUE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (6, 1, 6, 25, TRUE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (7, 2, 1, 10, FALSE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (8, 1, 1, 20, FALSE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (9, 3, 1, 100, FALSE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (10, 3, 1, 75, FALSE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (11, 2, 5, 4, FALSE);
INSERT INTO orders (id, customer_id, cupcake_id, num_cupcakes, processed) VALUES (12, 3, 5, 4, TRUE);
