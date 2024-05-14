--Shana Szanzer
--9/28/2023

--A SELECT statement that returns VendorName, InvoiceNumber, InvoiceDate and Balance
SELECT VendorName, 
	InvoiceNumber, 
	InvoiceDate, 
	Balance = InvoiceTotal - (PaymentTotal + CreditTotal) 
FROM Vendors ven Join Invoices inv
ON ven.VendorID = inv.VendorID
WHERE InvoiceTotal - (PaymentTotal + CreditTotal) > 0
ORDER BY VendorName ASC;     

--SELECT statement that returns VendorName, Default Account Number and Account Description 
SELECT VendorName, 
	[Default Account Number] = DefaultAccountNo, 
	AccountDescription
FROM Vendors ven JOIN GLAccounts gla
ON ven.DefaultAccountNo = gla.AccountNo
ORDER BY AccountDescription, VendorName;

--SELECT statement that returns Vendor, Date, Number, #, and Line Item 
SELECT Vendor = VendorName,
	Date = InvoiceDate,
	Number = InvoiceNumber,
	# = InvoiceSequence,
	LineItem = InvoiceLineItemAmount
FROM Vendors ven JOIN Invoices inv
ON ven.VendorID = inv.VendorID
JOIN InvoiceLineItems ili
ON ili.InvoiceID = inv.InvoiceID
ORDER BY Vendor, Date, Number, #

--SELECT statement that returns AccountNo and AccountDescription. 
--never been used?
SELECT gla.[AccountNo], 
	   gla.[AccountDescription]
FROM GLAccounts gla 
LEFT JOIN InvoiceLineItems inv
ON gla.AccountNo = inv.AccountNo
WHERE inv.AccountNO IS NULL
ORDER BY AccountNo;
--left join on invoices where column is null display

--UNION operator that generates VendorName and VendorState in relation to CA 
SELECT VendorName, VendorState = 'CA'
FROM Vendors ven
WHERE VendorState = 'CA'
UNION
SELECT VendorName, VendorState= 'Outside CA'
FROM Vendors ven
WHERE VendorState != 'CA' 
ORDER BY VendorName