const Joi = require("joi");

module.exports.reqOptionObj = (path, method) => {
    return {
        hostname : "localhost",
        port : process.env.PORT || 8000,
        protocol : "http:",
        path : path,
        headers : {
            "content-type" : "application/json"
        },
        method : method,
    }
};

//UYE SCHEMA (The general structure for a classic candidate)
module.exports.validUyeSchema = Joi.object({
    id : Joi.number().min(1),
    ad: Joi.string().min(1).max(50).required(),
    soyad: Joi.string().min(1).max(50).required(),
    email: Joi.string().email().max(50).required(),
    tel:  Joi.string().min(9).max(15).required(),
    meslek_id: Joi.number().integer().positive().required(),
    ulke_id: Joi.number().integer().positive().required(),
    sehir: Joi.string().min(2).max(50).required(),
    sifre: Joi.string().min(5).max(5).required(),
});

//BILGI_ALANI SCHEMA (Structure for bilgi_alani)
module.exports.validBilgiAlani = Joi.object({
    id : Joi.number().min(1),
    baslik: Joi.string().min(2).max(100).required(),
});

//DIL SCHEMA
module.exports.validDil = Joi.object({
    id : Joi.number().min(1),
    baslik: Joi.string().min(2).max(50).required(),
});

//ETKINLIK_TURU SCHEMA 
module.exports.validEtkinlikTuru = Joi.object({
    id : Joi.number().min(1),
    baslik: Joi.string().min(2).max(50).required(),
});

//MESLEKLER SCHEMA 
module.exports.validMeslek = Joi.object({
    id : Joi.number().min(1),
    baslik: Joi.string().min(2).max(50).required(),
});

//KOLTUKLAR SCHEMA 
module.exports.validKoltuk = Joi.object({
    id : Joi.number().min(1),
    salon_id: Joi.number().min(1),
    koltuk_numarasi : Joi.string().min(1).required()
});

//YONETICILER SCHEMA 
module.exports.validYonetici = Joi.object({
    id : Joi.number().min(1),
    ad: Joi.string().min(1).max(50).required(),
    soyad: Joi.string().min(1).max(50).required(),
    email: Joi.string().email().max(50).required(),
    tel:  Joi.string().min(9).max(15).required(),
    sifre: Joi.string().min(5).max(5).required(),
});

//SALONLAR SCHEMA
module.exports.validSalon = Joi.object({
    id : Joi.number().min(1),
    salon_adi : Joi.string().min(1).max(50).required(),
    koltuk_sayisi : Joi.number().min(1).required()
});

//ETKINLIK SCHEMA
module.exports.validEtkinlik = Joi.object({
    baslik : Joi.string().min(1).required(), 
    tarih : Joi.string().min(10).max(10).required(), 
    konuya_giris_metni : Joi.string().min(1), 
    baslangic_saati : Joi.string().min(2).required(), 
    bitis_saati : Joi.string().min(2).required(),
    arka_plan_linki : Joi.string().uri(), 
    salon_id : Joi.number().min(1).required(), 
    etkinlik_dili_id : Joi.number().min(1).required(), 
    etkinlik_turu_id : Joi.number().min(1).required()
});

module.exports.validatEtkinliklerinKonusmacilari = Joi.object({
    id : Joi.number().min(1),
    etkinlik_id : Joi.number().min(1).required(),
    konusmaci_id : Joi.number().min(1).required(),
});

module.exports.validatetkinliklerinCanliBaglantilari = Joi.object({
    id : Joi.number().min(1),
    baglanti : Joi.string().uri().min(3).max(255).required(),
    etkinlik_id : Joi.number().min(1).required(),
});

module.exports.validatetkinliklerinYonelikOlduklariBilgiAlanlari  = Joi.object({
    id : Joi.number().min(1),
    etkinlik_id : Joi.number().min(1).required(),
    bilgi_alani_id : Joi.number().min(1).required(),
});
 

//KONUSMACILAR SCHEMAS
module.exports.validKonusmaci = Joi.object({
    id : Joi.number().min(1),
    ad: Joi.string().min(1).max(50).required(),
    soyad: Joi.string().min(1).max(50).required(),
    email: Joi.string().email().max(50).required(),
    tel:  Joi.string().min(9).max(15).required(),
    internet_sitesi : Joi.string().uri(),
    kurum : Joi.string().min(2),
    kurum_gorevi : Joi.string().min(2),
    hakkinda : Joi.string().min(10).max(1000),
    ana_bilgi_alani_id : Joi.number().min(1),
    meslek_id: Joi.number().integer().positive().required(),
    ulke_id: Joi.number().integer().positive().required(),
    sehir: Joi.string().min(2).max(50).required(),
    sifre: Joi.string().min(5).max(5).required(),
    profil : Joi.string().min(3).max(255),
});

module.exports.validKonusmaciDili = Joi.object({
    id : Joi.number().min(1),
    dil_id : Joi.number().min(1).required(),
    konusmaci_id : Joi.number().min(1).required(),
});

module.exports.validKonusmaciBilgiAlani = Joi.object({
    id : Joi.number().min(1),
    bilgi_alani_id : Joi.number().min(1).required(),
    konusmaci_id : Joi.number().min(1).required(),
});


//BILET SCHEMAS
module.exports.validBilet = Joi.object({
    id : Joi.number().min(1),
    etkinlik_id : Joi.number().min(1).required(),
    uye_id : Joi.number().min(1).required(),
});

module.exports.validBiletKoltuk = Joi.object({
    id : Joi.number().min(1),
    bilet_id : Joi.number().min(1).required(),
    koltuk_id : Joi.number().min(1).required(),
});