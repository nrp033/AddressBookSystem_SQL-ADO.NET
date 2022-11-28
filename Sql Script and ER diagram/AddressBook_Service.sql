
--UC1 - Create AddressBook_Service Database.

create database AddressBook_Service;


 use AddressBook_Service

--UC2 - Create AddressBook Table

create table AddressBook_Table(
Contact_ID int identity,
FirstName varchar(50),
LastName varchar(50),
MobNumber bigint,
Email varchar(100),
Address varchar(50),
City varchar(30),
State varchar (30),
Zip bigint);

select * from AddressBook_Table;

--UC3 - Insert new contacts into Addressbook

insert into AddressBook_Table(FirstName, LastName, MobNumber, Email,Address,City, State, Zip)
values
('Shubham', 'Jadhav', 8179713160, 'sjadhav@gmail.com','Anand Nagar', 'Latur', 'Maharashtra', 413678),
('Anand', 'Sarode', 8149703160, 'anand.s@gmail.com','Bandra West', 'mumbai', 'andhra', 748949),
('Sachin', 'Pawar', 9149713160, 's.pawar@gmail.com','Baner Phata', 'Udagir', 'rajshthan', 413562),
('Jaya', 'Shete', 9740049061, 'Jaya.s@gmail.com','Gandhi Road', 'bangalore', 'chennai', 587315),
('Nitin','Pawar',9421506122,'nitin@gmail.com','pawar galli','Latur','Maharashtra',413520),
('Sachin','Shinde',7787987998,'sShinde@gmail.com','prakash nagar', 'Udgir','Maharashtra',465443);



-- for Displaying adressbook

select * from AddressBook_Table;



--UC4 - Edit existing contact person using name

update AddressBook_Table set City = 'Satara' where FirstName = 'Shubham' and LastName = 'Jadhav';

update AddressBook_Table set State = 'Maharashtra' where FirstName = 'Anand';
update AddressBook_Table set City='Udgir' where Contact_ID=3
select * from AddressBook_Table;



--UC5 - Delete existing contact person using name.

delete from AddressBook_Table where FirstName = 'Jaya' and LastName = 'Shete';

select * from AddressBook_Table;



--UC6 - Retrieve person belonging to a city or state from AddressBook.

select * from AddressBook_Table where City = 'Latur' or State = 'Maharashtra';



--UC7 - Size of AddressBook by city and state 

select COUNT(*) as StateWise_Count, State from AddressBook_Table group by State;

select COUNT(*) as CityeWise_Count, City from AddressBook_Table group by City;


--UC8 - Get Sorted entries alphabeticaly by person's name for a given city.

select * from AddressBook_Table where City = 'Satara' order by FirstName,LastName;

--UC9 - Adding Address Book With Name and Type.

alter table AddressBook_Table add AddressBookName varchar(50),AddressBookType varchar(50);

select * from AddressBook_Table;


--update values for created book name and book type column

update AddressBook_Table set AddressBookName = 'Room Partner', AddressBookType = 'Friend' where FirstName = 'Sachin' and LastName='Shinde';

update AddressBook_Table set AddressBookName = 'Room Partner', AddressBookType = 'Friend' where FirstName = 'Shubham';

update AddressBook_Table set AddressBookName = 'IT', AddressBookType = 'Profession' where FirstName = 'Anand';

update AddressBook_Table set AddressBookName = 'Personal', AddressBookType = 'Family' where FirstName = 'Nitin';

update AddressBook_Table set AddressBookName = 'Personal', AddressBookType = 'Family' where FirstName = 'Sachin' and LastName='Pawar';


--UC10 - Get number of contact persons i,e count by type.

select count(AddressBookType) as 'NumberOfContacts' from AddressBook_Table where AddressBookType='Family';

select count(AddressBookType) as 'NumberOfContacts' from AddressBook_Table where AddressBookType='Friend';

select count(AddressBookType) as 'NumberOfContacts' from AddressBook_Table where AddressBookType='Profession';


--UC11-- Add person to friend and family

insert into AddressBook_Table(FirstName, LastName, MobNumber, Email,Address, City, State, Zip, AddressBookName, AddressBookType)
values
('Mahesh', 'Phavade', 9786767676, 'maheshP@gmail.com','Rajguru Nagar', 'Pune', 'Maharashtra', 411039,'Relative', 'Friend'),
('Mahesh', 'Phavade', 9786767676, 'maheshP@gmail.com','Rajguru Nagar', 'Pune', 'Maharashtra', 411039, 'Personal', 'Family'),
('vaishali','Pawar',9421454533, 'vaishali@gmail.com','Near Police Station','Latur','Maharashtra',413520,'Personal' ,'Family');


select * from AddressBook_Table;


--UC12 Identifiy Entities using Normalization Technique


ALTER TABLE AddressBook_Table ADD PRIMARY KEY (Contact_ID);

--creating another table to assign relation with Name and type as given

create table AddressBook_Type(
ContactID int FOREIGN KEY REFERENCES AddressBook_Table(Contact_ID) ,
AddressBookType varchar(50) not null
);
drop table AddressBook_Type

insert into AddressBook_Type values(1,'Friend'),(2,'Profession'),(3,'Family'),(5,'Family'),(6,'Friend'),(7,'Friend'),(8,'Family'),(9,'Family');

select * from AddressBook_Type;

select * from AddressBook_Table;

Create table Contact_City(
AddressID int identity,
F_Name varchar(30) not null,
L_Name varchar(30) not null,
City varchar (30) not null,
Contact_ID int not null foreign key references AddressBook_Table(Contact_ID),
);

 select * from Contact_City;


 
insert into Contact_City
values('Shubham','Jadhav','Satara',1),
('Anand','Sarode','Mumbai',2),
('Sachin','Pawar','Udgir',3),
('Nitin','Pawar','Latur',5),
('Sachin','Shinde','Udgir',6),
('Mahesh','Phavade','Pune',7),
('Vaishali','Pawar','Latur',9);

Select * from Contact_City
select * from AddressBook_Table


  select * from AddBookTypes;        --Complete with assigning attributes and relationship

 --UC13 Ensuring all Retrieve Querys Done on

 --UC6 Checking

select * from AddressBook_Table where City='Latur' or State='Maharashtra';

select FirstName from AddressBook_Table where City='mumbai' ;

select * from AddressBook_Table where City='Udgir' ;

select * from Contact_City where City='pune'

select * from AddressBook_Type where AddressBookType='Profession'

--UC7 Checking

select count(City) as CityCount from Contact_City;


--UC8 Checking

select * from AddressBook_Table order by City asc;
select * from AddressBook_Table order by City desc;

select FirstName,LastName,Address,State from AddressBook_Table order by City asc;

select FirstName,LastName,Address,State from AddressBook_Table order by City desc;
