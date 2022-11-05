#!/bin/bash
# File: server-shark2-run-honeygain-pollen-heavy.sh
# Description: Script to feed the running Honeygain in the server running xserver

# Requires:
# screen (terminal software.) Required to avoid network traffic between server
# and guest due to the terminal is open to keep the program running. With screen
# we can detach the terminal and re-attach it later on without interrupting
# (killing) the process.
# run-honeygain-in-the-server.sh

# Makes the wget automatically download a huge list of pages in order to
# create traffic that produces Honeygain coins for the logged in account:
# sleep examples:
# sleep .5 # Waits 0.5 second.
# sleep 5  # Waits 5 seconds.
# sleep 5s # Waits 5 seconds.
# sleep 5m # Waits 5 minutes.
# sleep 5h # Waits 5 hours.
# sleep 5d # Waits 5 days.
# Check the process with the command: $ ps -aux | grep "wget"
# top
# uptime -p

# # Example:
# # Go to the directory wget-files/
# cd ~:/wget-files
# # wget options:
# # To download the full site and all the pages, use 'r'.
# # Use the -l switch to set the number of levels you wish to go to (I.e.: l10).
# # Download the full site and all the pages, with infinite recursion (inf)
# # to the directory wget-files/:
# wget -r -l inf --directory-prefix=wget-files www.youtube.com &
# sleep 1m # sleep 1 minute
# pkill wget
# rm -rf wget-files/* .wget-hsts wget-log
# wget -r -l inf --directory-prefix=wget-files www.yahoo.com &
# sleep 1m # sleep 1 minute
# pkill wget
# rm -rf wget-files/* .wget-hsts wget-log

# Debugging the sites list:
# Disable the sites showing up the message: 'wget stuck on "HTTP request sent, awaiting response..." not timing out'
#wget -r l2 --directory-prefix=wget-files https://www.aa.com/AAdvantage/quickEnroll.do?
#sleep 30s #sleep 30 seconds
#pkill wget
#rm -rf wget-files/* .wget-hsts wget-log

# --limit-rate=amount:
# Limit the download speed to amount bytes per second.  Amount may be
# expressed in bytes, kilobytes with the k suffix, or megabytes with
# the m suffix.  For example, --limit-rate=20k will limit the
# retrieval rate to 20KB/s.  This is useful when, for whatever
# reason, you don't want Wget to consume the entire available
# bandwidth.

# To kill the processes:
# pkill run-honeygain-pollen-wget.sh
# pkill wget
# top

# The Commbase directory:
# Due to the loss of the Commbase application scope here, it must be re-assigned
COMMBASE=$HOME/Developer
#COMMBASE=$HOME

