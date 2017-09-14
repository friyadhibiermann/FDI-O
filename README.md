- ESP8266
<ol>
	<li>atur ssid, password dan ip esp8266/config.lua</li>
	<pre>
		<a>local module = {}</a>
		<br>
		<a>module.SSID = {}  </a>
		<a>module.SSID["SSID-OPENWRT"] = "PASWWORD-OPENWRT"</a>
		<br>
		<a>module.HOST = "IP-OPENWRT"  </a>
		<a>module.PORT = 8883  </a>
		<a>module.ID = node.chipid()</a>
		<br>
		<a>module.ENDPOINT = "nodemcu/"  </a>
		<a>return module</a>
	</pre>
</ol>
- OPENWRT
<ol>
	<li>dependent package openwrt, paket yang di butuhkan di openwrt</li>
	<pre>
		<a>opkg update</a>
		<a>opkg install bash bc mjpg-streamer mosquitto mosquitto-client libmosquitto</a>
	</pre>
	<li>setup openwrt fdio</li>
	<pre>
		<a>fdi_gpio setup</a>
		<a>gpio yang akan di pakai [copas nomer yang gpio nya exp:  12 ] mengerti? [y/n]  : y</a>
		<a>MODE config [esp|openwrt]: esp</a>
		<a>jumlah gpio yang akan di export [0-9]  :1</a>
		<a>masukan nomer gpio yang tersedia di esp anda [0-9] gpio 1 = :4</a>
		<a>chips id gpio 1: [isi chips id esp8266 anda]</a>
		<a>masukan nomer gpio yang tersedia di atas [Nama] NAMA 1 = :saklar1</a>
		<a>[ENTER]</a>
	</pre>
	<li>jika anda menggunakan cctv rubah dulu config mjpg-streamer nya</li>
	<pre>
		<a>sed -i 's/core/core1/' /etc/config/mjpg-streamer</a>
		<a>/etc/init.d/mjpg-streamer restart</a>
	</pre>
	<li>rubah semua permition file timer.sh fdi_gpio smarthome 0755</li>
	<pre>
		<a>chmod 0755 /usr/bin/fdi_gpio</a>
		<a>chmod 0755 /usr/bin/timer.sh</a>
		<a>chmod 0755 /www/cgi-bin/smarthome</a>
	</pre>
	<li>menjalankan jalankan mosquitto</li>
	<pre>
		<a>fdi_gpio mos 4 ON [chipid] # di saya -> fdi_gpio mos 4 ON 52659</a>
		<a>#jika led esp nyala script suksesss</a>
		<a>fdi_gpio json # jika tidak ada error maka bisa di lanjut install aplikasi di android</a>
		<a>fdi_gpio startup</a>
		<a>vi /etc/rc.local</a>
		<a>fdi_gpio startup #agar berjalan saat boot</a>
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
