SELECT 	    	A.customer_id,
		A.first_name,
		A.last_name,
		D.country, 
		C.city,
       	  	SUM (amount) AS total_amount_paid
FROM     	customer A
INNER JOIN 	address B ON A.address_id = B.address_id
INNER JOIN 	city C ON B.city_id = C.city_id
INNER JOIN 	country D ON C.country_ID = D.country_ID
INNER JOIN	rental E ON A.customer_id = E.customer_id
INNER JOIN	payment F ON E.rental_id = F.rental_id
WHERE	      	country IN ('India','China','United States','Japan','Mexico','Brazil','Russian Federation','Philippines','Turkey','Indonesia')
GROUP BY 	A.customer_id,
		D.country, 
		C.city			
ORDER BY 	total_amount_paid DESC
LIMIT 		5
