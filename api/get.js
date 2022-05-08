// controls all the GET requests
const sqlReq = require("./sql");

//******************** GET REQUEST HANDLING **************************/

function gets(app, pool){
    
    //FETCHING DATA ( ALL OR ONE ) FROM A TABLE NO FOREIGN KEYS
    const getCreator = (resourceName, tablo) => {
        /* 
        NOTE : "getCreator" creates GET requests listeners FOR TABLES WITH NO FOREIGN KEY. 
        It receives the name of the resouce requested and the name of the table. 
        Then sends the whole table without applying any data filtering
        It is only used for table that does not depend on other. (For table without foreign keys)  
        */

        //FETCHING THE WHOLE TABLE
        app.get(`/api/${resourceName}`, (req, res) => {// GET general Structure
            pool.getConnection((error, connection) => {
                if (error){
                    res.status(500).send(`DataBase connection error. An error occured when trying to connect to the db : ${error.message}`);
                }else{ 
                    const myReq = (req.query.email && req.query.sifre && resourceName == "yoneticiler") ? sqlReq.wholeTable(tablo) + " WHERE email='" + req.query.email + "' AND sifre='" + req.query.sifre + "'"  : sqlReq.wholeTable(tablo);
                    connection.query( myReq , (error, result) => {
                        if (error){ 
                            res.status(500).send(`DataBase Quering error. An error occured when trying to send the query to the db : ${error.message}`);
                        }else{
                            res.send(JSON.stringify(result));
                        }
                    });
                }
            });
        });//End of for fetchin the all table

        // FETCHING A SINGILAR ID
        app.get(`/api/${resourceName}/:id`, (req, res) => {// GET general Structure
            pool.getConnection((error, connection) => {
                if (error){
                    res.status(500).send(`DataBase connection error. An error occured when trying to connect to the db : ${error.message}`);
                }else{
                    const resourceId = parseInt(req.params.id); 
                    connection.query(sqlReq.oneIdFromTable( tablo, resourceId ) , (error, result) => {
                        if (error){
                            res.status(500).send(`DataBase Quering error. An error occured when trying to send the query to the db : ${error.message}`);
                        }else{
                            if(!result.find( item => item.id == resourceId)){ 
                                res.status(404).send(`DataBase Quering error. An error occured when fetching data from the db. "${resourceId}" id was not found`); console.log(result);
                            }else{
                                res.send(JSON.stringify(result)); 
                            }
                        }
                    });
                }
            });
        });// End of for fetching a specific id
    }// End

    //FETCHING DATA ( ALL OR ONE ) FROM A TABLE WITH FOREIGN KEYS
    const getDataFromTableWithFKsCreator = (resourceName, sqlReq) => { 
        /*
            resourceName : THE NAME OF THE RESSOURCE
            sqlReq() : The function that generate the SQL request. 
            "sqlReq" : Receives nothing to fetch the whole table OR the id tho fetch a specific entry
        */
        app.get(`/api/${resourceName}`, (req, res) => {// GET general Structure
            pool.getConnection( (error, connection) => {
                if (error){
                    res.status(500).send(`DataBase connection error. An error occured when trying to connect to the db : ${error.message}`);
                }else{
                    let myReq = (req.query.key && resourceName == "uyeler") ? sqlReq() + " AND (ad LIKE '" + req.query.key + "%' OR soyadi LIKE '" + req.query.key + "%' )" : sqlReq();
                    myReq = (req.query.email && req.query.sifre && resourceName == "uyeler") ? sqlReq() + " AND email='" + req.query.email + "' AND sifre='" + req.query.sifre + "'"  : sqlReq();
                    
                    connection.query( myReq, (error, result) => {
                        if ( error ){ 
                            res.status(500).send(`DataBase Quering error. An error occured when trying to send the query to the db : ${error.message}`);
                        }else{
                            res.send( JSON.stringify(result) );
                        }
                    });
                }
            });
        });//End of for fetching the whole table 

        app.get(`/api/${resourceName}/:id`, (req, res) => {// GET general Structure
            pool.getConnection((error, connection) => {
                if (error){
                    res.status(500).send(`DataBase connection error. An error occured when trying to connect to the db : ${error.message}`);
                }else{
                    connection.query( sqlReq(parseInt(req.params.id)) , (error, result) => {
                        if ( error ){ 
                            res.status( 500 ).send(`DataBase Quering error. An error occured when trying to send the query to the db : ${error.message}`);
                        }else{
                            /*if( result.length == 0 ){
                              res.status(404).send(`DataBase Quering error. Id doesn't match any enty in the table`);
                            }else{
                                res.send( JSON.stringify( result ) );
                            }*/
                            res.send( JSON.stringify( result ) );
                        }
                    });
                }
            });
        });//End of fetching for a specific Id

    };// End

    const createSingleGet = (resourceName, sqlReq) =>{
        app.get(`/api/${resourceName}`, (req, res) => {// GET general Structure
            pool.getConnection((error, connection) => {
                if (error){
                    res.status(500).send(`DataBase connection error. An error occured when trying to connect to the db : ${error.message}`);
                }else{
                    connection.query( sqlReq, (error, result) => {
                        if (error){ 
                            res.status(500).send(`DataBase Quering error. An error occured when trying to send the query to the db : ${error.message}`);
                        }else{
                            res.send(JSON.stringify(result));
                        }
                    });
                }
            });
        })
    };

    //
    createSingleGet("istatistikler", sqlReq.istatistikler);
    createSingleGet("istat2", sqlReq.istat2);
    createSingleGet("istat3", sqlReq.istat3);
    //handling bilgi_alanlari requests
    getCreator("bilgiAlanlari", "bilgi_alanlari");

    //Handling diller requests 
    getCreator("diller", "diller");

    //Handling etkinlik_turleri requests 
    getCreator("etkinlikTurleri", "etkinlik_turleri");

    //Handling meslekler requests 
    getCreator("meslekler", "meslekler");
    
    //Handling salonlar requests 
    getCreator("salonlar", "salonlar"); 
    
    //Handling ulkeler requests 
    getCreator("ulkeler", "ulkeler");

    //Handling yoneticiler requests 
    getCreator("yoneticiler", "yoneticiler");
    
    //GET REQUESTS********************************//

    //FETCHING KONUSMACI
    getDataFromTableWithFKsCreator("konusmacilar", sqlReq.konusmacilar);
    getDataFromTableWithFKsCreator("konusmaciDilleri", sqlReq.konusmaciDilleri);
    getDataFromTableWithFKsCreator("konusmaciBilgiAlanlari", sqlReq.konusmaciBilgiAlanlari);

    //FETCHING ETKINLIKLER
    getDataFromTableWithFKsCreator("etkinlikler", sqlReq.ekinlikler);
    getDataFromTableWithFKsCreator("etkinliklerinKonusmacilari", sqlReq.etkinliklerinKonusmacilari);
    getDataFromTableWithFKsCreator("etkinliklerinCanliBaglantilari", sqlReq.etkinliklerinCanliBaglantilari);
    getDataFromTableWithFKsCreator("etkinliklerinYonelikOlduklariBilgiAlanlari", sqlReq.etkinliklerinYonelikOlduklariBilgiAlanlari);
    
    //FETCHING KOLTUKLAR
    getDataFromTableWithFKsCreator("koltuklar", sqlReq.koltuklar);  

    //FETCHING UYELER
    getDataFromTableWithFKsCreator("uyeler", sqlReq.uyeler);
    getDataFromTableWithFKsCreator("uyeDilleri", sqlReq.uyeDilleri );

    //FETCHING BILLETRLER
    getDataFromTableWithFKsCreator("biletler", sqlReq.biletler);
    getDataFromTableWithFKsCreator("biletKoltuklari", sqlReq.biletKoltuklari);

};

module.exports = gets;