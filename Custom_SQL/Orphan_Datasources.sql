SELECT  
    ds.id as datasource_id,  
    ds.name as datasource_name,  
    ds.repository_url as datasource_url,  
    p.name as project_name,  
    s.name as site_name,  
    nb_connected_workbooks  
FROM public.datasources ds  
INNER JOIN (  
    SELECT  
        dbname,  
        site_id,  
        count(id) as nb_connected_workbooks  
    FROM public.data_connections  
    WHERE owner_type = 'Workbook' and dbclass = 'sqlproxy'  
    GROUP BY dbname, site_id  
) dc ON ds.repository_url = dc.dbname AND ds.site_id = dc.site_id  
JOIN public.projects p ON ds.project_id = p.id  
JOIN public.sites s ON ds.site_id = s.id  
WHERE ds.parent_workbook_id is null
