# picklist-history-analysis-with-SQL
Use SQL for excellent historical tracking/reporting of picklist values in the CRM.

Before getting started, do not forget to enable the tracking of your desired pick list in your CRM module. (The deal stage tracking is enabled by default)

Imagine how useful it would be to analyze all the different times that your deals were transitioned to closed lost. You could see from which other stage they were switched, how long they were in the prior stage, when it happened, and also now the data for any other fields you decide to track when you enable history tracking.

This report will show all of the stage transitions to Closed Lost from the stages not excluded in line 19.
The 'Modified Time' field is the time at which the deal transitioned to that stage. The 'Last Activity Time' is the time in which it was transferred to the new stage.
So, by joining the stage history field to itself, but ensuring that the Last Activity Time of the joined table equals the Modified Time of the base table, we are only including specific transitions in our results. */
