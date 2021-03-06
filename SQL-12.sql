--film tablosunda film uzunluğu length sütununda gösterilmektedir. 
--Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(length) FROM film WHERE length > 
(
   SELECT AVG(LENGTH) FROM film
);

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(rental_rate) FROM film
WHERE rental_rate = 
(
    SELECT MAX(rental_rate) FROM film
 );
 
--film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT title, rental_rate FROM film WHERE rental_rate =
(SELECT MIN(rental_rate) FROM film) AND replacement_cost = (SELECT MIN(replacement_cost ) FROM film);

--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT customer.first_name, customer.last_name, payment FROM customer JOIN payment On customer.customer_id = 
ANY (SELECT customer_id FROM payment GROUP BY customer_id ORDER BY COUNT(customer_id) DESC LIMIT 5) LIMIT 5;