# The list is done using multiline selection in vscode (CTRL+SHIFT+DOWN):
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.16personalities.com/profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.2freehosting.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://3commas.io/d
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
# wget stuck on "HTTP request sent, awaiting response..." not timing out
#wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.aa.com/AAdvantage/quickEnroll.do?
#sleep 30s #sleep 30 seconds
#pkill wget
#rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.youracclaim.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.addthis.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://campus.abaenglish.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://independent.academia.edu/AlvaroHerrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://careers.accenture.com/cr-es/jobs/Pages/submit-resume.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://talentconnection.accenture.com/EN/Login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://acciontrabajo.co.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.acx.com/help/narrators/200484550
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.adrive.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://documentcloud.adobe.com/link/home/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.adultfinder.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.aeropostale.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.airtm.com/home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.aliexpress.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://alison.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.amazon.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://authorcentral.amazon.com/gp/landing?ie=UTF8&*Version*=1&*entries*=0
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.amazon.com/gp/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.ane.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://appetize.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.apple.com/itunes/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ascensionworks.tv
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://workhub.atexto.com/transcription/dashboard-user.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.atlassian.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://web.getaurox.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://elearning.avventa.com/moodle/login/change_password.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bac.net/bacsanjose/esp/banco/index.html
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.Backcountry.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://badgr.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://badoo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bancobcr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://publishers.basicattentiontoken.org/publishers/home?locale=en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://bbs.market/CRMAN/posts
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bbsoftware.com.uk
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.beatport.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://beersurveys.com/default.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://welcome.online.berklee.edu
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://betfury.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.binance.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://googlecerts.biginterview.com/members/curriculum
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://account.bit2me.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://bitbucket.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bitnami.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bityard.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://multiserviciosmahg.blogspot.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.brainly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://talk.brutal.app/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://btcmine.pw
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.btcnewz.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.buscojobs.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bybit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://dictionary.cambridge.org/translate/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.canvas.net/dashboard/in-progress?current_user_id=719537
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://capacitateparaelempleo.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://campus.chamilo.org/index.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.careercircle.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://castingwords.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://aissfa.ccss.sa.cr/afiliacion/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://rrhh.ccss.sa.cr/SIAE/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cex.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.chatsexocostarica.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.latinamerica.citibank.com/costarica/index.html
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://cindejobfair.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://ciudadempleo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.citi.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.clonewarsadventures.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wallet.cloudatcost.com/auth
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://codepen.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.codeproject.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.codewars.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coinbase.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coingecko.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinlist.co/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinmarketcap.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinstats.app/en/portfolio/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.computrabajo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.coopesana.com/home/sanfrancisco/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.copy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coursera.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://createspace.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.criptohunter.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://crowdsurfwork.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://crypto.com/exchange
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://merchant.crypto.com/users/sign_in
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cryptotabbrowser.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.cwcontrols.com/JobListings.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.cybrary.it/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dentavox.dentacoin.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://careers.deloitte.com/jobs/eng-global/apply/j/72932
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.deviantart.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://diib.com/app/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://discordapp.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://infinity.disney.com/es-419
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://disqus.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hub.docker.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.domainrightnow.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dozerg.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dreamtravelscr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dropbox.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.dualmine.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://autofaucet.dutchycorp.space/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dvlottery.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dxdy.finance/3MNOOOW
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://dyn.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://easyeda.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ebay.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ebuddy.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ecmining.club/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.eddiejaoude.io/course-github-profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.education.com/worksheets/?cid=11.2143
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.eduonix.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.edureka.co
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://courses.edx.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.efset.org/free-english-test/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://eifi.com/airdrop/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.elempleo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.elempleo.co.cr/empresas/index.asp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.elfinancierocr.com/pymes/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ematricula.ucr.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://empleo.ice.go.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.empleos.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.encuentra24.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.estrategiarh.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ethmine.cloud/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.expoempleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.jobs.experian.com/index.asp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.experian.taleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.facebook.com/alvord.coke
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.facebook.com/alvaro.herrera.777363
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.facebook.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://firefaucet.win
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://faucetpay.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://fbs.com/cabinet/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://esfbs.com/cabinet/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://fex.net/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.finalemusic.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.firstdatajobs.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.fiverr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.flickr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://forums.serif.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.foursquare.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://forvo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://free-tron.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://freebitco.in/?op=home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.freecodecamp.org/learn
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.freelancer.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://freesound.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://futuramaster.com/login/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://g.dev/estebanherrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.gametester.gg/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://geekguide.linuxjournal.com/user
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://exchange.gemini.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://gengo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.genymotion.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.getblend.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.github.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.gitlab.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.globalprofitsnet.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://glitch.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.gmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.gmrtranscription.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://goarbit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://developers.google.com/profile/u/107578574931364782050/edit
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://play.google.com/store?hl=en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Colab%20RDP/Colab%20RDP.ipynb#scrollTo=Q6bl1b0EifVG
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://gotranscript.com/transcription-jobs/quiz?language=english
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.grammarly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://en.gravatar.com/site/check/stv.herrera@gmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.grupoice.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.guru.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.hacienda.go.cr/scripts/criiiext.dll?UTILREQ=COMPRARED
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.hackerrank.com/skills-verification
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hi5.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://member.hide.me/en/?welcome=1
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hivemicro.com/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hobbiecode.teachable.com/courses/1402219/lectures/32206700
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://hola.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dashboard.honeygain.com/764sedqWopiL5
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hotmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hotmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://howtopronounce.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hp.com/go/jobs/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://cpanel.hostinger.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hubic.com/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.huobi.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cloud.ibm.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ibm.com/start
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://krb-sjobs.brassring.com/TGnewUI/Search/home/HomeWithPreLoad?PageType=JobDetails&partnerid=26059&siteid=5016&Areq=395120BR#SavedJobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://students.yourlearning.ibm.com/activity/URL-6E1401728D4A?channelId=CNL_LCB_1626893234857
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.icloud.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.idle-empire.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trader.iforex.com/webpl3/webtrader.html?view=2
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://imgur.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://imperiosdigitales.thinkific.com/enrollments
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ina.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.inavirtual.ed.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cr.indeed.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.instagram.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://intel.com/jobs/costarica
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://iqoption.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://jlcpcb.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cr.jobomas.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://jsfiddle.net/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://koding.com/R/zezen20
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.kobo.com/writinglife
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://kolotibablo.com/workers/start
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://kproxy.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://languageline.wd5.myworkdayjobs.com/en-US/LLS_Careers/userHome
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lared.tech/register
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lastpass.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://latium.org/freelancer-plans
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lcsc.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.leanpub.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://e-learning.life-global.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://letyshops.com/global
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.linkedin.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://linuxappstore.io/?fbclid=IwAR148udyAltDcRMpWZOfleIANZIUD0w2B6pmVZZkG7ZUBv8m0_tPuMkjmLg
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://linuxcounter.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.livemocha.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lobstr.co/authorization/signin/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://localbitcoins.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://member.lovecointoken.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.manpower.com.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.manpowerprofessional.com.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://shop.mashable.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://max.makerstudios.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://medium.com/@stv.herrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://megabonus.com/en/home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.meic.go.cr/index.php?option=com_content&view=article&id=346&Itemid=244
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://mega.co.nz
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.mentimeter.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.mercadolibre.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://metaloni.com/profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://docs.microsoft.com/en-us/learn/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.microsoftonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.microsoft.com/en-US/microsoft-365/microsoft-teams/group-chat-software
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.microsoftonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.microverse.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.midichords.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.modsecurity.com/downloads
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.monitor.us
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://jobview.monster.com/Apply/Apply.aspx?JobID=135186327
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.mql5.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://worker.mturk.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://musicbrainz.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.myaeropost.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.myebook.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.myfreecams.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.myfreepaysite.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.mysql.com/login/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://3m.wd1.myworkdayjobs.com/en-US/Search/job/Service-Desk-Support-Analyst_R01025960/apply/LinkedIn?source=&shared_id=
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://encore.wd1.myworkdayjobs.com/en-US/externalnew/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://techdata.wd1.myworkdayjobs.com/en-US/External/introduceYourself
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://myeasytronbot.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://mystnodes.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.ncsacademy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://campus.neetwork.com/courses/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://nermining.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.netacad.com/group/landing/v2/learn/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://neustar.wd5.myworkdayjobs.com/en-US/neustar-careers/job/Costa-Rica-Heredia
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.nextearth.io/auth/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learn.nexgent.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.nhatdistance.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.nike.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.no-ip.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://thenounproject.com/term/merkabah/16491/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://odysee.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://office.live.com/start/default.aspx?s=1
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.office.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://olx.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.oneamour.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://onlyfans.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://onlinebookclub.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://backpack.openbadges.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://openlibra.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://manage.openshift.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oracle.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learning.oreilly.com/home/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oreilly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ori.ucr.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.outlook.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oxforddictionaries.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.packtpub.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.paguertrading.com/panel/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ssl.panoramio.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://paidera.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://paxful.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.paya.one
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://payhip.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.payoneer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.paypal.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.paypal.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.pcbway.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.peopleperhour.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://phemex.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://picoworkers.com/jobs.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pinterest.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pg.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.plex.tv/sign-up/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cloud.pocketbook.digital/browser/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.powtoon.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://prezi.com/dashboard/next/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://prezi.com/dashboard/next/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.promerica.fi.cr/site/index.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://account.protonvpn.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.psigmaonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://pubhtml5.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://es.pornhub.com/signup
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pwcjobs.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://pypi.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.qa-world.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.queopinas.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://quickbooks.intuit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://quip.com/account/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.quora.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.rackspace.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.raidcall.com/index.php?lang=es
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.reddit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.remotasks.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://replit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://resmine.com/Dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.resonancescience.org/library
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.rev.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://rollercoin.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://runkeeper.com/alvord
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cai.tools.sap/signup
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.safecreative.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sandbox.game/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.scolartic.com/inicio
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://screencast-o-matic.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.scribd.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.scribd.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://scribie.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://scrimba.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.serif.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://serversman.com/herreraecri-node/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.sharedtalk.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.shelfari.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.shellhub.io/register
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sicop.go.cr/index.jsp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.skillpages.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.skype.com/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://slack.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.slideshare.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.slideshare.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.smarterer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://socialrebel.co/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://soundcloud.com/cosmic-riders-852354746/tracks
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://soundcloud.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.sourceforge.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.Soziety.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.spreaker.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.sqlpass.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.squareup.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stablepool.io/cabinet
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stackoverflow.com/users/story/16882270
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stackskills.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.start.me/p/ZkjQdo/esteban-en-youtube
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.stormgain.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://streamelements.com/obslive
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.studypool.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://store.steampowered.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://suvmine.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.swagbucks.com/surveys
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sykes.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tagged.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.taringa.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.teamviewer.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://techdata.wd1.myworkdayjobs.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.techrepublic.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://deals.tecmint.com/user/purchases
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tecoloco.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://teletech.taleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.theodinproject.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://theresultscompanies.com/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://thetypingcat.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tiktok.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://timebucks.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tomedes.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.topbuzz.com/feed
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://marketplace.tracktion.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tradingview.com/chart/OzDtZ1wU/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tradinghomeinvestment.com/index.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.transcriptioncertificationinstitute.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trello.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tronfinance.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tronscan.org/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trxtron.site/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.truenorthtest.com/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.truetwit.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tsu.co
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ttscrla.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://aestudiosblog.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://honestlysublimeobject.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://liquidsmok.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.twitch.tv/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://twitpic.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.twitter.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.twitter.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tryeraser.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tutellus.com/mis-cursos/aprendo
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tryroll.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.ubdi.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ubid.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://ubuntuforums.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.ubuntu.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.udacity.com/course/viewer#!/c-ud730/l-6370362152/m-6379811817
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.udemy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.uhostall.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://aprende.uned.ac.cr/login/change_password.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://entornoestudiantil.uned.ac.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.unilever-ancam.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://unstoppabledomains.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wallet.uphold.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.upwork.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.usdminer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://usf-video.xyz/userarea.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://panel.validately.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://verbit.ai/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.videonotebook.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://alvarion.visualstudio.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.vidiq.com/auth/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.vimeo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.vmware.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.voices.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://my-learning.w3schools.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wakatime.com/settings/api-key
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wakedoge.io/account
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://waves.exchange/sign-up/email
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://waywithwords.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.websitepulse.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.weebly.com/app/home/users/133487505/sites/468031269718931081/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://courses.wesbos.com/account
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.westernunion.com/careers
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.wish.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://applieddigitalskills.withgoogle.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learndigital.withgoogle.com/digitalgarage/plan/in_progress
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.wix.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wordpress.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.workana.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://xasic.io/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.xmarks.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.xnxx.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.xodo.com/app/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://mail.yahoo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.yesstyle.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.youtube.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://youtube.com/c/lescifi
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.youtube.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.youreeeka.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.yumpu.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.zdnet.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://academy.zenva.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://writer.zoho.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.16personalities.com/profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.2freehosting.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://3commas.io/d
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.aa.com/AAdvantage/quickEnroll.do?
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.youracclaim.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.addthis.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://campus.abaenglish.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://independent.academia.edu/AlvaroHerrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://careers.accenture.com/cr-es/jobs/Pages/submit-resume.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://talentconnection.accenture.com/EN/Login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://acciontrabajo.co.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.acx.com/help/narrators/200484550
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.adrive.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://documentcloud.adobe.com/link/home/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.adultfinder.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.aeropostale.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.airtm.com/home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.aliexpress.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://alison.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.amazon.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://authorcentral.amazon.com/gp/landing?ie=UTF8&*Version*=1&*entries*=0
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.amazon.com/gp/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.ane.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://appetize.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.apple.com/itunes/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ascensionworks.tv
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://workhub.atexto.com/transcription/dashboard-user.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.atlassian.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://web.getaurox.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://elearning.avventa.com/moodle/login/change_password.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bac.net/bacsanjose/esp/banco/index.html
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.Backcountry.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://badgr.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://badoo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bancobcr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://publishers.basicattentiontoken.org/publishers/home?locale=en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://bbs.market/CRMAN/posts
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bbsoftware.com.uk
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.beatport.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://beersurveys.com/default.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://welcome.online.berklee.edu
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://betfury.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.binance.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://googlecerts.biginterview.com/members/curriculum
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://account.bit2me.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://bitbucket.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bitnami.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bityard.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://multiserviciosmahg.blogspot.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.brainly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://talk.brutal.app/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://btcmine.pw
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.btcnewz.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.buscojobs.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bybit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://dictionary.cambridge.org/translate/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.canvas.net/dashboard/in-progress?current_user_id=719537
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://capacitateparaelempleo.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://campus.chamilo.org/index.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.careercircle.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://castingwords.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://aissfa.ccss.sa.cr/afiliacion/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://rrhh.ccss.sa.cr/SIAE/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cex.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.chatsexocostarica.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.latinamerica.citibank.com/costarica/index.html
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://cindejobfair.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://ciudadempleo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.citi.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.clonewarsadventures.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wallet.cloudatcost.com/auth
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://codepen.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.codeproject.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.codewars.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coinbase.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coingecko.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinlist.co/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinmarketcap.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinstats.app/en/portfolio/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.computrabajo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.coopesana.com/home/sanfrancisco/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.copy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coursera.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://createspace.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.criptohunter.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://crowdsurfwork.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://crypto.com/exchange
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://merchant.crypto.com/users/sign_in
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cryptotabbrowser.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.cwcontrols.com/JobListings.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.cybrary.it/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dentavox.dentacoin.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://careers.deloitte.com/jobs/eng-global/apply/j/72932
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.deviantart.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://diib.com/app/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://discordapp.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://infinity.disney.com/es-419
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://disqus.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hub.docker.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.domainrightnow.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dozerg.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dreamtravelscr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dropbox.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.dualmine.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://autofaucet.dutchycorp.space/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dvlottery.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dxdy.finance/3MNOOOW
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://dyn.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://easyeda.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ebay.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ebuddy.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ecmining.club/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.eddiejaoude.io/course-github-profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.education.com/worksheets/?cid=11.2143
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.eduonix.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.edureka.co
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://courses.edx.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.efset.org/free-english-test/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://eifi.com/airdrop/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.elempleo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.elempleo.co.cr/empresas/index.asp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.elfinancierocr.com/pymes/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ematricula.ucr.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://empleo.ice.go.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.empleos.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.encuentra24.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.estrategiarh.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ethmine.cloud/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.expoempleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.jobs.experian.com/index.asp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.experian.taleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.facebook.com/alvord.coke
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.facebook.com/alvaro.herrera.777363
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.facebook.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://firefaucet.win
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://faucetpay.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://fbs.com/cabinet/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://esfbs.com/cabinet/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://fex.net/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.finalemusic.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.firstdatajobs.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.fiverr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.flickr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://forums.serif.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.foursquare.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://forvo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://free-tron.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://freebitco.in/?op=home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.freecodecamp.org/learn
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.freelancer.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://freesound.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://futuramaster.com/login/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://g.dev/estebanherrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.gametester.gg/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://geekguide.linuxjournal.com/user
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://exchange.gemini.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://gengo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.genymotion.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.getblend.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.github.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.gitlab.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.globalprofitsnet.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://glitch.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.gmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.gmrtranscription.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://goarbit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://developers.google.com/profile/u/107578574931364782050/edit
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://play.google.com/store?hl=en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Colab%20RDP/Colab%20RDP.ipynb#scrollTo=Q6bl1b0EifVG
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://gotranscript.com/transcription-jobs/quiz?language=english
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.grammarly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://en.gravatar.com/site/check/stv.herrera@gmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.grupoice.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.guru.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.hacienda.go.cr/scripts/criiiext.dll?UTILREQ=COMPRARED
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.hackerrank.com/skills-verification
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hi5.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://member.hide.me/en/?welcome=1
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hivemicro.com/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hobbiecode.teachable.com/courses/1402219/lectures/32206700
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://hola.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dashboard.honeygain.com/764sedqWopiL5
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hotmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hotmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://howtopronounce.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hp.com/go/jobs/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://cpanel.hostinger.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hubic.com/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.huobi.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cloud.ibm.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ibm.com/start
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://krb-sjobs.brassring.com/TGnewUI/Search/home/HomeWithPreLoad?PageType=JobDetails&partnerid=26059&siteid=5016&Areq=395120BR#SavedJobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://students.yourlearning.ibm.com/activity/URL-6E1401728D4A?channelId=CNL_LCB_1626893234857
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.icloud.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.idle-empire.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trader.iforex.com/webpl3/webtrader.html?view=2
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://imgur.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://imperiosdigitales.thinkific.com/enrollments
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ina.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.inavirtual.ed.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cr.indeed.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.instagram.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://intel.com/jobs/costarica
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://iqoption.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://jlcpcb.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cr.jobomas.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://jsfiddle.net/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://koding.com/R/zezen20
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.kobo.com/writinglife
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://kolotibablo.com/workers/start
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://kproxy.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://languageline.wd5.myworkdayjobs.com/en-US/LLS_Careers/userHome
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lared.tech/register
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lastpass.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://latium.org/freelancer-plans
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lcsc.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.leanpub.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://e-learning.life-global.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://letyshops.com/global
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.linkedin.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://linuxappstore.io/?fbclid=IwAR148udyAltDcRMpWZOfleIANZIUD0w2B6pmVZZkG7ZUBv8m0_tPuMkjmLg
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://linuxcounter.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.livemocha.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lobstr.co/authorization/signin/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://localbitcoins.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://member.lovecointoken.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.manpower.com.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.manpowerprofessional.com.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://shop.mashable.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://max.makerstudios.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://medium.com/@stv.herrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://megabonus.com/en/home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.meic.go.cr/index.php?option=com_content&view=article&id=346&Itemid=244
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://mega.co.nz
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.mentimeter.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.mercadolibre.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://metaloni.com/profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://docs.microsoft.com/en-us/learn/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.microsoftonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.microsoft.com/en-US/microsoft-365/microsoft-teams/group-chat-software
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.microsoftonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.microverse.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.midichords.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.modsecurity.com/downloads
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.monitor.us
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://jobview.monster.com/Apply/Apply.aspx?JobID=135186327
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.mql5.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://worker.mturk.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://musicbrainz.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.myaeropost.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.myebook.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.myfreecams.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.myfreepaysite.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.mysql.com/login/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://3m.wd1.myworkdayjobs.com/en-US/Search/job/Service-Desk-Support-Analyst_R01025960/apply/LinkedIn?source=&shared_id=
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://encore.wd1.myworkdayjobs.com/en-US/externalnew/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://techdata.wd1.myworkdayjobs.com/en-US/External/introduceYourself
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://myeasytronbot.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://mystnodes.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.ncsacademy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://campus.neetwork.com/courses/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://nermining.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.netacad.com/group/landing/v2/learn/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://neustar.wd5.myworkdayjobs.com/en-US/neustar-careers/job/Costa-Rica-Heredia
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.nextearth.io/auth/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learn.nexgent.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.nhatdistance.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.nike.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.no-ip.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://thenounproject.com/term/merkabah/16491/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://odysee.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://office.live.com/start/default.aspx?s=1
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.office.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://olx.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.oneamour.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://onlyfans.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://onlinebookclub.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://backpack.openbadges.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://openlibra.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://manage.openshift.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oracle.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learning.oreilly.com/home/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oreilly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ori.ucr.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.outlook.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oxforddictionaries.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.packtpub.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.paguertrading.com/panel/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ssl.panoramio.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://paidera.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://paxful.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.paya.one
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://payhip.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.payoneer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.paypal.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.paypal.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.pcbway.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.peopleperhour.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://phemex.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://picoworkers.com/jobs.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pinterest.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pg.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.plex.tv/sign-up/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cloud.pocketbook.digital/browser/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.powtoon.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://prezi.com/dashboard/next/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://prezi.com/dashboard/next/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.promerica.fi.cr/site/index.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://account.protonvpn.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.psigmaonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://pubhtml5.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://es.pornhub.com/signup
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pwcjobs.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://pypi.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.qa-world.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.queopinas.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://quickbooks.intuit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://quip.com/account/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.quora.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.rackspace.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.raidcall.com/index.php?lang=es
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.reddit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.remotasks.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://replit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://resmine.com/Dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.resonancescience.org/library
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.rev.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://rollercoin.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://runkeeper.com/alvord
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cai.tools.sap/signup
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.safecreative.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sandbox.game/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.scolartic.com/inicio
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://screencast-o-matic.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.scribd.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.scribd.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://scribie.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://scrimba.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.serif.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://serversman.com/herreraecri-node/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.sharedtalk.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.shelfari.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.shellhub.io/register
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sicop.go.cr/index.jsp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.skillpages.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.skype.com/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://slack.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.slideshare.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.slideshare.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.smarterer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://socialrebel.co/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://soundcloud.com/cosmic-riders-852354746/tracks
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://soundcloud.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.sourceforge.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.Soziety.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.spreaker.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.sqlpass.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.squareup.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stablepool.io/cabinet
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stackoverflow.com/users/story/16882270
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stackskills.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.start.me/p/ZkjQdo/esteban-en-youtube
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.stormgain.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://streamelements.com/obslive
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.studypool.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://store.steampowered.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://suvmine.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.swagbucks.com/surveys
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sykes.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tagged.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.taringa.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.teamviewer.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://techdata.wd1.myworkdayjobs.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.techrepublic.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://deals.tecmint.com/user/purchases
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tecoloco.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://teletech.taleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.theodinproject.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://theresultscompanies.com/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://thetypingcat.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tiktok.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://timebucks.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tomedes.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.topbuzz.com/feed
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://marketplace.tracktion.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tradingview.com/chart/OzDtZ1wU/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tradinghomeinvestment.com/index.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.transcriptioncertificationinstitute.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trello.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tronfinance.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tronscan.org/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trxtron.site/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.truenorthtest.com/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.truetwit.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tsu.co
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ttscrla.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://aestudiosblog.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://honestlysublimeobject.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://liquidsmok.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.twitch.tv/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://twitpic.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.twitter.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.twitter.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tryeraser.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tutellus.com/mis-cursos/aprendo
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tryroll.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.ubdi.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ubid.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://ubuntuforums.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.ubuntu.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.udacity.com/course/viewer#!/c-ud730/l-6370362152/m-6379811817
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.udemy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.uhostall.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://aprende.uned.ac.cr/login/change_password.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://entornoestudiantil.uned.ac.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.unilever-ancam.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://unstoppabledomains.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wallet.uphold.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.upwork.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.usdminer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://usf-video.xyz/userarea.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://panel.validately.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://verbit.ai/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.videonotebook.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://alvarion.visualstudio.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.vidiq.com/auth/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.vimeo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.vmware.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.voices.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://my-learning.w3schools.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wakatime.com/settings/api-key
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wakedoge.io/account
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://waves.exchange/sign-up/email
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://waywithwords.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.websitepulse.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.weebly.com/app/home/users/133487505/sites/468031269718931081/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://courses.wesbos.com/account
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.westernunion.com/careers
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.wish.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://applieddigitalskills.withgoogle.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learndigital.withgoogle.com/digitalgarage/plan/in_progress
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.wix.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wordpress.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.workana.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://xasic.io/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.xmarks.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.xnxx.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.xodo.com/app/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://mail.yahoo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.yesstyle.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.youtube.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://youtube.com/c/lescifi
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.youtube.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.youreeeka.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.yumpu.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.zdnet.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://academy.zenva.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://writer.zoho.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.16personalities.com/profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.2freehosting.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://3commas.io/d
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.aa.com/AAdvantage/quickEnroll.do?
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.youracclaim.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.addthis.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://campus.abaenglish.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://independent.academia.edu/AlvaroHerrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://careers.accenture.com/cr-es/jobs/Pages/submit-resume.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://talentconnection.accenture.com/EN/Login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://acciontrabajo.co.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.acx.com/help/narrators/200484550
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.adrive.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://documentcloud.adobe.com/link/home/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.adultfinder.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.aeropostale.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.airtm.com/home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.aliexpress.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://alison.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.amazon.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://authorcentral.amazon.com/gp/landing?ie=UTF8&*Version*=1&*entries*=0
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.amazon.com/gp/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.ane.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://appetize.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.apple.com/itunes/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ascensionworks.tv
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://workhub.atexto.com/transcription/dashboard-user.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.atlassian.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://web.getaurox.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://elearning.avventa.com/moodle/login/change_password.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bac.net/bacsanjose/esp/banco/index.html
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.Backcountry.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://badgr.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://badoo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bancobcr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://publishers.basicattentiontoken.org/publishers/home?locale=en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://bbs.market/CRMAN/posts
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bbsoftware.com.uk
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.beatport.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://beersurveys.com/default.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://welcome.online.berklee.edu
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://betfury.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.binance.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://googlecerts.biginterview.com/members/curriculum
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://account.bit2me.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://bitbucket.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.bitnami.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bityard.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://multiserviciosmahg.blogspot.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.brainly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://talk.brutal.app/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://btcmine.pw
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.btcnewz.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.buscojobs.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.bybit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://dictionary.cambridge.org/translate/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.canvas.net/dashboard/in-progress?current_user_id=719537
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://capacitateparaelempleo.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://campus.chamilo.org/index.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.careercircle.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://castingwords.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://aissfa.ccss.sa.cr/afiliacion/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://rrhh.ccss.sa.cr/SIAE/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cex.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.chatsexocostarica.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.latinamerica.citibank.com/costarica/index.html
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://cindejobfair.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://ciudadempleo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.citi.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.clonewarsadventures.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wallet.cloudatcost.com/auth
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://codepen.io/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.codeproject.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.codewars.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coinbase.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coingecko.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinlist.co/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinmarketcap.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://coinstats.app/en/portfolio/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.computrabajo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.coopesana.com/home/sanfrancisco/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.copy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.coursera.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://createspace.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.criptohunter.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://crowdsurfwork.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://crypto.com/exchange
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://merchant.crypto.com/users/sign_in
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cryptotabbrowser.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.cwcontrols.com/JobListings.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.cybrary.it/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dentavox.dentacoin.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://careers.deloitte.com/jobs/eng-global/apply/j/72932
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.deviantart.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://diib.com/app/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://discordapp.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://infinity.disney.com/es-419
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://disqus.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hub.docker.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.domainrightnow.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dozerg.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dreamtravelscr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dropbox.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.dualmine.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://autofaucet.dutchycorp.space/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.dvlottery.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dxdy.finance/3MNOOOW
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://dyn.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://easyeda.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ebay.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ebuddy.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ecmining.club/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.eddiejaoude.io/course-github-profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.education.com/worksheets/?cid=11.2143
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.eduonix.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.edureka.co
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://courses.edx.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.efset.org/free-english-test/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://eifi.com/airdrop/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.elempleo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.elempleo.co.cr/empresas/index.asp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.elfinancierocr.com/pymes/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ematricula.ucr.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://empleo.ice.go.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.empleos.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.encuentra24.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.estrategiarh.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ethmine.cloud/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.expoempleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.jobs.experian.com/index.asp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.experian.taleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.facebook.com/alvord.coke
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.facebook.com/alvaro.herrera.777363
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.facebook.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://firefaucet.win
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://faucetpay.io
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://fbs.com/cabinet/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://esfbs.com/cabinet/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://fex.net/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.finalemusic.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.firstdatajobs.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.fiverr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.flickr.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://forums.serif.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.foursquare.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://forvo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://free-tron.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://freebitco.in/?op=home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.freecodecamp.org/learn
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.freelancer.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://freesound.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://futuramaster.com/login/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://g.dev/estebanherrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.gametester.gg/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://geekguide.linuxjournal.com/user
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://exchange.gemini.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://gengo.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.genymotion.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.getblend.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.github.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.gitlab.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.globalprofitsnet.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://glitch.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.gmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.gmrtranscription.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://goarbit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://developers.google.com/profile/u/107578574931364782050/edit
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://play.google.com/store?hl=en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Colab%20RDP/Colab%20RDP.ipynb#scrollTo=Q6bl1b0EifVG
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://gotranscript.com/transcription-jobs/quiz?language=english
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.grammarly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://en.gravatar.com/site/check/stv.herrera@gmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.grupoice.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.guru.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.hacienda.go.cr/scripts/criiiext.dll?UTILREQ=COMPRARED
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.hackerrank.com/skills-verification
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hi5.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://member.hide.me/en/?welcome=1
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hivemicro.com/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hobbiecode.teachable.com/courses/1402219/lectures/32206700
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://hola.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://dashboard.honeygain.com/764sedqWopiL5
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hotmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hotmail.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://howtopronounce.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.hp.com/go/jobs/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://cpanel.hostinger.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://hubic.com/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.huobi.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cloud.ibm.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ibm.com/start
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://krb-sjobs.brassring.com/TGnewUI/Search/home/HomeWithPreLoad?PageType=JobDetails&partnerid=26059&siteid=5016&Areq=395120BR#SavedJobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://students.yourlearning.ibm.com/activity/URL-6E1401728D4A?channelId=CNL_LCB_1626893234857
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.icloud.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.idle-empire.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trader.iforex.com/webpl3/webtrader.html?view=2
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://imgur.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://imperiosdigitales.thinkific.com/enrollments
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ina.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.inavirtual.ed.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cr.indeed.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.instagram.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://intel.com/jobs/costarica
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://iqoption.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://jlcpcb.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cr.jobomas.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://jsfiddle.net/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://koding.com/R/zezen20
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.kobo.com/writinglife
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://kolotibablo.com/workers/start
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://kproxy.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://languageline.wd5.myworkdayjobs.com/en-US/LLS_Careers/userHome
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lared.tech/register
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lastpass.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://latium.org/freelancer-plans
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lcsc.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.leanpub.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://e-learning.life-global.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://letyshops.com/global
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.linkedin.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://linuxappstore.io/?fbclid=IwAR148udyAltDcRMpWZOfleIANZIUD0w2B6pmVZZkG7ZUBv8m0_tPuMkjmLg
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://linuxcounter.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.livemocha.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://lobstr.co/authorization/signin/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://localbitcoins.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://member.lovecointoken.org/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.manpower.com.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.manpowerprofessional.com.mx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://shop.mashable.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://max.makerstudios.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://medium.com/@stv.herrera
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://megabonus.com/en/home
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.meic.go.cr/index.php?option=com_content&view=article&id=346&Itemid=244
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://mega.co.nz
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.mentimeter.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.mercadolibre.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://metaloni.com/profile
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://docs.microsoft.com/en-us/learn/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.microsoftonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.microsoft.com/en-US/microsoft-365/microsoft-teams/group-chat-software
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.microsoftonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.microverse.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.midichords.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.modsecurity.com/downloads
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.monitor.us
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://jobview.monster.com/Apply/Apply.aspx?JobID=135186327
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.mql5.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://worker.mturk.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://musicbrainz.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.myaeropost.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.myebook.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.myfreecams.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.myfreepaysite.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.mysql.com/login/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://3m.wd1.myworkdayjobs.com/en-US/Search/job/Service-Desk-Support-Analyst_R01025960/apply/LinkedIn?source=&shared_id=
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://encore.wd1.myworkdayjobs.com/en-US/externalnew/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://techdata.wd1.myworkdayjobs.com/en-US/External/introduceYourself
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://myeasytronbot.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://mystnodes.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.ncsacademy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://campus.neetwork.com/courses/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://nermining.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.netacad.com/group/landing/v2/learn/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://neustar.wd5.myworkdayjobs.com/en-US/neustar-careers/job/Costa-Rica-Heredia
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.nextearth.io/auth/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learn.nexgent.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.nhatdistance.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.nike.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.no-ip.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://thenounproject.com/term/merkabah/16491/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://odysee.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://office.live.com/start/default.aspx?s=1
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.office.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://olx.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.oneamour.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://onlyfans.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://onlinebookclub.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://backpack.openbadges.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://openlibra.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://manage.openshift.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oracle.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learning.oreilly.com/home/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oreilly.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ori.ucr.ac.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.outlook.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.oxforddictionaries.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.packtpub.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.paguertrading.com/panel/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://ssl.panoramio.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://paidera.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://paxful.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.paya.one
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://payhip.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.payoneer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.paypal.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.paypal.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.pcbway.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.peopleperhour.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://phemex.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://picoworkers.com/jobs.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pinterest.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pg.co.cr
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.plex.tv/sign-up/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cloud.pocketbook.digital/browser/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.powtoon.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://prezi.com/dashboard/next/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://prezi.com/dashboard/next/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.promerica.fi.cr/site/index.aspx
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://account.protonvpn.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.psigmaonline.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://pubhtml5.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://es.pornhub.com/signup
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.pwcjobs.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://pypi.org/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.qa-world.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.queopinas.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://quickbooks.intuit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://quip.com/account/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.quora.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.rackspace.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.raidcall.com/index.php?lang=es
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.reddit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.remotasks.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://replit.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://resmine.com/Dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://es.resonancescience.org/library
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.rev.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://rollercoin.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://runkeeper.com/alvord
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://cai.tools.sap/signup
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.safecreative.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sandbox.game/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.scolartic.com/inicio
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://screencast-o-matic.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.scribd.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.scribd.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://scribie.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://scrimba.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.serif.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://serversman.com/herreraecri-node/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.sharedtalk.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.shelfari.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.shellhub.io/register
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sicop.go.cr/index.jsp
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.skillpages.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.skype.com/en/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://slack.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.slideshare.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.slideshare.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.smarterer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://socialrebel.co/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://soundcloud.com/cosmic-riders-852354746/tracks
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://soundcloud.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.sourceforge.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.Soziety.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.spreaker.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.sqlpass.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.squareup.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stablepool.io/cabinet
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stackoverflow.com/users/story/16882270
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://stackskills.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.start.me/p/ZkjQdo/esteban-en-youtube
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.stormgain.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://streamelements.com/obslive
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.studypool.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://store.steampowered.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://suvmine.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.swagbucks.com/surveys
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.sykes.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tagged.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.taringa.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.teamviewer.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://techdata.wd1.myworkdayjobs.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.techrepublic.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://deals.tecmint.com/user/purchases
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tecoloco.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://teletech.taleo.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.theodinproject.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://theresultscompanies.com/jobs
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://thetypingcat.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tiktok.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://timebucks.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tomedes.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.topbuzz.com/feed
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://marketplace.tracktion.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.tradingview.com/chart/OzDtZ1wU/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tradinghomeinvestment.com/index.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.transcriptioncertificationinstitute.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trello.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tronfinance.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://tronscan.org/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://trxtron.site/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.truenorthtest.com/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.truetwit.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.tsu.co
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ttscrla.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://aestudiosblog.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://honestlysublimeobject.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://liquidsmok.tumblr.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.twitch.tv/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://twitpic.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.twitter.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.twitter.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tryeraser.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tutellus.com/mis-cursos/aprendo
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.tryroll.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.ubdi.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.ubid.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://ubuntuforums.org
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://login.ubuntu.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.udacity.com/course/viewer#!/c-ud730/l-6370362152/m-6379811817
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.udemy.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.uhostall.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://aprende.uned.ac.cr/login/change_password.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://entornoestudiantil.uned.ac.cr/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.unilever-ancam.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://unstoppabledomains.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wallet.uphold.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.upwork.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.usdminer.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://usf-video.xyz/userarea.php
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://panel.validately.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://verbit.ai/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.videonotebook.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://alvarion.visualstudio.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://app.vidiq.com/auth/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.vimeo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.vmware.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.voices.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://my-learning.w3schools.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wakatime.com/settings/api-key
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wakedoge.io/account
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://waves.exchange/sign-up/email
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://waywithwords.net
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.websitepulse.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.weebly.com/app/home/users/133487505/sites/468031269718931081/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://courses.wesbos.com/account
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.westernunion.com/careers
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.wish.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://applieddigitalskills.withgoogle.com/dashboard
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://learndigital.withgoogle.com/digitalgarage/plan/in_progress
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.wix.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://wordpress.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.workana.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://xasic.io/login
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.xmarks.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.xnxx.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.xodo.com/app/#/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://mail.yahoo.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://www.yesstyle.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.youtube.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://youtube.com/c/lescifi
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files www.youtube.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-filesvwww.youreeeka.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.yumpu.com/en
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files http://www.zdnet.com/
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://academy.zenva.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
wget -r -l1 --directory-prefix=$COMMBASE/Commbase/honeygain/wget-files https://writer.zoho.com
sleep 30s #sleep 30 seconds
pkill wget
rm -rf wget-files/* .wget-hsts wget-log
#
#
#
echo List finished!
exit 0
