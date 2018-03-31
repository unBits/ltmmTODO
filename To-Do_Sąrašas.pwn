/****************************** uBits dalis (alikti update, planuojami update ir pnš.) *******************************/

* Leisti rašyti ilgesnes žinutes (/ac, /c, /pm ir t.t.). ( + )
* /stuck pakeltų mašiną į viršų, naudot galima kas 10 sek. (kad išvengt problemų su įsibėgėjimu ir bandymu peršokt kliūtis - mašinos velocity statyt į 0). ( + )
* Pridėti prilipdomą objektą iš swat rinkinio atskirai (raudoną liepsną). ( + )
* Pataikius į žaidėją su šaunamuoju ginklu pasigirs garsas, kurio nustatymus, t.y. įjungta/išjungta bus galima pakeisti su komanda /hitsound. ( + )
* Race tipo misijose paėmus pirmą CP pranešt žaidėjui apie /fix ir /flip komandas (kaip kad parkour misijose apie /lcp). ( + )
* Parkour tipo misijose, paėmus pirmą CP, pakeisti gametext stilių į subtitrų stilių. ( + )
* Pakeisti skin rinkimosi vietą. ( + )
* Uždraustas Drive-By su Deagle. ( + )
* Rašyti kiek liko iki kito achievement. -
* Lentynių misijose išjungtas mašinų colls. -
* Anti-Spawn kill. -
* Besikeičianti mašinos spalva VIP žaidėjams. Komanda - /vcc. ( + )

/* Misijų pakeitimai/trinimai/pridėjimai: */
* Begalė įvairių misijų patobulinimų, pakeitimų (pradedant nuo logiškesnių transp. priemonių, iki map klaidų ištaisymo). ( + )
* Hitman misijoje tas pats žaidėjas nebus renkamas antrą kartą. ( + )
* Skirtingų ginklų set'ai DM/TDM misijose. ( + )
* Hunt the Osama pakeista teroristų spawno pasisukimas, rodoma Osamos gyvybės. ( + )
* Air raid misija prasidės tik esant 4 ar daugiau žaidėjų. ( + )
* Destruction of laboratory puolėjams įdėti arčiau spawn'ą. ( + )
* Steal The Truck armijos spawne normaliai sudėtas transportas. ( + )
* Jump sutvarkytos grotos, nes dauguma žaidėjų ne visada supranta kaip ant jų užsokt. ( + )
* Prasidėjus Police Chase tipo misijai mini-map'as mirksės raudonai/mėlynai (panašiai kaip per GTA V). ( + )
* Hydra War misija perkelta į SF. ( + )
* Pašalinta In the Hell misiją, nes dėl samp sync'o normaliai nesiima HP. ( + )
* Pašalinta Dolphin race (skundai iš žaidėjų pusės). ( + )
* Pašalinta Chelyabinsk misiją (nėra realaus tikslo, tik stovėt kampe). ( + )
* Pašalinta Mower misija (per lėta :D). ( + )
* Pašalinta Medicopter misija. ( + )
* Pašalinta Railway misija. ( + )
* Pašalinta Grand Theft Auto misija (beprasmis freeroam'as, reikia arba keisti idėją, arba visai atsisakyt jos). ( + )
* Nauja race misija - Sunset, transportas - Infernus, vieta - netoli LV (FC, LB, EQ apylinkės). ( + )
* Nauja multi car steal misija - Wang Cars. ( + )
* Nauja police chase tipo misija - Most Wanted. ( + )
* Zombie tipo misijose tapus zombiu rodyti kitus zombius minimape. -
* Hitman misijoje žaidėjas, jam mirus arba prisijungus, bus spawninamas arčiausiai esančioje prie taikinio pozicijoje (tačiau ne visai prie pat taikinio). -
* Police Chase misijose žaidėjas, jam mirus arba prisijungus, bus spawninamas arčiausiai esančioje prie taikinio pozicijoje (tačiau ne visai prie pat taikinio). -

zmessage - https://github.com/Open-GTO/zmessage/releases ( + )
no-reload - https://github.com/samp-anti-cheat/no-reload ( + )
rapid-fire - https://github.com/samp-anti-cheat/rapid-fire ( + )
Pawn.RakNet - https://github.com/urShadow/Pawn.RakNet/releases ( + )
Proper-attachments-fix - https://github.com/Jelly23/Proper-attachments-fix ( + )
OnPlayerTurnUpsideDown - https://github.com/Jelly23/OnPlayerTurnUpsideDown ( + )
Fix surfing invisible - https://github.com/urShadow/Pawn.RakNet/wiki/Fix-surfing-invisible ( + )
Fix aimZ invisible - https://github.com/urShadow/Pawn.RakNet/wiki/Fix-aimZ-invisible ( + )

/********************************** Laggerio dalis ***********************************/
* Išmaišyti spawnus Derby tipo misijose.
* Mirus lenktynių metu grąžinti į paskutinį ar priešpaskutinį CP (galima padaryti tai už tam tikrą pinigų/taškų/kreditų sumą) (jei negana to, galima padaryti laikmatį iki respawno).
* Anti AFK (bent jau Plant The Bomb misijose).
* Pakeisti NOS sistemą. NOS turėtų progress bar, laikant KEY_FIRE NOS kiekis mažėtų, atleidus NOS išsijungtu ir kiekis nustotų mažėti (galbūt apriboti NOS pirkimą).
* Discord Connector.
* Kreditų pirkimas neatsijungus.
* Pašalinti restartus.
* Steal The Car tipo misijose neleisti judinti tuščios transporto priemonės (http://wiki.sa-mp.com/wiki/OnUnoccupiedVehicleUpdate).
* Lenktynėse, būnant transporto priemonėje, paspaudus W tarp 1 ir GO duoti žaidėjui NOS.

AntiVehicleSpawn - https://github.com/urShadow/Pawn.RakNet/wiki/AntiVehicleSpawn
ShowPlayerOnScoreBoard - http://forum.sa-mp.com/showpost.php?p=4001667&postcount=184
// IsPlayerPaused (iš weapon-config.inc (https://github.com/oscar-broman/samp-weapon-config))
static s_LastUpdate[MAX_PLAYERS] = {-1, ...};

public OnPlayerConnect(playerid)
{
	s_LastUpdate[playerid] = GetTickCount();
	return 1;
}

public OnPlayerSpawn(playerid)
{
	s_LastUpdate[playerid] = GetTickCount();
	return 1;
}

public OnPlayerUpdate(playerid)
{
	s_LastUpdate[playerid] = GetTickCount();
	return 1;
}

static IsPlayerPaused(playerid)
{
	return (GetTickCount() - s_LastUpdate[playerid] > 2000);
}
