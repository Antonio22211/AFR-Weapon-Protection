-- PAID CHEAP ANTICHEAT
-- https://discord.gg/XUNpKEpVFp

local banList = LoadResourceFile(GetCurrentResourceName(), "bans.json") or "{}"
banList = json.decode(banList)

RegisterServerEvent('afr:checkGuns')
AddEventHandler('afr:checkGuns', function()
    local source = source;
    local ped = GetPlayerPed(source);
    for k,v in pairs(Config.blacklistedWeapons) do
      if GetSelectedPedWeapon(ped) == GetHashKey(v) then
        banPlayer(source,''..Config.banMessage..' [ '..v..' ]');
      end;
    end;
end);

RegisterServerEvent('afr:ban')
AddEventHandler('afr:ban', function(weapon)
    local source = source;
    banPlayer(source,''..Config.banMessage..' [ '..weapon..' ]');
end);

function banPlayer(source,reason)
    local licenses = GetPlayerIdentifiers(source);
    local identifier = getRockstarId(licenses);
    local timestamp = os.time()
    local formattedDate = os.date("%Y-%m-%d %H:%M:%S", timestamp)
    banList[identifier] = {reason=reason,expiry='Never'};
    SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(banList), -1);
    DropPlayer(source,Config.banMessage);
    local a={["color"]=65280,["title"]='AFR-AC',["description"]='**'..GetPlayerName(source)..'** used a blacklisted weapon. \n Ban message : '..reason..'',["footer"]={["text"]=formattedDate},fields={{name='Username',value=GetPlayerName(source),inline=true},{name='User Source',value=source,inline=true},{name='Ping',value=GetPlayerPing(source),inline=true},{name='License',value='||'..identifier..'||',inline=true}}}PerformHttpRequest(Config.discordLogs,function(b,c,d)end,'POST',json.encode({username='AFR PROTECTION',embeds={a}}),{['Content-Type']='application/json'})
end;

function getRockstarId(licenses)
for a,b in pairs(licenses)do if b:find("license:")then return b end end
end;

function isBanned(license)
SaveResourceFile(GetCurrentResourceName(),"bans.json",json.encode(banList),-1)if banList[license]~=nil then return true else return false end
end

AddEventHandler("playerConnecting", function(name, setMessage, deferrals)
deferrals.defer()deferrals.update('Your data is being processed...')local a=getRockstarId(GetPlayerIdentifiers(source))if isBanned(a)then deferrals.done('[AFR-PROTECTION] You are banned from this server \n Reason : '..banList[a].reason..' \n')else deferrals.done()end
end)

-- PAID CHEAP ANTICHEAT
-- https://discord.gg/XUNpKEpVFp