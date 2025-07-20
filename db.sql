
--CREATE DATABASE traffic_monitor;

-- Sử dụng database vừa tạo
--\c traffic_monitor;


CREATE TABLE category (
    id SMALLSERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);


CREATE TABLE web (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    category_id INTEGER REFERENCES category(id) ON DELETE CASCADE
);


CREATE TABLE domain (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    web_id INTEGER REFERENCES web(id) ON DELETE CASCADE
);


CREATE TABLE log (
    id SERIAL PRIMARY KEY,
    web_id INTEGER REFERENCES web(id) ON DELETE SET NULL,
    ip_address INET NOT NULL,
    accessed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO public.category(name)
VALUES ('Entertainment'), ('Social'), ('Engine'), ('Education'), ('Commerce'), ('News'), ('Porn');
	
INSERT INTO public.web (name, category_id)
	VALUES ('Youtube', 1),('Truyện QQ', 1),('Truyện Full', 1),('Anime VietSub Online', 1),
	('Net Truyện', 1),('Mê Truyện Chữ', 1), ('Truyện Wiki', 1), ('Dưa leo truyện', 1),
	 ('Rổ phim', 1),('U Mê Truyện Hay', 1),('Tiktok', 1),('VNG Games', 1),('Phim Mới', 1);	

insert into web (name, category_id)
	values ('Facebook', 2), ('Zalo', 2), ('X', 2), ('Reddit', 2), ('Discord', 2), ('VOZ', 2), 
			('Instagram', 2);

insert into web (category_id, name)
	values (3, 'Google'), (3, 'Cốc Cốc'), (3, 'OpenAI'), (3, 'MSN'), (3, 'Canva'), (3, 'Wikipedia'),
			(3, 'Github'), (3, 'Pinterest');

insert into web (category_id, name)
	values (4, 'Vietjack'), (4, 'Lời Giải Hay'), (4, 'Thư viện Pháp Luật');

insert into web (category_id, name)
	values (5, 'Shopee'), (5, 'Thế Giới Di Động'), (5, 'Lazada'), (5, 'FPT Shop'), (5, 'CellphoneS'),
	(5, 'Nhà thuốc Long Châu'), (5, 'Xổ số Đại Phát'), (5, 'Điện Máy Xanh');

insert into web (category_id, name)
	values (6, '24h'), (6, 'Báo Dân Trí'), (6, 'Báo Tuổi Trẻ'), (6, 'Kênh 14'), (6, 'Znews'), (6, 'Báo Mới'),
			(6, 'Cafe F'), (6, 'Soha'), (6, 'Báo Lao Động'), (6, 'ViệtNamNet'), (6, 'Báo Thanh Niên'),
			(6, 'Bóng Đá Plus');

insert into web (category_id, name)
	values (7, 'Porn');


INSERT INTO domain (name, web_id) VALUES ('youtubeggpht.cn', 1);
INSERT INTO domain (name, web_id) VALUES ('ggpht.com', 1);
INSERT INTO domain (name, web_id) VALUES ('googlevideo.com', 1);
INSERT INTO domain (name, web_id) VALUES ('wide-youtube.l.google.com', 1);
INSERT INTO domain (name, web_id) VALUES ('withyoutube.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtu.be', 1);
INSERT INTO domain (name, web_id) VALUES ('youtube-nocookie.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtube-ui.l.google.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtube.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtube.googleapis.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubeeducation.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubeembeddedplayer.googleapis.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubefanfest.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubegaming.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubego.co.id', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubego.co.in', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubego.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubego.com.br', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubego.id', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubego.in', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubei.googleapis.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubekids.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtubemobilesupport.com', 1);
INSERT INTO domain (name, web_id) VALUES ('yt.be', 1);
INSERT INTO domain (name, web_id) VALUES ('ytimg.com', 1);
INSERT INTO domain (name, web_id) VALUES ('youtube', 1);
INSERT INTO domain (name, web_id) VALUES ('truyenqqto.com', 2);
INSERT INTO domain (name, web_id) VALUES ('truyenqqgo.com', 2);
INSERT INTO domain (name, web_id) VALUES ('truyenqq.com', 2);
INSERT INTO domain (name, web_id) VALUES ('truyenfull.vision', 3);
INSERT INTO domain (name, web_id) VALUES ('truyenfull.io', 3);
INSERT INTO domain (name, web_id) VALUES ('truyenfull.com.co', 3);
INSERT INTO domain (name, web_id) VALUES ('animevietsubhd.cc', 4);
INSERT INTO domain (name, web_id) VALUES ('animevietsub.app', 4);
INSERT INTO domain (name, web_id) VALUES ('animevietsub.pub', 4);
INSERT INTO domain (name, web_id) VALUES ('animevietsub.lol', 4);
INSERT INTO domain (name, web_id) VALUES ('nettruyenc.com', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyendie.net', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyenmck.net', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyento.net', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyenzn.com', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyen.net.vn', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyenaa.com', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyenviet.com', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyenmanga.com', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyenzone.com', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyenuu.com', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyen.com.vn', 5);
INSERT INTO domain (name, web_id) VALUES ('nettruyenvio.com', 5);
INSERT INTO domain (name, web_id) VALUES ('metruyenchu.com.vn', 6);
INSERT INTO domain (name, web_id) VALUES ('metruyenchu.org', 6);
INSERT INTO domain (name, web_id) VALUES ('metruyencv.com', 6);
INSERT INTO domain (name, web_id) VALUES ('metruyen.net.vn', 6);
INSERT INTO domain (name, web_id) VALUES ('metruyen.co', 6);
INSERT INTO domain (name, web_id) VALUES ('wikidich.com.vn', 7);
INSERT INTO domain (name, web_id) VALUES ('truyenwikidich.net', 7);
INSERT INTO domain (name, web_id) VALUES ('dualeotruyeny.com', 8);
INSERT INTO domain (name, web_id) VALUES ('dualeotruyenhi.com', 8);
INSERT INTO domain (name, web_id) VALUES ('rophim.me', 9);
INSERT INTO domain (name, web_id) VALUES ('rophim.org', 9);
INSERT INTO domain (name, web_id) VALUES ('rophim.com', 9);
INSERT INTO domain (name, web_id) VALUES ('umetruyenhay.com', 10);
INSERT INTO domain (name, web_id) VALUES ('umetruyenhay.net', 10);
INSERT INTO domain (name, web_id) VALUES ('umetruyenz.com', 10);
INSERT INTO domain (name, web_id) VALUES ('tiktok.com', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktokv.com', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktokcdn.com', 11);
INSERT INTO domain (name, web_id) VALUES ('worldfcdn2.com', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktokd.net', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktokd.org', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktokeu-cdn.com', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktokrow-cdn.com', 11);
INSERT INTO domain (name, web_id) VALUES ('ttlivecdn.com', 11);
INSERT INTO domain (name, web_id) VALUES ('ttwstatic.com', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktok', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktokcdn', 11);
INSERT INTO domain (name, web_id) VALUES ('tiktokd', 11);
INSERT INTO domain (name, web_id) VALUES ('vnggames.com', 12);
INSERT INTO domain (name, web_id) VALUES ('phimmoi.net', 13);
INSERT INTO domain (name, web_id) VALUES ('phimmoi.com', 13);
INSERT INTO domain (name, web_id) VALUES ('phimmoizz.net', 13);
INSERT INTO domain (name, web_id) VALUES ('phimmoizzz.net', 13);
INSERT INTO domain (name, web_id) VALUES ('phimmoiplus.net', 13);
INSERT INTO domain (name, web_id) VALUES ('phimmoi.club', 13);
INSERT INTO domain (name, web_id) VALUES ('phimmoi.link', 13);
INSERT INTO domain (name, web_id) VALUES ('phimmoi.beauty', 13);
INSERT INTO domain (name, web_id) VALUES ('phimmoi.best', 13);



INSERT INTO domain (name, web_id) VALUES ('facebook.com', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook-hardware.com', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.br', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.ca', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.cc', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.design', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.net', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.hu', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.in', 14);
INSERT INTO domain (name, web_id) VALUES ('fecebook.net', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.nl', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.org', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.se', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.shop', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.tv', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.us', 14);
INSERT INTO domain (name, web_id) VALUES ('facebook.wang', 14);
INSERT INTO domain (name, web_id) VALUES ('facebooklogin.com', 14);
INSERT INTO domain (name, web_id) VALUES ('facebooklogin.info', 14);
INSERT INTO domain (name, web_id) VALUES ('facebookloginhelp.net', 14);
INSERT INTO domain (name, web_id) VALUES ('facebooklogs.com', 14);
INSERT INTO domain (name, web_id) VALUES ('facebookmail.com', 14);
INSERT INTO domain (name, web_id) VALUES ('facebookmail.tv', 14);
INSERT INTO domain (name, web_id) VALUES ('facebookmanager.info', 14);
INSERT INTO domain (name, web_id) VALUES ('facebookmarketing.info', 14);
INSERT INTO domain (name, web_id) VALUES ('facebookmarketingpartner.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fb.careers', 14);
INSERT INTO domain (name, web_id) VALUES ('fb.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fb.gg', 14);
INSERT INTO domain (name, web_id) VALUES ('fb.me', 14);
INSERT INTO domain (name, web_id) VALUES ('fb.watch', 14);
INSERT INTO domain (name, web_id) VALUES ('fbacebook.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbbmarket.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbboostyourbusiness.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbcdn.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbcdn.net', 14);
INSERT INTO domain (name, web_id) VALUES ('fbfeedback.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbhome.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbidb.io', 14);
INSERT INTO domain (name, web_id) VALUES ('fbinc.co', 14);
INSERT INTO domain (name, web_id) VALUES ('fbinnovation.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbmarketing.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbreg.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbrpms.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbsbx.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbsbx.net', 14);
INSERT INTO domain (name, web_id) VALUES ('fbsupport-covid.net', 14);
INSERT INTO domain (name, web_id) VALUES ('fbthirdpartypixel.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbthirdpartypixel.net', 14);
INSERT INTO domain (name, web_id) VALUES ('fbthirdpartypixel.org', 14);
INSERT INTO domain (name, web_id) VALUES ('fburl.com', 14);
INSERT INTO domain (name, web_id) VALUES ('fbwat.ch', 14);
INSERT INTO domain (name, web_id) VALUES ('fbworkmail.com', 14);
INSERT INTO domain (name, web_id) VALUES ('zalo.me', 15);
INSERT INTO domain (name, web_id) VALUES ('chat.zalo.me', 15);
INSERT INTO domain (name, web_id) VALUES ('zaloapp.com', 15);
INSERT INTO domain (name, web_id) VALUES ('oa.zalo.me', 15);
INSERT INTO domain (name, web_id) VALUES ('ads-twitter.com', 16);
INSERT INTO domain (name, web_id) VALUES ('cms-twdigitalassets.com', 16);
INSERT INTO domain (name, web_id) VALUES ('periscope.tv', 16);
INSERT INTO domain (name, web_id) VALUES ('pscp.tv', 16);
INSERT INTO domain (name, web_id) VALUES ('t.co', 16);
INSERT INTO domain (name, web_id) VALUES ('tellapart.com', 16);
INSERT INTO domain (name, web_id) VALUES ('tweetdeck.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twimg.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twitpic.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twitter.biz', 16);
INSERT INTO domain (name, web_id) VALUES ('twitter.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twitter.jp', 16);
INSERT INTO domain (name, web_id) VALUES ('twitter.map.fastly.net', 16);
INSERT INTO domain (name, web_id) VALUES ('twittercommunity.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twitterflightschool.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twitterinc.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twitteroauth.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twitterstat.us', 16);
INSERT INTO domain (name, web_id) VALUES ('twtrdns.net', 16);
INSERT INTO domain (name, web_id) VALUES ('twttr.com', 16);
INSERT INTO domain (name, web_id) VALUES ('twttr.net', 16);
INSERT INTO domain (name, web_id) VALUES ('twvid.com', 16);
INSERT INTO domain (name, web_id) VALUES ('vine.co', 16);
INSERT INTO domain (name, web_id) VALUES ('x.com', 16);
INSERT INTO domain (name, web_id) VALUES ('redd.it', 17);
INSERT INTO domain (name, web_id) VALUES ('reddit.app.link', 17);
INSERT INTO domain (name, web_id) VALUES ('reddit.com', 17);
INSERT INTO domain (name, web_id) VALUES ('redditblog.com', 17);
INSERT INTO domain (name, web_id) VALUES ('reddithelp.com', 17);
INSERT INTO domain (name, web_id) VALUES ('redditinc.com', 17);
INSERT INTO domain (name, web_id) VALUES ('redditmail.com', 17);
INSERT INTO domain (name, web_id) VALUES ('redditmedia.com', 17);
INSERT INTO domain (name, web_id) VALUES ('redditspace.com', 17);
INSERT INTO domain (name, web_id) VALUES ('redditstatic.com', 17);
INSERT INTO domain (name, web_id) VALUES ('redditstatus.com', 17);
INSERT INTO domain (name, web_id) VALUES ('reddit.map.fastly.net', 17);
INSERT INTO domain (name, web_id) VALUES ('discord.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discordapp.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discord.gg', 18);
INSERT INTO domain (name, web_id) VALUES ('discord.media', 18);
INSERT INTO domain (name, web_id) VALUES ('discordapp.net', 18);
INSERT INTO domain (name, web_id) VALUES ('dis.gd', 18);
INSERT INTO domain (name, web_id) VALUES ('discordcdn.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discordstatus.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discord.co', 18);
INSERT INTO domain (name, web_id) VALUES ('discord-activities.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discordactivities.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discordmerch.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discordpartygames.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discordsays.com', 18);
INSERT INTO domain (name, web_id) VALUES ('airhorn.solutions', 18);
INSERT INTO domain (name, web_id) VALUES ('airhornbot.com', 18);
INSERT INTO domain (name, web_id) VALUES ('bigbeans.solutions', 18);
INSERT INTO domain (name, web_id) VALUES ('watchanimeattheoffice.com', 18);
INSERT INTO domain (name, web_id) VALUES ('discord', 18);
INSERT INTO domain (name, web_id) VALUES ('voz.com', 19);
INSERT INTO domain (name, web_id) VALUES ('instagram.com', 20);
INSERT INTO domain (name, web_id) VALUES ('cdninstagram.com', 20);
INSERT INTO domain (name, web_id) VALUES ('bookstagram.com', 20);
INSERT INTO domain (name, web_id) VALUES ('ig.me', 20);
INSERT INTO domain (name, web_id) VALUES ('igcdn.com', 20);
INSERT INTO domain (name, web_id) VALUES ('igsonar.com', 20);
INSERT INTO domain (name, web_id) VALUES ('igtv.com', 20);
INSERT INTO domain (name, web_id) VALUES ('lnstagram-help.com', 20);
INSERT INTO domain (name, web_id) VALUES ('theinstagramhack.com', 20);
INSERT INTO domain (name, web_id) VALUES ('oninstagram.com', 20);
INSERT INTO domain (name, web_id) VALUES ('online-instagram.com', 20);
INSERT INTO domain (name, web_id) VALUES ('onlineinstagram.com', 20);
INSERT INTO domain (name, web_id) VALUES ('web-instagram.net', 20);
INSERT INTO domain (name, web_id) VALUES ('instagr.am', 20);




INSERT INTO domain (name, web_id) VALUES ('google.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googleapis.com', 21);
--INSERT INTO domain (name, web_id) VALUES ('googleusercontent.com', 21);
--INSERT INTO domain (name, web_id) VALUES ('ggpht.com', 21);
--INSERT INTO domain (name, web_id) VALUES ('googlezip.net', 21);
INSERT INTO domain (name, web_id) VALUES ('adsenseformobileapps.com', 21);
INSERT INTO domain (name, web_id) VALUES ('advertisercommunity.com', 21);
INSERT INTO domain (name, web_id) VALUES ('doubleclick.cn', 21);
INSERT INTO domain (name, web_id) VALUES ('doubleclick.com', 21);
INSERT INTO domain (name, web_id) VALUES ('doubleclick.net', 21);
INSERT INTO domain (name, web_id) VALUES ('doubleclick-cn.net', 21);
INSERT INTO domain (name, web_id) VALUES ('google.co', 21);
INSERT INTO domain (name, web_id) VALUES ('adgoogle.net', 21);
INSERT INTO domain (name, web_id) VALUES ('chrome.com', 21);
INSERT INTO domain (name, web_id) VALUES ('chromebook.com', 21);
INSERT INTO domain (name, web_id) VALUES ('chromecast.com', 21);
INSERT INTO domain (name, web_id) VALUES ('chromeos.dev', 21);
INSERT INTO domain (name, web_id) VALUES ('chromium.org', 21);
INSERT INTO domain (name, web_id) VALUES ('goo.gl', 21);
INSERT INTO domain (name, web_id) VALUES ('googledomains.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googledrive.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlee.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googleearth.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlefiber.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlefiber.net', 21);
INSERT INTO domain (name, web_id) VALUES ('googlefinland.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlemail.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlemaps.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlepagecreator.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlephotos.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googleplus.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlesource.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlestore.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlesverige.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googleusercontent.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googleventures.com', 21);
INSERT INTO domain (name, web_id) VALUES ('googlezip.net', 21);
INSERT INTO domain (name, web_id) VALUES ('coccoc.com', 22);
INSERT INTO domain (name, web_id) VALUES ('chatgpt.com', 23);
INSERT INTO domain (name, web_id) VALUES ('chat.com', 23);
INSERT INTO domain (name, web_id) VALUES ('oaistatic.com', 23);
INSERT INTO domain (name, web_id) VALUES ('oaiusercontent.com', 23);
INSERT INTO domain (name, web_id) VALUES ('openai.com', 23);
INSERT INTO domain (name, web_id) VALUES ('sora.com', 23);
INSERT INTO domain (name, web_id) VALUES ('microsoftnews.cc', 24);
INSERT INTO domain (name, web_id) VALUES ('microsoftnews.cn', 24);
INSERT INTO domain (name, web_id) VALUES ('microsoftnews.com', 24);
INSERT INTO domain (name, web_id) VALUES ('microsoftnews.net', 24);
INSERT INTO domain (name, web_id) VALUES ('microsoftnewsforkids.com', 24);
INSERT INTO domain (name, web_id) VALUES ('microsoftnewsforkids.net', 24);
INSERT INTO domain (name, web_id) VALUES ('msn.cn', 24);
INSERT INTO domain (name, web_id) VALUES ('msn.com', 24);
INSERT INTO domain (name, web_id) VALUES ('msnewskids.com', 24);
INSERT INTO domain (name, web_id) VALUES ('msnewskids.net', 24);
INSERT INTO domain (name, web_id) VALUES ('msnkids.com', 24);
INSERT INTO domain (name, web_id) VALUES ('microsoftstart.com', 24);
INSERT INTO domain (name, web_id) VALUES ('start.com', 24);
INSERT INTO domain (name, web_id) VALUES ('canva', 24);
INSERT INTO domain (name, web_id) VALUES ('canva.com', 24);
INSERT INTO domain (name, web_id) VALUES ('wikipedia', 24);
INSERT INTO domain (name, web_id) VALUES ('wikipedia.org', 24);
INSERT INTO domain (name, web_id) VALUES ('mediawiki.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikibooks.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikidata.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikimediafoundation.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikimedia.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikinews.org', 24);
--INSERT INTO domain (name, web_id) VALUES ('wikipedia.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikiquote.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikisource.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikiversity.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wikivoyage.org', 24);
INSERT INTO domain (name, web_id) VALUES ('wiktionary.org', 24);
INSERT INTO domain (name, web_id) VALUES ('git.io', 25);
INSERT INTO domain (name, web_id) VALUES ('github.blog', 25);
INSERT INTO domain (name, web_id) VALUES ('github.com', 25);
INSERT INTO domain (name, web_id) VALUES ('github.community', 25);
INSERT INTO domain (name, web_id) VALUES ('github.dev', 25);
INSERT INTO domain (name, web_id) VALUES ('github.io', 25);
INSERT INTO domain (name, web_id) VALUES ('githubapp.com', 25);
INSERT INTO domain (name, web_id) VALUES ('githubassets.com', 25);
INSERT INTO domain (name, web_id) VALUES ('githubcopilot.com', 25);
INSERT INTO domain (name, web_id) VALUES ('githubhackathon.com', 25);
INSERT INTO domain (name, web_id) VALUES ('githubnext.com', 25);
INSERT INTO domain (name, web_id) VALUES ('githubpreview.dev', 25);
INSERT INTO domain (name, web_id) VALUES ('githubstatus.com', 25);
INSERT INTO domain (name, web_id) VALUES ('githubuniverse.com', 25);
INSERT INTO domain (name, web_id) VALUES ('githubusercontent.com', 25);
INSERT INTO domain (name, web_id) VALUES ('pinterest.com', 26);
INSERT INTO domain (name, web_id) VALUES ('pinterest.co', 26);
INSERT INTO domain (name, web_id) VALUES ('pinterest', 26);



INSERT INTO domain (name, web_id) VALUES ('vietjack.com', 29);
INSERT INTO domain (name, web_id) VALUES ('vietjack.me', 29);
INSERT INTO domain (name, web_id) VALUES ('loigiaihay.com', 30);
INSERT INTO domain (name, web_id) VALUES ('thuvienphapluat.vn', 31);



INSERT INTO domain (name, web_id) VALUES ('shopee.cl', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.cn', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.co.id', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.co.th', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.com', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.com.br', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.com.co', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.com.mx', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.com.my', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.es', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.fr', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.id', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.in', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.io', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.ph', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.sg', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.tw', 32);
INSERT INTO domain (name, web_id) VALUES ('shopee.vn', 32);
INSERT INTO domain (name, web_id) VALUES ('shopeemobile.com', 32);
INSERT INTO domain (name, web_id) VALUES ('shopeesz.com', 32);
INSERT INTO domain (name, web_id) VALUES ('thegioididong.com', 33);
INSERT INTO domain (name, web_id) VALUES ('tgdd.vn', 33);
INSERT INTO domain (name, web_id) VALUES ('lazada.vn', 34);
INSERT INTO domain (name, web_id) VALUES ('lazada.co.th', 34);
INSERT INTO domain (name, web_id) VALUES ('lazada.com.my', 34);
INSERT INTO domain (name, web_id) VALUES ('lazada.com.ph', 34);
INSERT INTO domain (name, web_id) VALUES ('lazada.co.id', 34);
INSERT INTO domain (name, web_id) VALUES ('lazada.sg', 34);
INSERT INTO domain (name, web_id) VALUES ('lazada.com', 34);
INSERT INTO domain (name, web_id) VALUES ('fptshop.com.vn', 35);
INSERT INTO domain (name, web_id) VALUES ('fptshop.com', 35);
INSERT INTO domain (name, web_id) VALUES ('cellphones.com.vn', 36);
INSERT INTO domain (name, web_id) VALUES ('nhathuoclongchau.com.vn', 37);
INSERT INTO domain (name, web_id) VALUES ('xosodaiphat.com', 38);
INSERT INTO domain (name, web_id) VALUES ('xosodaiphat.net', 38);
INSERT INTO domain (name, web_id) VALUES ('dienmayxanh.com', 39);


INSERT INTO domain (name, web_id) VALUES ('24h.com.vn', 40);
INSERT INTO domain (name, web_id) VALUES ('dantri.com.vn', 41);
INSERT INTO domain (name, web_id) VALUES ('tuoitre.vn', 42);
INSERT INTO domain (name, web_id) VALUES ('kenh14.vn', 43);
INSERT INTO domain (name, web_id) VALUES ('znews.vn', 44);
INSERT INTO domain (name, web_id) VALUES ('baomoi.com', 45);
INSERT INTO domain (name, web_id) VALUES ('cafef.vn', 46);
INSERT INTO domain (name, web_id) VALUES ('soha.vn', 47);
INSERT INTO domain (name, web_id) VALUES ('laodong.vn', 48);
INSERT INTO domain (name, web_id) VALUES ('vietnamnet.vn', 49);
INSERT INTO domain (name, web_id) VALUES ('thanhnien.vn', 50);
INSERT INTO domain (name, web_id) VALUES ('bongdaplus.vn', 51);





INSERT INTO domain (name, web_id) VALUES ('pornhub.com', 52);
INSERT INTO domain (name, web_id) VALUES ('vlxx.my', 52);
INSERT INTO domain (name, web_id) VALUES ('xvideos.com', 52);
INSERT INTO domain (name, web_id) VALUES ('sextop1.page', 52);
--INSERT INTO domain (name, web_id) VALUES ('javhdz.sex', 52);
INSERT INTO domain (name, web_id) VALUES ('vlxx.xxx', 52);
INSERT INTO domain (name, web_id) VALUES ('nhentaiworld-h1.info', 52);
INSERT INTO domain (name, web_id) VALUES ('xvideos69.xxx', 52);
INSERT INTO domain (name, web_id) VALUES ('sextop1.rip', 52);
INSERT INTO domain (name, web_id) VALUES ('sextop1.baby', 52);
INSERT INTO domain (name, web_id) VALUES ('heovl.blog', 52);
INSERT INTO domain (name, web_id) VALUES ('sexgai.cc', 52);
INSERT INTO domain (name, web_id) VALUES ('xhamster2.com', 52);
INSERT INTO domain (name, web_id) VALUES ('javhay.ai', 52);
INSERT INTO domain (name, web_id) VALUES ('hentaivnx.com', 52);
INSERT INTO domain (name, web_id) VALUES ('hentaivnx.net', 52);
INSERT INTO domain (name, web_id) VALUES ('hentaivietsub.com', 52);
INSERT INTO domain (name, web_id) VALUES ('phimsexvietsub.icu', 52);
INSERT INTO domain (name, web_id) VALUES ('heovl.fit', 52);
INSERT INTO domain (name, web_id) VALUES ('viet69.lc', 52);
INSERT INTO domain (name, web_id) VALUES ('sexdep.blog', 52);
INSERT INTO domain (name, web_id) VALUES ('phe18.vip', 52);
INSERT INTO domain (name, web_id) VALUES ('anhdao.top', 52);
INSERT INTO domain (name, web_id) VALUES ('javhdz.sex', 52);
INSERT INTO domain (name, web_id) VALUES ('vivicomi2.info', 52);
INSERT INTO domain (name, web_id) VALUES ('javhdz.dev', 52);
INSERT INTO domain (name, web_id) VALUES ('xhofficial.com', 52);
INSERT INTO domain (name, web_id) VALUES ('javtiful.com', 52);
INSERT INTO domain (name, web_id) VALUES ('missav.live', 52);
INSERT INTO domain (name, web_id) VALUES ('sayhentai.ink', 52);
INSERT INTO domain (name, web_id) VALUES ('clipsexsub3x.net', 52);
INSERT INTO domain (name, web_id) VALUES ('123av.com', 52);
INSERT INTO domain (name, web_id) VALUES ('ihentai.es', 52);
INSERT INTO domain (name, web_id) VALUES ('viet69.gl', 52);



-- Tăng tốc tìm kiếm theo domain
CREATE INDEX idx_domain_name ON domain(name);

-- Tăng tốc truy vấn log theo thời gian
CREATE INDEX idx_log_time ON log(accessed_at);
