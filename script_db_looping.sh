#!/bin/bash
echo "Masukkan Password MySql :"
read pass
export MYSQL_PWD=$pass

echo "Berapa Banyak Database Yang Mau Di Buat ? *int"
read jum

echo "Tetapkan do_date Aplikasi Untuk Lembaga : format('YYYY-mm-dd')"
read dodate

d=$(date -d "$dodate" +%F)

for (( c=1; c<=$jum; c++ ))
do  
        echo "Masukkan Nama Database $c :"
        read db
        mysql -u root -e "CREATE DATABASE $db"
        mysqldump db_name -u root | mysql -u root $db

        mysql -u root $db -e "DELETE FROM tb_sekolah WHERE id=1; INSERT INTO tb_sekolah(id, do_date) VALUES(1, '$d')"
done

echo "Database Berhasil Di Tambahkan"
