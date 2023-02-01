WITH	top5_customers_in_top10_countries 
      (customer_id,
      first_name,
      last_name,
      country,
      city,
      total_amount_paid) AS
			(SELECT A.customer_id,
              A.first_name,
              A.last_name,
              D.country, 
              C.city,
       				SUM (amount) AS total_amount_paid
			FROM 		customer A
			INNER JOIN 	address B ON A.address_id = B.address_id
			INNER JOIN 	city C ON B.city_id = C.city_id
			INNER JOIN 	country D ON C.country_ID = D.country_ID
			INNER JOIN	rental E ON A.customer_id = E.customer_id
			INNER JOIN	payment F ON E.rental_id = F.rental_id
			WHERE		country IN ('India','China','United States','Japan','Mexico','Brazil','Russian Federation','Philippines','Turkey','Indonesia')
			GROUP BY 	A.customer_id,
						D.country, 
						C.city			
			ORDER BY 	total_amount_paid DESC
			LIMIT 		5)

SELECT	    D.country,
		        COUNT(DISTINCT A.customer_id) AS all_customer_count,
		        COUNT(DISTINCT top5_customers_in_top10_countries.customer_id) AS top_five_customers
FROM 		    customer A
INNER JOIN 	address B ON A.address_id = B.address_id
INNER JOIN 	city C ON B.city_id = C.city_id
INNER JOIN 	country D ON C.country_ID = D.country_ID

LEFT JOIN	  top5_customers_in_top10_countries ON D.country = top5_customers_in_top10_countries.country

GROUP BY 	  D.country
ORDER BY	  top_five_customers DESC
LIMIT 		  4
