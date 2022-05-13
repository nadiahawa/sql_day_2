create table customer(
customer_id serial primary key,
username varchar(15) not null,
billing_info varchar(150) not null,
email varchar(150) not null
);

create table movies(
movies_id serial primary key,
movie_name varchar(50),
theater_id integer
);


-- The two tables above are the two tables that do not reference foriegn keys. 
-- Contrary to my inaccurate visual layout of this program, the relationsips are as follows:
	-- movies and ticket have a one to one relationship because one ticket can only get you into one movie
	-- consessions and tickets are attacheed via the main-order table since they make up the majority of content there and many can be in the total order 
	-- customers have a one to many relationship with cart since a customer can have many carts
	-- and the cart can have many concessions amd movie tickets within it, therefore  one to many relationship



create table consessions(
consession_id serial primary key, 
foods_id varchar(50),
drinks_id varchar(50),
amount numeric (2,2),
cart_id integer,
foreign key(cart_id) references cart(cart_id)
);



create table ticket(
tix_id serial primary key, 
amount numeric(2,2),
for_date date,
movies_id integer,
foreign key(movies_id) references movies(movies_id)
);



create table cart(
cart_id serial primary key,
tix_id integer,
foreign key(tix_id) references ticket(tix_id),
customer_id integer,
foreign key(customer_id) references customer(customer_id)
);

create table main_order(
order_id serial primary key,
consession_id integer,
foreign key(consession_id) references consessions(consession_id),
tix_id integer,
foreign key(tix_id) references ticket(tix_id)
);



insert into movies(movie_name, theater_id)
values('Fullmetal Jacket', 9);

insert into movies(movie_name, theater_id)
values('John Carpenter: The Thing', 7);

insert into movies(movie_name, theater_id)
values('Heat', 1);

insert into movies(movie_name, theater_id)
values('Hateful Eight', 8);


select * from movies;


--Had a bit of a hard time with the foriegn key insert, will ask about this in the morning
--insert into ticket(amount)
--values(12);
--select * from ticket;



insert into customer(username, billing_info, email)
values('private-pile', 'parris island', 'trashmarines@gmail.com');

insert into customer(username, billing_info, email)
values('the thing', 'antartica', 'trapped@gmail.com');

insert into customer(username, billing_info, email)
values('mccauley', 'chicago', 'acting@gmail.com');

insert into customer(username, billing_info, email)
values('jackson', 'cabin', 'l@gmail.com');

select * from customer;

insert into cart(customer_id)
values(1);
select * from cart;


insert into consessions(foods_id, drinks_id, cart_id)
values('popcorn', 'soda', 1);

insert into consessions(foods_id, drinks_id)
values('nachos', 'slushee');

insert into consessions(foods_id, drinks_id)
values('hot dog', 'beer');

insert into consessions(foods_id, drinks_id)
values('pizza', 'wine');

select * from consessions;



insert main_order()
