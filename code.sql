Select *
From ..financial_loan

--KPI
--Total Applications:

Select COUNT(DISTINCT id) as Total_Applic
From ..financial_loan

--Total Funded Amount:
Select SUM(loan_amount) as Total_Fund_Amnt
From ..financial_loan

--Total Amount Recieved:
Select SUM(total_payment) as Total_Amnt_Rcvd
From ..financial_loan

--Average Intrest Rate:
Select AVG(int_rate)*100 as Avg_Int_Rate
From ..financial_loan

--Average Debt-to-income Ratio (DTI)
Select AVG(dti)*100 as Avg_DTI
From ..financial_loan

--DASHBOARD KPIs
--Monthwise Loan Amount
Select 
Month(issue_date) as Month_issueDate , SUM(loan_amount) as Total_Fund_Amnt
From ..financial_loan
Group By Month(issue_date)
order By Month_issueDate;

--Grade-Subgrade wise revolution balance
Select
grade, sub_grade, sum(total_payment) as Total_pay_byGrade
From ..financial_loan
Group By grade, sub_grade
order by grade, sub_grade;

-- Total Payment For Verified Status Vs Non Verified Status
Select
verification_status, sum(total_payment) as Total_pay_wrt_verification
From ..financial_loan
Group By verification_status
Order By verification_status;

--State Wise Last credit pull _d Wise Loan Status
Select
address_state, last_credit_pull_date, loan_status
From ..financial_loan
Group by address_state, loan_status, last_credit_pull_date
Order by loan_status;

--Home Ownership Vs Last Payment Date Stats
Select
home_ownership, last_payment_date
From ..financial_loan
Group by home_ownership, last_payment_date
Order by home_ownership,last_payment_date;
