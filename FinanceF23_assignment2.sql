--Shana Szanzer
--9/28/2023

-- SELECT statement that returns Date, closing price for IBM Ticker, and closing price for GLD ticker.
SELECT Date = FORMAT(ts.date, 'dd-MMM-yy'),
	    FORMAT(ts.[close], '#,###.00') AS [IBM CLose],
	    FORMAT(dd.[close], '#,###.00') AS [GLD Close]
FROM TS_DailyData ts 
JOIN TS_DailyData dd on dd.date = ts.date 
		and ts.Ticker = 'IBM' and dd.Ticker = 'GLD';


--The data only for the days on which GLD closed higher than IBM
SELECT Date = FORMAT(ts.date, 'dd-MMM-yy'),
	    FORMAT(ts.[close], '#,###.00') AS [IBM CLose],
	    FORMAT(dd.[close], '#,###.00') AS [GLD Close]
FROM TS_DailyData ts 
JOIN TS_DailyData dd on dd.date = ts.date 
		and ts.Ticker = 'IBM' and dd.Ticker = 'GLD'
WHERE dd.[close] > ts.[Close];



