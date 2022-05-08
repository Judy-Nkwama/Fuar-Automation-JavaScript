
//POST----------------------------------------------//   

//POSTING A NEW CANDIDATE
module.exports.newUye = uye => {
    const {ad, soyad, email, tel, meslek_id, ulke_id, sehir, sifre} = uye;
    return {
        request : "INSERT INTO uyeler (ad, soyadi, email, tel, meslek_id, ulke_id, sehir, sifre) VALUES(?,?,?,?,?,?,?,?)",
        values : [ad, soyad, email, tel, meslek_id, ulke_id, sehir, sifre]
    } 
};

//POSTING A NEW BILGI_ALANI
module.exports.newBilgiAlani = body => {
    const { baslik } = body;
    return {
        request : `INSERT INTO bilgi_alanlari (baslik) VALUES(?)`,
        values : [baslik]
    };
};

//POSTING A NEW BILET
module.exports.newBilet = body => {
    const { etkinlik_id, uye_id } = body;
    return {
        request : `INSERT INTO biletler (etkinlik_id, uye_id) VALUES(?,?)`,
        values : [etkinlik_id, uye_id]
    };
};

module.exports.newBiletKolkuk = body => {
    const { bilet_id, koltuk_id } = body;
    return {
        request : `INSERT INTO bilet_koltuklari ( bilet_id, koltuk_id ) VALUES(?,?)`,
        values : [ bilet_id, koltuk_id ]
    };
};

//POSTING A NEW DIL
module.exports.newDil = body => {
    const { baslik } = body;
    return {
        request : `INSERT INTO diller (baslik) VALUES(?)`,
        values : [baslik]
    };
};

//POSTING A NEW ETKINLIK_TURU
module.exports.newEtkinlikTuru = body => {
    const { baslik } = body;
    return {
        request : `INSERT INTO etkinlik_turleri (baslik) VALUES(?)`,
        values : [baslik]
    };
};

//POSTING A NEW MESLEKLER
module.exports.newMeslek = body => {
    const { baslik } = body;
    return {
        request : `INSERT INTO meslekler (baslik) VALUES(?)`,
        values : [baslik]
    };
};

//POSTING A NEW SALONLAAR
module.exports.newSalon = body => {
    const { salon_adi, koltuk_sayisi } = body;
    return {
        request : `INSERT INTO salonlar (salon_adi, koltuk_sayisi) VALUES(?,?)`,
        values : [salon_adi, koltuk_sayisi]
    };
};

//POSTING A NEW KOLTUK
module.exports.newKoltuk = body => {
    const { salon_id, koltuk_numarasi} = body;
    return {
        request : `
        INSERT INTO koltuklar (salon_id, koltuk_numarasi) VALUES (?,?)`,
        values : [salon_id, koltuk_numarasi]
    };
};

//POSTING A NEW YONETICI
module.exports.newYonetici = body => {
    const { ad, soyad, email, tel, sifre } = body;
    return {
        request : `INSERT INTO yoneticiler (ad, soyad, email, tel, sifre) VALUES(?,?,?,?,?)`,
        values : [ad, soyad, email, tel, sifre]
    };
};

//POSTING A NEW KONUSMACI
module.exports.newKonusmaci = body => {

    const { ad ,soyad ,email ,tel ,internet_sitesi ,kurum ,kurum_gorevi ,
    hakkinda ,ana_bilgi_alani_id ,meslek_id ,ulke_id ,sehir ,sifre, profil } = body;
    return {

        request : 
        `INSERT INTO 
            konusmacilar ( ad ,soyad ,email ,tel ,internet_sitesi ,kurum ,kurum_gorevi ,
            hakkinda ,ana_bilgi_alani_id ,meslek_id ,ulke_id ,sehir ,sifre ) 
        VALUES( ?,?,?,?,?,?,?,?,?,?,?,?,?,? )`,

        values : [ ad ,soyad ,email ,tel ,internet_sitesi ,kurum ,
        kurum_gorevi ,hakkinda ,ana_bilgi_alani_id ,meslek_id ,ulke_id ,sehir ,sifre, profil ]
    };
};

module.exports.newKonusmaciDili = body => {
    const { dil_id, konusmaci_id } = body;
    return {
        request : `INSERT INTO konusmaci_dilleri (dil_id, konusmaci_id) VALUES(?,?)`,
        values : [dil_id, konusmaci_id]
    };
};

module.exports.newKonusmaciBilgiAlani = body => {
    const { bilgi_alani_id, konusmaci_id } = body;
    return {
        request : `INSERT INTO konusmaciler_diger_bilgi_alanlar (bilgi_alani_id, konusmaci_id) VALUES(?,?)`,
        values : [ bilgi_alani_id, konusmaci_id ]
    };
};

