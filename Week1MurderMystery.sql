-- Murder Mystery as part Summer of SQL learning Practise
-- this is what gives me the information of teh suspect as provided by the 2 witnesses which were Marty Schapito and Annabel Miller. 



SELECT *
FROM person
WHERE name like 'Annabel%'
AND address_street_name = 'Franklin Ave'

SELECT *
FROM person 
WHERE address_street_name LIKE 'Northwestern%'
ORDER BY address_number DESC LIMIT 1

SELECT name
	,id
	,ssn
	,person_id
	,transcript
FROM person p
JOIN interview i
	ON p.id = i.person_id
WHERE name = 'Annabel Miller' 
OR name = 'Morty Schapiro' 

SELECT membership_id
	,check_in_date
	,gm.id
	,gm.person_id
	,gm.name
	,membership_status
    ,dl.plate_number
	,i.transcript
FROM get_fit_now_member gm
JOIN get_fit_now_check_in gc
	ON gm.id = gc.membership_id
JOIN person p 
	ON gm.person_id = p.id
JOIN drivers_license dl
	ON p.license_id = dl.id
JOIN interview i 
	ON i.person_id = p.id
		WHERE check_in_date = 20180109
		AND membership_status = 'gold'
		AND membership_id LIKE '%48Z%'
		AND plate_number LIKE '%H42W%';


--I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.
--Is the new description of who it was that might have committed the murder meaning, this person from this query is the accomplice but not the main guy. 

SELECT 
	dl.height
	,p.name
	,dl.hair_color
	,dl.hair_color
	,dl.car_make
	,dl.car_model
	,COUNT(fb.event_name) 	AS occurrence_event
FROM person p 
JOIN drivers_license dl
	ON p.license_id = dl.id

JOIN facebook_event_checkin fb
	ON p.id = fb.person_id

		WHERE dl.height BETWEEN 65 AND 67
		AND dl.car_make LIKE 'Tes%'
		AND dl.car_model = 'Model S'
		AND dl.hair_color = 'red'
		AND fb.event_name = 'SQL Symphony Concert'
GROUP BY p.name
		,fb.event_name
		,dl.hair_color
		,dl.car_make
		,dl.height
		,fb.event_name;
