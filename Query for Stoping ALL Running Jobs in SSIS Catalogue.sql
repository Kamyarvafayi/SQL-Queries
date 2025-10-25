USE SSISDB;
SELECT 
    execution_id,
    folder_name,
    project_name,
    package_name,
    status,
    start_time
FROM catalog.executions 
WHERE status = 2; -- 2 = Running


--EXEC catalog.stop_operation @operation_id = 570;

--EXEC catalog.stop_operation @operation_id = 10571;