//POSTING A NEW ETKINLIK
module.exports.newEtkinlik = body => {
    const { baslik, tarih, konuya_giris_metni, baslangic_saati, bitis_saati, 
    arka_plan_linki, salon_id, etkinlik_dili_id, etkinlik_turu_id } = body;
    return {
        request : 
        `INSERT INTO 
            etkinlikler ( baslik, tarih, konuya_giris_metni, baslangic_saati, bitis_saati, 
                arka_plan_linki, salon_id, etkinlik_dili_id, etkinlik_turu_id ) 
        VALUES(?,?,?,?,?,?,?,?,?)`,

        values : [ baslik, tarih, konuya_giris_metni, baslangic_saati, bitis_saati, 
        arka_plan_linki, salon_id, etkinlik_dili_id, etkinlik_turu_id ]
    };
};
module.exports.newEtkinliklerinKonusmacilari = body => {
    const { etkinlik_id, konusmaci_id } = body;
    return {
        request : `INSERT INTO etkinliklerin_konusmacilari ( etkinlik_id, konusmaci_id ) VALUES(?,?)`,
        values : [etkinlik_id, konusmaci_id]
    };
};

module.exports.newEtkinliklerinCanliBaglantilari = body => {
    const { etkinlik_id, baglanti } = body;
    return {
        request : `INSERT INTO etkinlik_canli_baglantilari ( etkinlik_id, baglanti ) VALUES(?,?)`,
        values : [etkinlik_id, baglanti]
    };
};

module.exports.newEtkinliklerinYonelikOlduklariBilgiAlanlari  = body => {
    const { etkinlik_id, bilgi_alani_id } = body;
    return {
        request : `INSERT INTO etkinliklerin_yonelik_olduklari_bilgi_alanlari ( etkinlik_id, bilgi_alani_id ) VALUES(?,?)`,
        values : [ etkinlik_id, bilgi_alani_id ]
    };
};

//-----------------------------------END POST//





//GETS----------------------------------------------//

module.exports.wholeTable = (table) =>`SELECT * FROM ${table}`;
module.exports.oneIdFromTable = ( table, id ) => `SELECT * FROM ${table} WHERE id=${id}`;

//QUERIES FOR GETTING UYELER 
module.exports.uyeler = (id) => {
    //fetching the whole table OR a single candidate
    const specificId = (id) ? ` AND uye.id=${id}` : ``;
    return(
    `SELECT 
        uye.id, uye.ad , uye.soyadi, uye.email AS eposta, uye.tel AS telefon, 
        meslek.baslik meslek, ulke.isim ulke, uye.sehir, uye.sifre
    FROM 
        uyeler uye, meslekler meslek, ulkeler ulke 
    WHERE 
        uye.ulke_id=ulke.id AND uye.meslek_id=meslek.id ${specificId}`
    );
};


module.exports.uyeDilleri = (id) => {
    //fetching the whole table OR a single candidate
    const specificId = (id) ? ` AND uye.id=${id}` : ``;
    return(
        `SELECT
            dil.baslik AS dil, uye.id AS uyeId
        FROM
            uyelerin_dilleri, diller dil, uyeler uye 
        WHERE
            uyelerin_dilleri.dil_id = dil.id AND uyelerin_dilleri.uye_id=uye.id ${specificId}
        `
    );
};

//QUERIES FOR GETTING KONUSMACI   
module.exports.konusmacilar = (id) => {
    //fetching the whole table OR a single candidate
    const specificId = (id) ? ` AND konusmaci.id=${id}` : ``;
    return(
        `SELECT
            konusmaci.id, ad, soyad, email AS eposta, tel AS telefon , internet_sitesi as internetSitesi, kurum, kurum_gorevi AS kurumGorevi, 
            hakkinda, sehir, sifre, profil, bilgiAlani.baslik AS anaBilgiAlani, meslek.baslik AS meslek, ulke.isim AS ulke
        FROM
            konusmacilar konusmaci, ulkeler ulke, bilgi_alanlari bilgiAlani, meslekler meslek
        WHERE
            konusmaci.ana_bilgi_alani_id=bilgiAlani.id AND konusmaci.meslek_id=meslek.id AND konusmaci.ulke_id=ulke.id ${specificId}
        `
    );
};

