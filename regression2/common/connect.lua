function thread_init(thread_id)                                                                               
    db_disconnect()                                                                                           
end                                                                                                           

function thread_done(thread_id)                                                                               
    db_disconnect()                                                                                           
end                                                                                                           
                                                                                                              
function event(thread_id)                                                                                     
    db_connect()                                                                                           
    rs = db_query("SELECT 1 FROM dual")
    db_disconnect()                                                                                           
end
