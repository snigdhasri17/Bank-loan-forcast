SELECT*FROM financial@loan

SELECT count(id) AS Total_Applications FROM financial@loan

SELECT count(id) AS MTD_Total_Applications FROM financial@loan
WHERE MONTH(issue_date)=12 And YEAR(issue_date)=2021

SELECT count(id) AS PMTD_Total_Applications FROM financial@loan
WHERE MONTH(issue_date)=11 And YEAR(issue_date)=2021

SELECT SUM(loan_amount) AS Total_Funded_amount FROM financial@loan

SELECT SUM(loan_amount) AS MTD_Total_Funded_amount FROM financial@loan
WHERE MONTH(issue_date)=12 And YEAR(issue_date)=2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_amount FROM financial@loan
WHERE MONTH(issue_date)=11 And YEAR(issue_date)=2021

SELECT SUM(total_payment) AS Total_Amount_Received from financial@loan 

SELECT SUM(total_payment) AS MTD_Total_Amount_Received from financial@loan 
WHERE MONTH(issue_date)=12 And YEAR(issue_date)=2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received from financial@loan 
WHERE MONTH(issue_date)=11 And YEAR(issue_date)=2021


SELECT AVG(int_rate)*100 AS AVG_Int_Rate From financial@loan
SELECT ROUND(AVG(int_rate)*100,4) AS AVG_Int_Rate From financial@loan

SELECT ROUND(AVG(int_rate)*100,4) AS MTD_AVG_Int_Rate From financial@loan
WHERE MONTH(issue_date)=12 And YEAR(issue_date)=2021


SELECT ROUND(AVG(int_rate)*100,4) AS PMTD_AVG_Int_Rate From financial@loan
WHERE MONTH(issue_date)=11 And YEAR(issue_date)=2021

SELECT AVG(dti)*100 AS Avg_dti FROM financial@loan
SELECT ROUND(AVG(dti)*100,4) AS Avg_dti from financial@loan

SELECT ROUND(AVG(dti)*100,4) AS Avg_dti from financial@loan
WHERE MONTH(issue_date)=12 And YEAR(issue_date)=2021

SELECT ROUND(AVG(dti)*100,4) AS Avg_dti from financial@loan
WHERE MONTH(issue_date)=11And YEAR(issue_date)=2021

SELECT
	(COUNT(case when loan_status = 'Fully paid' or loan_status = 'current' THEN id END) *100)
	/
	COUNT(id) AS Good_Loan_per
	FROM financial@loan

SELECT COUNT(id) AS Good_Loan_Applications FROM financial@loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM financial@loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
 
SELECT SUM(total_payment) AS Good_Loan_Amount_received FROM financial@loan
WHERE loan_status='Fully Paid' or loan_status='Current'

SELECT
	(COUNT(case when loan_status = 'Charged Off'  THEN id END) *100)
	/
	COUNT(id) AS Good_Loan_per
	FROM financial@loan

SELECT COUNT(id) AS Good_Loan_Applications FROM financial@loan
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM financial@loan
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Good_Loan_Amount_received FROM financial@loan
WHERE loan_status='Charged Off'

SELECT
	loan_status,
	COUNT(id) AS Loan_holders,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received,
	AVG(int_rate)*100 AS Avg_Int_Rate,
	AVG(dti)*100 AS Avg_dti,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
	FROM financial@loan
	Where MONTH(issue_date)=12
	GROUP BY loan_status

	SELECT
		loan_status,
		SUM(total_payment) AS MTD_Total_Amount_Received,
		SUM(loan_amount) AS MTD_Total_Funded_Amount
		FROM financial@loan
		Where MONTH(issue_date)=12
		GROUP BY loan_status

SELECT 
	DATENAME(MONTH,issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
	FROM financial@loan
	GROUP BY MONTH(issue_date),DATENAME(MONTH,issue_date)
	ORDER BY MONTH(issue_date)

SELECT
	address_state,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
	FROM financial@loan
	GROUP BY address_state
	order by SUM(loan_amount)desc


SELECT
	term,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
	FROM financial@loan
	GROUP BY term
	
SELECT 
	emp_length,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
	FROM financial@loan
	GROUP BY emp_length
	order by emp_length


	SELECT 
	purpose,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
	FROM financial@loan
	where sub_grade='c3'
	GROUP BY purpose
	order by purpose 

	SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
	FROM financial@loan
	GROUP BY home_ownership
	order by home_ownership


	