module.exports.konusmaciDilleri = (id) => {
    //fetching the whole table OR a single candidate
    const specificId = (id) ? ` AND konusmaci.id=${id}` : ``;
    return(
        `SELECT
            k_dilleri.id, dil.baslik AS dil, konusmaci.id AS konusmaciId
        FROM
            konusmaci_dilleri k_dilleri, diller dil, konusmacilar konusmaci 
        WHERE
            k_dilleri.dil_id = dil.id AND k_dilleri.konusmaci_id=konusmaci.id ${specificId}
        `
    );
};

module.exports.konusmaciBilgiAlanlari = (id) => {
    //fetching the whole table OR a single candidate
    const specificId = (id) ? ` AND konusmaci.id=${id}` : ``;
    return(
        `SELECT
            kb_alan.id, bilgi_alani.baslik AS bilgiAlani, konusmaci.id AS konusmaciId
        FROM
            konusmaciler_diger_bilgi_alanlar AS kb_alan, bilgi_alanlari AS bilgi_alani, konusmacilar AS konusmaci
        WHERE
            kb_alan.bilgi_alani_id=bilgi_alani.id AND kb_alan.konusmaci_id=konusmaci.id ${specificId}
        `
    );
};

//QUERIES FOR GETTING ETKINLIK 
module.exports.ekinlikler = (id) => {
    //fetching the whole table OR a single candidate
    const specificId = (id) ? ` AND etkinlik.id=${id}` : ``;
    return(
        `SELECT 
            etkinlik.id, etkinlik.baslik, etkinlik.tarih, etkinlik.konuya_giris_metni AS giris,
            etkinlik.baslangic_saati, etkinlik.bitis_saati, etkinlik.arka_plan_linki,
            salon.salon_adi AS salon, dil.baslik AS etkinlik_dili, tur.baslik AS etkinlik_turu
        FROM 
            etkinlikler etkinlik, diller dil, salonlar salon , etkinlik_turleri tur
        WHERE 
            etkinlik.salon_id=salon.id AND etkinlik.etkinlik_dili_id=dil.id AND etkinlik.etkinlik_turu_id=tur.id ${specificId}
        `
    );
};

module.exports.etkinliklerinKonusmacilari = (id) => {//id : etkinlik id !!!not etkinliklerin_konusmacilari id
    //fetching the whole table OR the konusmacilar of a single etkinlik
    const specificId = (id) ? ` AND etkinlikler.id=${id}` : ``;
    return(
        `SELECT
            etkinlikKonusmaci.id ,etkinlikler.id AS etkinlikID, konusmaci.id AS konusmaciId
        FROM
            etkinliklerin_konusmacilari AS etkinlikKonusmaci, etkinlikler, konusmacilar AS konusmaci
        WHERE
            etkinlikKonusmaci.etkinlik_id=etkinlikler.id AND etkinlikKonusmaci.konusmaci_id=konusmaci.id ${specificId}
        `
    );
};

module.exports.etkinliklerinCanliBaglantilari = (id) => {////id : etkinlik id
    //fetching the whole table OR baglatilar of a single etkinlik
    const specificId = (id) ? ` AND etkinlikler.id=${id}` : ``;
    return(
        `SELECT
            ecb.id, etkinlikler.id AS etkinlikID, ecb.baglanti
        FROM
            etkinlik_canli_baglantilari AS ecb, etkinlikler
        WHERE
            ecb.etkinlik_id=etkinlikler.id ${specificId}
        `
    );
};

module.exports.etkinliklerinYonelikOlduklariBilgiAlanlari = (id) => {//id : etkinlik id
    //fetching the whole table OR bilgi_alanlari of a single etkinlik
    const specificId = (id) ? ` AND etkinlikler.id=${id}` : ``;
    return(
        `SELECT
            eyba.id, etkinlikler.id AS etkinlikID, bilgi_alanlari.id AS bilgiAlaniId
        FROM
            etkinliklerin_yonelik_olduklari_bilgi_alanlari AS eyba, etkinlikler, bilgi_alanlari
        WHERE
            eyba.etkinlik_id=etkinlikler.id AND eyba.bilgi_alani_id=bilgi_alanlari.id ${specificId}
        `
    );
};

//QUERIES FOR GETTING KOLTUKLAR 
module.exports.koltuklar = (id) => {////id : salon_id
    //fetching the whole table OR baglatilar of a single salon
    const specificId = (id) ? ` AND salon_id=${id}` : ``;
    return(
        `SELECT
            koltuklar.id, koltuklar.koltuk_numarasi AS koltukNumarasi, salonlar.salon_adi AS salonADI,  salonlar.id AS salonID
        FROM
            koltuklar, salonlar
        WHERE
            koltuklar.salon_id=salonlar.id ${specificId}
        ORDER BY
            salonlar.id, koltuklar.id
        `
    );
};//( koltuklar.id % salonlar.koltuk_sayisi)

