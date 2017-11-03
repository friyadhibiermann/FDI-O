-ESP8266
<ol>
<li>atur ssid, password dan ip esp8266/config.lua</li>
<pre>
local module = {}
module.SSID = {}
module.SSID["SSID-OPENWRT"] = "PASWWORD-OPENWRT"
module.HOST = "IP-OPENWRT"
module.PORT = 8883
module.ID = node.chipid()
module.ENDPOINT = "nodemcu/"
return module
</pre>
</ol>
-OPENWRT
<ol>
<li>dependent package openwrt, paket yang di butuhkan di openwrt</li>
<pre>
opkg update
opkg install bash bc mjpg-streamer mosquitto mosquitto-client libmosquitto
</pre>
- openwrt mosquitto.conf
<pre>
cat /etc/mosquitto/mosquitto.conf<br>
max_queued_messages 200
message_size_limit 0
allow_zero_length_clientid true
allow_duplicate_messages false
listener 8883
autosave_interval 900
autosave_on_changes false
persistence true
#persistence_file mosquitto.db
allow_anonymous true
password_file /etc/mosquitto/pwfile
</pre>
<li>setup openwrt fdio</li>
<pre>
fdi_gpio setup
gpio yang akan di pakai [copas nomer yang gpio nya exp:  12 ] mengerti? [y/n]  : y
MODE config [esp|openwrt]: esp
jumlah gpio yang akan di export [0-9]  :1
masukan nomer gpio yang tersedia di esp anda [0-9] gpio 1 = :4
chips id gpio 1: [isi chips id esp8266 anda]
masukan nomer gpio yang tersedia di atas [Nama] NAMA 1 = :saklar1
[ENTER]
</pre>
<li>menjalankan jalankan mosquitto</li>
<pre>
fdi_gpio mos 4 ON [chipid] # di saya -> fdi_gpio mos 4 ON 52659
#jika led esp nyala script suksesss
fdi_gpio json # jika tidak ada error maka bisa di lanjut install aplikasi di android
fdi_gpio startup
vi /etc/rc.local
fdi_gpio startup #agar berjalan saat boot
</pre>
</ol>

Fdi-o adalah aplikasi remote control untuk mengendalikan saklar/relay yang terhubung pada GPIO di perangkat/router berbasis OpenWRT.
dan dapat juga sebagai media [ music / video ] server [ Cloud Player]

Aplikasi ini ditujukan untuk digunakan dengan router yang telah dimodifikasi software dan hardwarenya (lihat screenshot terakhir). Tolong jangan mengunduh aplikasi ini jika Anda tidak tahu cara penggunaannya.

preview:
~~~~~~~~
bisa di tonton di youtube
https://www.youtube.com/watch?v=LqnfGdJLO5c&feature=youtu.be


FITUR FDI-O v 1.0.2 [beta]
~~~~~~~~~~~~
[NEW] ESP8266 Support

1. Saklar dengan setting yang di sesuaikan pengguna

setting:
~~~~~~~~
- Nama Saklar
- Mengatur Waktu Nyala dan Mati setiap saklar
- Merubah Nama Setiap saklar
- Merubah Akun Login User / Password
- List server yang tersimpan saat login ( mempermudah agar tidak login berulangkali );
- Status Setiap Timer Saklar dapat di rubah kondisi menggunakan/tidak timer per saklar

Music:
~~~~~~	
- List musik yang tersimpan di Router (default: /root/mp3)
- Logo seperti Disk player yang berputar (mempercantik)
- list scrollable

Video:
~~~~~~
- List musik yang tersimpan di Router (default: /root/Video) 

Langkah:
~~~~~~~~
2. Langkah pertama setelah penginstallan script "fdi-o.ipk" di router
- menu login ( pojok kanan atas )
- isi user(default: admin), pass(default:admin)
- klik tombol simpan terlebih dahulu, lalu login

PENTING !!!!!
~~~~~~~~~~~~~~~~~~~~~~~~~

- aplikasi ini berjalan dengan device pendukung ( OS openwrt/router )
- jalankan script yang di dapat dari http://facebook.com/friyadhibiermann di router anda...
- hubungi untuk penginstallan dan donasi jika bermanfaat...
- file yang akan di beri berupa file "fdi-o.ipk" untuk di install di device(pc/router) anda


OPEN SOURCE
~~~~~~~~~~~~~~~~~~~~~~~~~
Opensource dapat kunjungi halaman kami https://github.com/friyadhibiermann/smarthome

CREDITS
~~~~~~~~~~~~~~~~~~~~~~~~~

- Group OpenWRT Indonesia (https://www.facebook.com/groups/openwrt/)
- Friyadhi biermann (https://www.facebook.com/friyadhibiermann)
