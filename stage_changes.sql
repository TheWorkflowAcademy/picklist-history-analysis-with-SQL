SELECT
		 d."Deal Name" 'Deal Name',
		 d."Created Time" 'Created',
		 sh."Carrier Name text" 'Carrier',
		 sh."Carrier Sales Rep" 'CSR',
		 a."Account Name" 'Account',
		 a."Account Owner Name" 'Account Owner',
		 sh."Stage" 'Previous Stage',
		 h."Stage" 'Stage',
		 h."Duration (Days)" 'Duration',
		 h."Modified Time" 'Modified Time',
		 d.Id 'Deal ID'
FROM  Deals d
JOIN "Stage History" h ON h."Stage History Name"  = d.Id 
LEFT JOIN "Stage History" sh ON sh."Stage History Name"  = h."Stage History Name" 
LEFT JOIN Accounts a ON a.Id  = d."Account Name"  
WHERE	 h."Stage"  LIKE 'Closed Lost'
 AND	d."Created Time"  NOT LIKE h."Modified Time"
 AND	sh."Stage"  NOT IN ( 'Qualification'  , 'Other_values......')
 AND	sh."Last Activity Time"  LIKE h."Modified Time"
/* This report will show all of the stage transitions to Closed Lost from the stages not excluded in line 19.
The 'Modified Time' field is the time at which the deal transitioned to that stage. The 'Last Activity Time' is the time in which it was transferred to the new stage.
So, by joining the stage history field to itself, but ensuring that the Last Activity Time of the joined table equals the Modified Time of the base table, 
we are only including specific transitions in our results. */