//QUERIES FOR GETTING BILETLER
module.exports.biletler = (id) => {
    //fetching the whole table OR a single candidate
    const specificId = (id) ? ` AND uyeler.id=${id}` : ``;
    return(
        `SELECT
            biletler.id, etkinlikler.id AS etkinlikID, etkinlikler.baslik AS etkinlikBaslik, uyeler.id AS uyeID,
            etkinlikler.tarih, etkinlik_turleri.baslik AS turu, diller.baslik AS dil, salonlar.salon_adi AS salonAdi
        FROM
            biletler, etkinlikler, uyeler, etkinlik_turleri, diller, salonlar
        WHERE
            biletler.etkinlik_id=etkinlikler.id AND biletler.uye_id=uyeler.id 
            AND etkinlikler.etkinlik_turu_id=etkinlik_turleri.id 
            AND etkinlikler.etkinlik_dili_id=diller.id AND etkinlikler.salon_id=salonlar.id ${specificId}
        `
    );
};

module.exports.biletKoltuklari = (id) => {
    //fetching the whole table OR for a single bilet
    const specificId = (id) ? ` AND biletler.id=${id}` : ``;
    return(
        `SELECT
            bilet_koltuklari.id, biletler.id AS biletID, koltuklar.id AS kolkukID
        FROM
            bilet_koltuklari, biletler, koltuklar
        WHERE
            bilet_koltuklari.bilet_id=biletler.id AND bilet_koltuklari.koltuk_id=koltuklar.id ${specificId}
        `
    );
};


//QUERIES FOR GETTING ISTATISTIKLER
module.exports.istatistikler = 
    `SELECT * FROM (
        (SELECT COUNT(id) AS etkinlikSayisi FROM etkinlikler) AS etkinlikSayisi,
        (SELECT COUNT(id) AS konusmaciSayisi FROM konusmacilar) AS konusmaciSayisi,
        (SELECT COUNT(id) AS uyeSayisi FROM uyeler) AS uyeSayisi,
        (SELECT COUNT(id) AS katilanSayisi FROM biletler) AS katilanSayisi,
        (SELECT COUNT(id) AS yoneticiSayisi FROM yoneticiler) AS yoneticiSayisi,
        (SELECT COUNT(id) AS gerceklesmisEtkinlikSayisi FROM etkinlikler WHERE tarih < CURRENT_DATE()) AS gerceklesmisEtkinlikSayisi
    );
    `
;

module.exports.istat2 = 
    `(SELECT
        etkinlik_turleri.baslik as etkinlikTuru,
        0 as toplamBilet
    FROM 
        etkinlik_turleri  
    WHERE baslik NOT IN 
        (SELECT 
            etkinlik_turleri.baslik as etkinlikTuru
        FROM biletler, etkinlikler, etkinlik_turleri
        WHERE biletler.etkinlik_id=etkinlikler.id AND etkinlikler.etkinlik_turu_id=etkinlik_turleri.id
        GROUP BY etkinlik_turleri.baslik
        )
    )
    
        UNION
        
    (SELECT 
        etkinlik_turleri.baslik as etkinlikTuru, COUNT(*) as toplamBilet
    FROM biletler, etkinlikler, etkinlik_turleri
    WHERE biletler.etkinlik_id=etkinlikler.id AND etkinlikler.etkinlik_turu_id=etkinlik_turleri.id
    GROUP BY etkinlik_turleri.baslik
    );    
    `
;

module.exports.istat3 = 
`
(SELECT
	etkinlik_turleri.baslik as etkinlikTuru,
	0 as toplamBilet
FROM 
	etkinlik_turleri  
WHERE baslik NOT IN 
	(SELECT
		etkinlik_turleri.baslik as etkinlikTuru
	FROM etkinlikler, etkinlik_turleri
	WHERE etkinlikler.etkinlik_turu_id=etkinlik_turleri.id
	GROUP BY etkinlik_turleri.baslik
	)
)

	UNION
    
(SELECT 
	etkinlik_turleri.baslik as etkinlikTuru, COUNT(*) as toplamBilet
FROM etkinlikler, etkinlik_turleri
WHERE etkinlikler.etkinlik_turu_id=etkinlik_turleri.id
GROUP BY etkinlik_turleri.baslik
)
`;


//-----------------------------------END GETS//





//PUTS----------------------------------------------//

//UPDATE BILGI_ALANLARI
module.exports.updateBilgiAlani = bilgi_alani =>
`UPDATE bilgi_alanlari SET baslik='${bilgi_alani.baslik}' WHERE id=${bilgi_alani.id}`

