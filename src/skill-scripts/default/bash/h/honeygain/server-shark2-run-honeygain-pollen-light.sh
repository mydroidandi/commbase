#!/bin/bash
# File: server-shark2-run-honeygain-pollen-light.sh
# Description: Script to feed the running Honeygain in the server running xserver

# Requires:
# screen (terminal software.) Required to avoid network traffic between server
# and guest due to the terminal is open to keep the program running. With screen
# we can detach the terminal and re-attach it later on without interrupting
# (killing) the process.
# run-honeygain-in-the-server.sh

# Makes the lynx web browsers automatically visit a huge list of pages in order to
# create traffic that produces Honeygain coins for the logged in account:
# sleep examples:
# sleep .5 # Waits 0.5 second.
# sleep 5  # Waits 5 seconds.
# sleep 5s # Waits 5 seconds.
# sleep 5m # Waits 5 minutes.
# sleep 5h # Waits 5 hours.
# sleep 5d # Waits 5 days.

# Debugging:
# Check the process with the command: $ ps -aux | grep "lynx"
# top
# uptime -p
# Example:
# lynx -accept_all_cookies www.youtube.com &
# sleep 1m # sleep 1 minute
# pkill lynx
# lynx -accept_all_cookies www.yahoo.com &
# sleep 1m # sleep 1 minute
# pkill lynx

# Enter with screen to attach a terminal session is required for the command to run properly,
# and perfect if you don't want constant server signals sent to your local host.
# Use & after every site is required for the command to run properly.

