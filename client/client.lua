local samWesteTyp = 9
local samWesteID = 15
local samTextureID = 2

local alinaWesteTyp = 9
local alinaWesteID = 30
local alinaTextureID = 3

local hasWeste = false 

Citizen.CreateThread(function()
    while true do 
        local ped = PlayerPedId()
        if GetPedArmour(ped) > 0.0 and not hasWeste then 
            hasWeste = true 
            local skin = GetEntityModel(ped)

            if skin == GetHashKey("mp_m_freemode_01") then 
                SetPedComponentVariation(ped, samWesteTyp, samWesteID, samTextureID, 2)

            elseif skin == GetHashKey("mp_f_freemode_01") then 
                SetPedComponentVariation(ped, alinaWesteTyp, alinaWesteID, alinaTextureID, 2)
            end

        elseif GetPedArmour(ped) <= 0.0 and hasWeste then 
            hasWeste = false 
            local skin = GetEntityModel(ped)
            if skin == GetHashKey("mp_m_freemode_01") then 
                SetPedComponentVariation(ped, samWesteTyp, 0, 0, 2)

            elseif skin == GetHashKey("mp_f_freemode_01") then 
                SetPedComponentVariation(ped, alinaWesteTyp, 0, 0, 2)
            end
        end
        Citizen.Wait(500)
    end
end)