//UPDATE DILLER
module.exports.updateDil = dil =>
`UPDATE diller SET baslik='${dil.baslik}' WHERE id=${dil.id}`

//UPDATE DILLER
module.exports.updateEtkinlikTuru = etkinlikTuru =>
`UPDATE etkinlik_turleri SET baslik='${etkinlikTuru.baslik}' WHERE id=${etkinlikTuru.id}`

//UPDATE MESLEKLER
module.exports.updateMeslek = body =>
`UPDATE meslekler SET baslik='${body.baslik}' WHERE id=${body.id}`;

//UPDATE SALONLAR
module.exports.updateSalon = body =>
`UPDATE salonlar SET salon_adi='${body.salon_adi}', koltuk_sayisi=${body.koltuk_sayisi} WHERE id=${body.id}`;

//UPDATE SALONLAR
module.exports.updateYonetici = body =>
`UPDATE 
    yoneticiler 
SET 
    ad='${body.ad}', soyad='${body.soyad}', email='${body.email}', tel='${body.tel}', sifre='${body.sifre}'
WHERE 
    id=${body.id}`
;

//UPDATE KONUSMACI
module.exports.updateKonusmaci = body =>
`UPDATE 
    konusmacilar
SET
    ad='${body.ad}' , soyad='${body.soyad}' , email='${body.email}' , tel='${body.tel}' , internet_sitesi='${body.internet_sitesi}',
    kurum='${body.kurum}' , kurum_gorevi='${body.kurum_gorevi}' , hakkinda='${body.hakkinda}' , ana_bilgi_alani_id='${body.ana_bilgi_alani_id}', 
    meslek_id='${body.meslek_id}' , ulke_id='${body.ulke_id}' , sehir='${body.sehir}' , sifre='${body.sifre}' , profil='${body.profil}'
WHERE 
    id=${body.id}`
;

module.exports.updateKonusmaciDili = body =>
`UPDATE 
    konusmaci_dilleri
SET 
    dil_id='${body.dil_id}', konusmaci_id='${body.konusmaci_id}'
WHERE 
    id=${body.id}`
;

module.exports.updateKonusmaciBilgiAlani = body =>
`UPDATE 
    konusmaciler_diger_bilgi_alanlar
SET 
    bilgi_alani_id='${body.bilgi_alani_id}', konusmaci_id='${body.konusmaci_id}'
WHERE 
    id=${body.id}`
;

//UPDATE ETKINLIKLER
module.exports.updateEtkinlik = body =>
`UPDATE etkinlikler
SET
    baslik="${body.baslik}", tarih="${body.tarih}", konuya_giris_metni='${body.konuya_giris_metni}', baslangic_saati='${body.baslangic_saati}', 
    bitis_saati='${body.bitis_saati}', arka_plan_linki='${body.arka_plan_linki}', salon_id='${body.salon_id}',
    etkinlik_dili_id='${body.etkinlik_dili_id}', etkinlik_turu_id='${body.etkinlik_turu_id}' 
WHERE 
    etkinlikler.id=${body.id}
`;



module.exports.updateEtkinliklerinKonusmacilari = body => 
`UPDATE etkinliklerin_konusmacilari 
SET konusmaci_id="${body.konusmaci_id}", etkinlik_id=${body.etkinlik_id}
WHERE etkinliklerin_konusmacilari.id=${body.id}`;

module.exports.updateEtkinliklerinCanliBaglantilari = body => 
`UPDATE etkinlik_canli_baglantilari 
SET baglanti="${body.baglanti}", etkinlik_id=${body.etkinlik_id}
WHERE etkinlik_canli_baglantilari.id=${body.id}`;

module.exports.updateEtkinliklerinYonelikOlduklariBilgiAlanlari = body => 
`UPDATE etkinliklerin_yonelik_olduklari_bilgi_alanlari 
SET etkinlik_id=${body.etkinlik_id}, bilgi_alani_id=${body.bilgi_alani_id}
WHERE etkinliklerin_yonelik_olduklari_bilgi_alanlari.id=${body.id}`;



//UPDATE ALL THE DATA ABOUT THE UYE
module.exports.updateUye = body =>
`UPDATE
    uyeler
SET
    ad='${body.ad}', soyadi='${body.soyad}', email='${body.email}', tel='${body.tel}', 
    meslek_id=${body.meslek_id}, ulke_id=${body.ulke_id}, sehir='${body.sehir}', sifre='${body.sifre}'
WHERE
    id=${body.id}
`;
//-----------------------------------END GETS//