# The list is done using multiline selection in vscode (CTRL+SHIFT+DOWN):
lynx -accept_all_cookies https://www.16personalities.com/profile &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.2freehosting.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://3commas.io/d &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.youracclaim.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.addthis.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://campus.abaenglish.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://independent.academia.edu/AlvaroHerrera &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://careers.accenture.com/cr-es/jobs/Pages/submit-resume.aspx &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://talentconnection.accenture.com/EN/Login &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://acciontrabajo.co.cr/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.acx.com/help/narrators/200484550 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.adrive.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://documentcloud.adobe.com/link/home/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.adultfinder.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.aeropostale.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.airtm.com/home &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.aliexpress.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://alison.com/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.amazon.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://authorcentral.amazon.com/gp/landing?ie=UTF8&*Version*=1&*entries*=0 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.amazon.com/gp/jobs &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.ane.cr/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://appetize.io &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.apple.com/itunes/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://ascensionworks.tv &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://workhub.atexto.com/transcription/dashboard-user.php &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.atlassian.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://web.getaurox.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://elearning.avventa.com/moodle/login/change_password.php &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.bac.net/bacsanjose/esp/banco/index.html &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.Backcountry.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://badgr.io &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://badoo.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.bancobcr.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://publishers.basicattentiontoken.org/publishers/home?locale=en &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://bbs.market/CRMAN/posts &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.bbsoftware.com.uk &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.beatport.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://beersurveys.com/default.aspx &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://welcome.online.berklee.edu &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://betfury.io/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.binance.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://googlecerts.biginterview.com/members/curriculum &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://account.bit2me.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://bitbucket.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.bitnami.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.bityard.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://multiserviciosmahg.blogspot.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.brainly.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://talk.brutal.app/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://btcmine.pw &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://es.btcnewz.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.buscojobs.cr &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.bybit.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://dictionary.cambridge.org/translate/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.canvas.net/dashboard/in-progress?current_user_id=719537 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://capacitateparaelempleo.org/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://campus.chamilo.org/index.php &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.careercircle.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://castingwords.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://aissfa.ccss.sa.cr/afiliacion/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://rrhh.ccss.sa.cr/SIAE/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://cex.io/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.chatsexocostarica.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.latinamerica.citibank.com/costarica/index.html &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://cindejobfair.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://ciudadempleo.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.citi.co.cr &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.clonewarsadventures.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://wallet.cloudatcost.com/auth &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://codepen.io/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.codeproject.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.codewars.com/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.coinbase.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.coingecko.com/en &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://coinlist.co/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://coinmarketcap.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://coinstats.app/en/portfolio/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.computrabajo.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.coopesana.com/home/sanfrancisco/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.copy.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.coursera.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://createspace.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.criptohunter.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://crowdsurfwork.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://crypto.com/exchange &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://merchant.crypto.com/users/sign_in &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://cryptotabbrowser.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.cwcontrols.com/JobListings.aspx &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.cybrary.it/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://dentavox.dentacoin.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://careers.deloitte.com/jobs/eng-global/apply/j/72932 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.deviantart.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://diib.com/app/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://discordapp.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://infinity.disney.com/es-419 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://disqus.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://hub.docker.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.domainrightnow.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://dozerg.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.dreamtravelscr.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.dropbox.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.dualmine.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://autofaucet.dutchycorp.space/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.dvlottery.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://dxdy.finance/3MNOOOW &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://dyn.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://easyeda.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.ebay.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.ebuddy.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://ecmining.club/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.eddiejaoude.io/course-github-profile &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.education.com/worksheets/?cid=11.2143 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.eduonix.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.edureka.co &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://courses.edx.org/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.efset.org/free-english-test/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://eifi.com/airdrop/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.elempleo.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.elempleo.co.cr/empresas/index.asp &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.elfinancierocr.com/pymes/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.ematricula.ucr.ac.cr &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://empleo.ice.go.cr/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.empleos.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.encuentra24.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.estrategiarh.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://ethmine.cloud/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.expoempleo.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.jobs.experian.com/index.asp &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.experian.taleo.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.facebook.com/alvord.coke &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.facebook.com/alvaro.herrera.777363 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.facebook.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://firefaucet.win &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://faucetpay.io &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://fbs.com/cabinet/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://esfbs.com/cabinet/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://fex.net/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.finalemusic.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.firstdatajobs.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.fiverr.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.flickr.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://forums.serif.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.foursquare.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://forvo.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://free-tron.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://freebitco.in/?op=home &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.freecodecamp.org/learn &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.freelancer.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://freesound.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://futuramaster.com/login/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://g.dev/estebanherrera &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.gametester.gg/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://geekguide.linuxjournal.com/user &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://exchange.gemini.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://gengo.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.genymotion.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.getblend.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.github.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.gitlab.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.globalprofitsnet.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://glitch.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.gmail.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.gmrtranscription.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://developers.google.com/profile/u/107578574931364782050/edit &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://play.google.com/store?hl=en &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Colab%20RDP/Colab%20RDP.ipynb#scrollTo=Q6bl1b0EifVG &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://gotranscript.com/transcription-jobs/quiz?language=english &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.grammarly.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://en.gravatar.com/site/check/stv.herrera@gmail.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.grupoice.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.guru.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.hacienda.go.cr/scripts/criiiext.dll?UTILREQ=COMPRARED &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.hackerrank.com/skills-verification &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.hi5.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://member.hide.me/en/?welcome=1 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://hivemicro.com/jobs &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://hobbiecode.teachable.com/courses/1402219/lectures/32206700 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://hola.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://dashboard.honeygain.com/764sedqWopiL5 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.hotmail.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.hotmail.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://howtopronounce.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.hp.com/go/jobs/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://cpanel.hostinger.mx &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://hubic.com/en/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.huobi.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://cloud.ibm.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.ibm.com/start &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://krb-sjobs.brassring.com/TGnewUI/Search/home/HomeWithPreLoad?PageType=JobDetails&partnerid=26059&siteid=5016&Areq=395120BR#SavedJobs &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://students.yourlearning.ibm.com/activity/URL-6E1401728D4A?channelId=CNL_LCB_1626893234857 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.icloud.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.idle-empire.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://trader.iforex.com/webpl3/webtrader.html?view=2 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://imgur.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://imperiosdigitales.thinkific.com/enrollments &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.ina.ac.cr &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.inavirtual.ed.cr/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://cr.indeed.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.instagram.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://intel.com/jobs/costarica &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://iqoption.com/en &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://jlcpcb.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://cr.jobomas.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://jsfiddle.net/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://koding.com/R/zezen20 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.kobo.com/writinglife &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://kolotibablo.com/workers/start &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://kproxy.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://languageline.wd5.myworkdayjobs.com/en-US/LLS_Careers/userHome &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://lared.tech/register &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://lastpass.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://latium.org/freelancer-plans &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://lcsc.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.leanpub.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://e-learning.life-global.org/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://letyshops.com/global &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.linkedin.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://linuxappstore.io/?fbclid=IwAR148udyAltDcRMpWZOfleIANZIUD0w2B6pmVZZkG7ZUBv8m0_tPuMkjmLg &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://linuxcounter.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.livemocha.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://lobstr.co/authorization/signin/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://localbitcoins.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://member.lovecointoken.org/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.manpower.com.mx &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.manpowerprofessional.com.mx &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://shop.mashable.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://max.makerstudios.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://medium.com/@stv.herrera &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://megabonus.com/en/home &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.meic.go.cr/index.php?option=com_content&view=article&id=346&Itemid=244 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://mega.co.nz &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.mentimeter.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.mercadolibre.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://metaloni.com/profile &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies MetaMask &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://docs.microsoft.com/en-us/learn/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://login.microsoftonline.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.microsoft.com/en-US/microsoft-365/microsoft-teams/group-chat-software &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://login.microsoftonline.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.microverse.org/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.midichords.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.modsecurity.com/downloads &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.monitor.us &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://jobview.monster.com/Apply/Apply.aspx?JobID=135186327 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.mql5.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://worker.mturk.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://musicbrainz.org/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.myaeropost.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.myebook.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.myfreecams.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.myfreepaysite.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.mysql.com/login/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://3m.wd1.myworkdayjobs.com/en-US/Search/job/Service-Desk-Support-Analyst_R01025960/apply/LinkedIn?source=&shared_id= &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://encore.wd1.myworkdayjobs.com/en-US/externalnew/jobs &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://techdata.wd1.myworkdayjobs.com/en-US/External/introduceYourself &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://myeasytronbot.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://mystnodes.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.ncsacademy.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://campus.neetwork.com/courses/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://nermining.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.netacad.com/group/landing/v2/learn/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://neustar.wd5.myworkdayjobs.com/en-US/neustar-careers/job/Costa-Rica-Heredia &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.nextearth.io/auth/login &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://learn.nexgent.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.nhatdistance.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.nike.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.no-ip.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://thenounproject.com/term/merkabah/16491/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://odysee.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://office.live.com/start/default.aspx?s=1 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.office.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://olx.co.cr &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://es.oneamour.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://onlyfans.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://onlinebookclub.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://backpack.openbadges.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://openlibra.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://manage.openshift.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.oracle.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://learning.oreilly.com/home/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.oreilly.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.ori.ucr.ac.cr &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.outlook.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.oxforddictionaries.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.packtpub.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.paguertrading.com/panel/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://ssl.panoramio.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://paidera.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://paxful.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.paya.one &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://payhip.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://login.payoneer.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.paypal.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.paypal.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.pcbway.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.peopleperhour.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://phemex.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies Pi Network &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://picoworkers.com/jobs.php &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.pinterest.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.pg.co.cr &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.plex.tv/sign-up/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://cloud.pocketbook.digital/browser/#/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.powtoon.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://prezi.com/dashboard/next/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://prezi.com/dashboard/next/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.promerica.fi.cr/site/index.aspx &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://account.protonvpn.com/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.psigmaonline.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://pubhtml5.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://es.pornhub.com/signup &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.pwcjobs.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://pypi.org/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.qa-world.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.queopinas.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://quickbooks.intuit.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://quip.com/account/login &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.quora.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.rackspace.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.raidcall.com/index.php?lang=es &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.reddit.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.remotasks.com/en &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://replit.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://resmine.com/Dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://es.resonancescience.org/library &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.rev.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://rollercoin.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://runkeeper.com/alvord &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://cai.tools.sap/signup &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.safecreative.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.sandbox.game/en/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.scolartic.com/inicio &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://screencast-o-matic.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.scribd.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.scribd.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://scribie.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://scrimba.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.serif.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://serversman.com/herreraecri-node/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.sharedtalk.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.shelfari.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.shellhub.io/register &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.sicop.go.cr/index.jsp &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.skillpages.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.skype.com/en/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://slack.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.slideshare.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.slideshare.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.smarterer.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://socialrebel.co/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://soundcloud.com/cosmic-riders-852354746/tracks &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://soundcloud.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.sourceforge.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.Soziety.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.spreaker.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.sqlpass.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.squareup.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://stablepool.io/cabinet &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://stackoverflow.com/users/story/16882270 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://stackskills.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.start.me/p/ZkjQdo/esteban-en-youtube &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.stormgain.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://streamelements.com/obslive &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.studypool.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://store.steampowered.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://suvmine.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.swagbucks.com/surveys &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.sykes.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.tagged.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.taringa.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://login.teamviewer.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://techdata.wd1.myworkdayjobs.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.techrepublic.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://deals.tecmint.com/user/purchases &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.tecoloco.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://teletech.taleo.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.theodinproject.com/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://theresultscompanies.com/jobs &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://thetypingcat.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.tiktok.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://timebucks.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.tomedes.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.topbuzz.com/feed &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://marketplace.tracktion.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.tradingview.com/chart/OzDtZ1wU/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.transcriptioncertificationinstitute.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://trello.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://tronfinance.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://tronscan.org/#/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://trxtron.site/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.truenorthtest.com/login &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.truetwit.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.tsu.co &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.ttscrla.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://aestudiosblog.tumblr.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://honestlysublimeobject.tumblr.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://liquidsmok.tumblr.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.twitch.tv/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://twitpic.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.twitter.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.twitter.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.tryeraser.com/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.tutellus.com/mis-cursos/aprendo &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.tryroll.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.ubdi.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.ubid.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://ubuntuforums.org &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://login.ubuntu.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.udacity.com/course/viewer#!/c-ud730/l-6370362152/m-6379811817 &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.udemy.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.uhostall.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://aprende.uned.ac.cr/login/change_password.php &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://entornoestudiantil.uned.ac.cr/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.unilever-ancam.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://unstoppabledomains.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://wallet.uphold.com/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.upwork.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.usdminer.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://usf-video.xyz/userarea.php &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://panel.validately.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://verbit.ai/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.videonotebook.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://alvarion.visualstudio.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://app.vidiq.com/auth/login &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.vimeo.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.vmware.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.voices.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://my-learning.w3schools.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://wakatime.com/settings/api-key &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://wakedoge.io/account &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://waves.exchange/sign-up/email &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://waywithwords.net &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.websitepulse.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.weebly.com/app/home/users/133487505/sites/468031269718931081/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://courses.wesbos.com/account &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.westernunion.com/careers &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.wish.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://applieddigitalskills.withgoogle.com/dashboard &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://learndigital.withgoogle.com/digitalgarage/plan/in_progress &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.wix.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://wordpress.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.workana.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://xasic.io/login &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.xmarks.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.xnxx.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.xodo.com/app/#/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://mail.yahoo.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://www.yesstyle.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.youtube.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://youtube.com/c/lescifi &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.youtube.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies www.youreeeka.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.yumpu.com/en &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies http://www.zdnet.com/ &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://academy.zenva.com &
sleep 30s # sleep 30 seconds
pkill lynx
lynx -accept_all_cookies https://writer.zoho.com &
sleep 30s # sleep 30 seconds
pkill lynx
#
#
#
echo "List finished!"
exit 0
