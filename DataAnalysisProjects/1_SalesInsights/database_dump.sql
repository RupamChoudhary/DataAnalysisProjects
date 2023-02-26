# what we sold ,what type of products
select * from sales.products group by product_type,product_code; # there is no relationship between product_type or code
select product_type from sales.products group by product_type; 
# whom you selling your products means customer
select * from sales.customers ;
select customer_type from sales.customers group by customer_type;    # first need to know customers purchasing from type online or offline
#Customers purchasing products from where means place
select * from sales.markets;
select markets_name from sales.markets group by markets_name; # query for answer markets where prodcts are selling
# we analyze here markets those are selling products are from out of India, so query to know count of outside India markets
select count(*) from sales.markets ;                
select count(*) from sales.markets; # 17 markets 
# when transactions had placed
select * from sales.date;
# query to know transaction history which includes product,customers,markets,date these all tables
select * from sales.transactions;   # here we noticed sales_amount has negative value(-1) which is wrong or some currency are USD
select count(*) from sales.transactions where currency = 'USD' ;  # 2 RECORDS

# we are doing inner join of transaction or date table to find the year wise sales or revenue
select SALES.TRANSACTIONs.*,sales.date.* from sales.transactions inner join
sales.date on sales.transactions.order_date = sales.date.date;
# when we want to know a particlar year's sale 
select SALES.TRANSACTIONs.*,sales.date.* from sales.transactions inner join
sales.date on sales.transactions.order_date = sales.date.date
where sales.date.year= '2020';
# A query to know total revenue by year
select sum(sales.transactions.sales_amount) as revenue_by_year, sales.date.year As sale_year from sales.transactions inner join
sales.date on sales.transactions.order_date = sales.date.date
group by sales.date.year;
# showing a particular market's revenue by year
select sum(sales.transactions.sales_amount) as revenue_by_year, sales.date.year As sale_year from sales.transactions inner join
sales.date on sales.transactions.order_date = sales.date.date 
where sales.transactions.market_code = 'Mark001' 
group by sales.date.year;

# distint for the purpose of knowing present currency type in dataset
select Distinct (transactions.currency) from sales.transactions;    

# count the type of currency present in data
select count(*) from transactions where transactions.currency ='INR';   # 148393 records present with currency type 'INR'
select count(*) from transactions where transactions.currency ='USD';    # Onnly 2 records of 'USD'
